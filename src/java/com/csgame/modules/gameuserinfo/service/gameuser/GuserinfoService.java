/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.modules.gameuserinfo.service.gameuser;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.csgame.common.persistence.Page;
import com.csgame.common.service.CrudService;
import com.csgame.modules.gameuserinfo.entity.gameuser.Guserinfo;
import com.csgame.modules.gameuserinfo.dao.gameuser.GuserinfoDao;

/**
 * 游戏玩家Service
 * @author cy
 * @version 2018-09-11
 */
@Service
@Transactional(readOnly = true)
public class GuserinfoService extends CrudService<GuserinfoDao, Guserinfo> {

	public Guserinfo get(String id) {
		return super.get(id);
	}
	
	public List<Guserinfo> findList(Guserinfo guserinfo) {
		return super.findList(guserinfo);
	}
	
	public Page<Guserinfo> findPage(Page<Guserinfo> page, Guserinfo guserinfo) {
		return super.findPage(page, guserinfo);
	}
	
	@Transactional(readOnly = false)
	public void save(Guserinfo guserinfo) {
		super.save(guserinfo);
	}
	
	@Transactional(readOnly = false)
	public void delete(Guserinfo guserinfo) {
		super.delete(guserinfo);
	}
	
}