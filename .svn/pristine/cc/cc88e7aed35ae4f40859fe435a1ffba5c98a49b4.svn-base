/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.modules.gmoduleinfo.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.csgame.common.persistence.Page;
import com.csgame.common.service.CrudService;
import com.csgame.modules.gmoduleinfo.entity.Gamemodutype;
import com.csgame.modules.gmoduleinfo.dao.GamemodutypeDao;

/**
 * 游戏模式管理Service
 * @author cy
 * @version 2018-08-14
 */
@Service
@Transactional(readOnly = true)
public class GamemodutypeService extends CrudService<GamemodutypeDao, Gamemodutype> {

	public Gamemodutype get(String id) {
		return super.get(id);
	}
	
	public List<Gamemodutype> findList(Gamemodutype gamemodutype) {
		return super.findList(gamemodutype);
	}
	
	public Page<Gamemodutype> findPage(Page<Gamemodutype> page, Gamemodutype gamemodutype) {
		return super.findPage(page, gamemodutype);
	}
	
	@Transactional(readOnly = false)
	public void save(Gamemodutype gamemodutype) {
		super.save(gamemodutype);
	}
	
	@Transactional(readOnly = false)
	public void delete(Gamemodutype gamemodutype) {
		super.delete(gamemodutype);
	}
	
}