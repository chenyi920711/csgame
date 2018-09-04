/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.common.persistence.interceptor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.ibatis.executor.ErrorContext;
import org.apache.ibatis.executor.ExecutorException;
import org.apache.ibatis.logging.Log;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.mapping.ParameterMode;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.property.PropertyTokenizer;
import org.apache.ibatis.scripting.xmltags.ForEachSqlNode;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.type.TypeHandler;
import org.apache.ibatis.type.TypeHandlerRegistry;

import com.csgame.common.Const.Const;
import com.csgame.common.config.Global;
import com.csgame.common.persistence.Page;
import com.csgame.common.persistence.dialect.Dialect;
import com.csgame.common.utils.DynamicDataSource;
import com.csgame.common.utils.Reflections;
import com.csgame.common.utils.StringUtils;

/**
 * SQL工具类
 * 
 * @author poplar.yfyang / xla
 * @version 2013-8-28
 */
public class SQLHelper {

	/**
	 * 对SQL参数(?)设值,参考org.apache.ibatis.executor.parameter.
	 * DefaultParameterHandler
	 *
	 * @param ps
	 *            表示预编译的 SQL 语句的对象。
	 * @param mappedStatement
	 *            MappedStatement
	 * @param boundSql
	 *            SQL
	 * @param parameterObject
	 *            参数对象
	 * @throws java.sql.SQLException
	 *             数据库异常
	 */
	@SuppressWarnings("unchecked")
	public static void setParameters(PreparedStatement ps, MappedStatement mappedStatement, BoundSql boundSql,
			Object parameterObject) throws SQLException {
		ErrorContext.instance().activity("setting parameters").object(mappedStatement.getParameterMap().getId());
		List<ParameterMapping> parameterMappings = boundSql.getParameterMappings();
		if (parameterMappings != null) {
			Configuration configuration = mappedStatement.getConfiguration();
			TypeHandlerRegistry typeHandlerRegistry = configuration.getTypeHandlerRegistry();
			MetaObject metaObject = parameterObject == null ? null : configuration.newMetaObject(parameterObject);
			for (int i = 0; i < parameterMappings.size(); i++) {
				ParameterMapping parameterMapping = parameterMappings.get(i);
				if (parameterMapping.getMode() != ParameterMode.OUT) {
					Object value;
					String propertyName = parameterMapping.getProperty();
					PropertyTokenizer prop = new PropertyTokenizer(propertyName);
					if (parameterObject == null) {
						value = null;
					} else if (typeHandlerRegistry.hasTypeHandler(parameterObject.getClass())) {
						value = parameterObject;
					} else if (boundSql.hasAdditionalParameter(propertyName)) {
						value = boundSql.getAdditionalParameter(propertyName);
					} else if (propertyName.startsWith(ForEachSqlNode.ITEM_PREFIX)
							&& boundSql.hasAdditionalParameter(prop.getName())) {
						value = boundSql.getAdditionalParameter(prop.getName());
						if (value != null) {
							value = configuration.newMetaObject(value)
									.getValue(propertyName.substring(prop.getName().length()));
						}
					} else {
						value = metaObject == null ? null : metaObject.getValue(propertyName);
					}
					@SuppressWarnings("rawtypes")
					TypeHandler typeHandler = parameterMapping.getTypeHandler();
					if (typeHandler == null) {
						throw new ExecutorException("There was no TypeHandler found for parameter " + propertyName
								+ " of statement " + mappedStatement.getId());
					}
					typeHandler.setParameter(ps, i + 1, value, parameterMapping.getJdbcType());
				}
			}
		}
	}

