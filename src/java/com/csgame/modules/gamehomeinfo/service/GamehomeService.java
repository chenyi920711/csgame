/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.modules.gamehomeinfo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.csgame.common.persistence.Page;
import com.csgame.common.service.CrudService;
import com.csgame.modules.gamehomeinfo.entity.Gamehome;
import com.csgame.modules.gamehomeinfo.dao.GamehomeDao;

/**
 * 游戏房间管理Service
 * @author cy
 * @version 2018-08-15
 */
@Service
@Transactional(readOnly = true)
public class GamehomeService extends CrudService<GamehomeDao, Gamehome> {


	@Autowired
	private GamehomeDao gamehome;
	
	public Gamehome get(String id) {
		return super.get(id);
	}
	
	public List<Gamehome> findList(Gamehome gamehome) {
		return super.findList(gamehome);
	}
	
	public Page<Gamehome> findPage(Page<Gamehome> page, Gamehome gamehome) {
		return super.findPage(page, gamehome);
	}
	
	@Transactional(readOnly = false)
	public void save(Gamehome gamehome) {
		super.save(gamehome);
	}
	
	@Transactional(readOnly = false)
	public void delete(Gamehome gamehome) {
		super.delete(gamehome);
	}
	
	@Transactional(readOnly = false)
	public void settmapid(Map<String, String> ma){
		gamehome.settmapid(ma);
	}
	
	@Transactional(readOnly = false)
	public void settromm(Gamehome ma){
		gamehome.settromm(ma);
	}

	@Transactional(readOnly = false)
	public void srthomestatus(Gamehome ma){
		gamehome.srthomestatus(ma);
	}	
}