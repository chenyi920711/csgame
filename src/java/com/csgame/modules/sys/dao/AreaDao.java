/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.modules.sys.dao;

import com.csgame.common.persistence.TreeDao;
import com.csgame.common.persistence.annotation.MyBatisDao;
import com.csgame.modules.sys.entity.Area;

/**
 * 区域DAO接口
 * @author xla
 * @version 2014-05-16
 */
@MyBatisDao
public interface AreaDao extends TreeDao<Area> {
	
}
