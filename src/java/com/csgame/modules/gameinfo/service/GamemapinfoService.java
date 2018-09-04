/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.modules.gameinfo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.csgame.common.persistence.Page;
import com.csgame.common.service.CrudService;
import com.csgame.modules.gameinfo.entity.Gamemapinfo;
import com.csgame.modules.gameinfo.dao.GamemapinfoDao;

/**
 * 游戏地图管理Service
 * @author cy
 * @version 2018-08-10
 */
@Service
@Transactional(readOnly = true)
public class GamemapinfoService extends CrudService<GamemapinfoDao, Gamemapinfo> {

	@Autowired
	private  GamemapinfoDao gameinfodao;
	
	public Gamemapinfo get(String id) {
		return super.get(id);
	}
	
	public List<Gamemapinfo> findList(Gamemapinfo gamemapinfo) {
		return super.findList(gamemapinfo);
	}
	
	public Page<Gamemapinfo> findPage(Page<Gamemapinfo> page, Gamemapinfo gamemapinfo) {
		return super.findPage(page, gamemapinfo);
	}
	
	@Transactional(readOnly = false)
	public void save(Gamemapinfo gamemapinfo) {
		super.save(gamemapinfo);
	}
	
	@Transactional(readOnly = false)
	public void delete(Gamemapinfo gamemapinfo) {
		super.delete(gamemapinfo);
	}
	
	@Transactional(readOnly = false)
	public List<Map<String, String>> seleshopmap(Map<String, String> ma){
		return gameinfodao.seleshopmap(ma);
	}
	
}