	/**
	 * 查询总纪录数
	 * 
	 * @param sql
	 *            SQL语句
	 * @param connection
	 *            数据库连接
	 * @param mappedStatement
	 *            mapped
	 * @param parameterObject
	 *            参数
	 * @param boundSql
	 *            boundSql
	 * @return 总记录数
	 * @throws SQLException
	 *             sql查询错误
	 */
	public static int getCount(final String sql, final Connection connection, final MappedStatement mappedStatement,
			final Object parameterObject, final BoundSql boundSql, Log log) throws SQLException {
		String dbName = getDbType();
		final String countSql;
		if (Const.DbType.ORACLE.equals(dbName)) {
			countSql = "select count(1) from (" + sql + ") tmp_count";
		} else {
			countSql = "select count(1) from (" + removeOrders(sql) + ") tmp_count";
			// countSql = "select count(1) " + removeSelect(removeOrders(sql));
		}
		Connection conn = connection;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			if (log.isDebugEnabled()) {
				log.debug("COUNT SQL: "
						+ StringUtils.replaceEach(countSql, new String[] { "\n", "\t" }, new String[] { " ", " " }));
			}
			if (conn == null) {
				conn = mappedStatement.getConfiguration().getEnvironment().getDataSource().getConnection();
			}
			ps = conn.prepareStatement(countSql);
			BoundSql countBS = new BoundSql(mappedStatement.getConfiguration(), countSql,
					boundSql.getParameterMappings(), parameterObject);
			// 解决MyBatis 分页foreach 参数失效 start
			if (Reflections.getFieldValue(boundSql, "metaParameters") != null) {
				MetaObject mo = (MetaObject) Reflections.getFieldValue(boundSql, "metaParameters");
				Reflections.setFieldValue(countBS, "metaParameters", mo);
			}
			// 解决MyBatis 分页foreach 参数失效 end
			SQLHelper.setParameters(ps, mappedStatement, countBS, parameterObject);
			rs = ps.executeQuery();
			int count = 0;
			if (rs.next()) {
				count = rs.getInt(1);
			}
			return count;
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
	}

	/**
	 * 根据数据库方言，生成特定的分页sql
	 * 
	 * @param sql
	 *            Mapper中的Sql语句
	 * @param page
	 *            分页对象
	 * @param dialect
	 *            方言类型
	 * @return 分页SQL
	 */
	public static String generatePageSql(String sql, Page<Object> page, Dialect dialect) {
		if (dialect.supportsLimit()) {
			return dialect.getLimitString(sql, page.getFirstResult(), page.getMaxResults());
		} else {
			return sql;
		}
	}

	/**
	 * 去除qlString的select子句。
	 * 
	 * @param hql
	 * @return
	 */
	@SuppressWarnings("unused")
	private static String removeSelect(String qlString) {
		int beginPos = qlString.toLowerCase().indexOf("from");
		return qlString.substring(beginPos);
	}

	/**
	 * 去除hql的orderBy子句。
	 * 
	 * @param hql
	 * @return
	 */
	@SuppressWarnings("unused")
	private static String removeOrders(String qlString) {
		Pattern p = Pattern.compile("order\\s*by[\\w|\\W|\\s|\\S]*", Pattern.CASE_INSENSITIVE);
		Matcher m = p.matcher(qlString);
		StringBuffer sb = new StringBuffer();
		while (m.find()) {
			m.appendReplacement(sb, "");
		}
		m.appendTail(sb);
		return sb.toString();
	}

	/**
	 * 动态获取数据库类型
	 * 
	 * @param qlString
	 * @return
	 */
	public static String getDbType() {
		String dbType = (String) DynamicDataSource.getDBType();
		if (org.apache.commons.lang3.StringUtils.isNotEmpty(dbType)) {
			return dbType;
		} else {
			return Global.getConfig("jdbc.type");
		}
	}

	/**
	 * 动态获取数据库方言
	 * 
	 * @param qlString
	 * @return
	 */
	public static Dialect getDbDialog() {
		String dbType = getDbType();
		if (Const.DbType.DB2.equals(dbType)) {
			return Const.DbDialect.DB2;
		} else if (Const.DbType.DERBY.equals(dbType)) {
			return Const.DbDialect.DERBY;
		} else if (Const.DbType.H2.equals(dbType)) {
			return Const.DbDialect.H2;
		} else if (Const.DbType.HSQL.equals(dbType)) {
			return Const.DbDialect.HSQL;
		} else if (Const.DbType.MYSQL.equals(dbType)) {
			return Const.DbDialect.MYSQL;
		} else if (Const.DbType.ORACLE.equals(dbType)) {
			return Const.DbDialect.ORACLE;
		} else if (Const.DbType.POSTGRE.equals(dbType)) {
			return Const.DbDialect.POSTGRE;
		} else if (Const.DbType.MSSQL.equals(dbType) || "sqlserver".equals(dbType)) {
			return Const.DbDialect.MSSQL;
		} else if (Const.DbType.SYBASE.equals(dbType)) {
			return Const.DbDialect.SYBASE;
		}else{
			throw new RuntimeException("mybatis dialect error.");
		}
	}

}
