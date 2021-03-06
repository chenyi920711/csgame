/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.modules.gen.dao;

import com.csgame.common.persistence.CrudDao;
import com.csgame.common.persistence.annotation.MyBatisDao;
import com.csgame.modules.gen.entity.GenTemplate;

/**
 * 代码模板DAO接口
 * @author xla
 * @version 2013-10-15
 */
@MyBatisDao
public interface GenTemplateDao extends CrudDao<GenTemplate> {
	
}
