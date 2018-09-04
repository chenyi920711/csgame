package com.csgame.common.utils;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;
/**
 * @作者 大胖老师
 * @描述 动态切换数据源，只能在action进行切换
 * 例如DynamicDataSource.setDbSource(数据源名称);
 * 动态切换数据库类型，用于查询分页拦截器
 * 例如DynamicDataSource.setDbType(数据库类型);
 */
public class DynamicDataSource extends AbstractRoutingDataSource {

	private static ThreadLocal<String> dbSourceHolder = new ThreadLocal<>();//数据源线程变量

	private static ThreadLocal<String> dbTypeHolder = new ThreadLocal<>();//数据库类型线程变量
	
	public void setDbSource(String str) {
		dbSourceHolder.set(str);
	}

	public static Object getDBSource() {
		return dbSourceHolder.get();
	}

	public void setDbType(String str) {
		dbTypeHolder.set(str);
	}

	public static Object getDBType() {
		return dbTypeHolder.get();
	}

	@Override
	protected Object determineCurrentLookupKey() {
		return getDBSource();
	}

}
