/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.modules.gamehomeinfo.dao;

import java.util.Map;

import com.csgame.common.persistence.CrudDao;
import com.csgame.common.persistence.annotation.MyBatisDao;
import com.csgame.modules.gamehomeinfo.entity.Gamehome;
import com.sun.tools.javac.util.List;

/**
 * 游戏房间管理DAO接口
 * @author cy
 * @version 2018-08-15
 */
@MyBatisDao
public interface GamehomeDao extends CrudDao<Gamehome> {
	
	public void settmapid(Map<String, String> ma);
	public void settromm(Gamehome ma);
	public void srthomestatus(Gamehome ma);
}