/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.modules.gameuserinfo.dao.gameuser;

import com.csgame.common.persistence.CrudDao;
import com.csgame.common.persistence.annotation.MyBatisDao;
import com.csgame.modules.gameuserinfo.entity.gameuser.Guserinfo;

/**
 * 游戏玩家DAO接口
 * @author cy
 * @version 2018-09-11
 */
@MyBatisDao
public interface GuserinfoDao extends CrudDao<Guserinfo> {
	
}