/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.test.dao;

import com.csgame.common.persistence.TreeDao;
import com.csgame.common.persistence.annotation.MyBatisDao;
import com.csgame.test.entity.TestTree;

/**
 * 树结构生成DAO接口
 * @author xla
 * @version 2015-04-06
 */
@MyBatisDao
public interface TestTreeDao extends TreeDao<TestTree> {
	
}