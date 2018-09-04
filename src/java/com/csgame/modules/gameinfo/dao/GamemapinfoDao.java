/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.modules.gameinfo.dao;

import java.util.List;
import java.util.Map;

import com.csgame.common.persistence.CrudDao;
import com.csgame.common.persistence.annotation.MyBatisDao;
import com.csgame.modules.gameinfo.entity.Gamemapinfo;


/**
 * 游戏地图管理DAO接口
 * @author cy
 * @version 2018-08-10
 */
@MyBatisDao
public interface GamemapinfoDao extends CrudDao<Gamemapinfo> {
	
	public List<Map<String, String>> seleshopmap(Map<String, String> ma);
	
}