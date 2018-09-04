/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.modules.equip.service.equipment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.csgame.common.persistence.Page;
import com.csgame.common.service.CrudService;
import com.csgame.modules.equip.entity.equipment.StoreEquipment;
import com.csgame.modules.equip.dao.equipment.StoreEquipmentDao;

/**
 * 设备增删改查Service
 * @author xlq
 * @version 2018-08-15
 */
@Service
@Transactional(readOnly = true)
public class StoreEquipmentService extends CrudService<StoreEquipmentDao, StoreEquipment> {

	@Autowired
	StoreEquipmentDao storeEquipmentDao;
	
	public StoreEquipment get(String id) {
		return super.get(id);
	}
	
	public List<StoreEquipment> findList(StoreEquipment storeEquipment) {
		return super.findList(storeEquipment);
	}
	
	public Page<StoreEquipment> findPage(Page<StoreEquipment> page, StoreEquipment storeEquipment) {
		return super.findPage(page, storeEquipment);
	}
	
	@Transactional(readOnly = false)
	public void save(StoreEquipment storeEquipment) {
		super.save(storeEquipment);
	}
	
	@Transactional(readOnly = false)
	public void delete(StoreEquipment storeEquipment) {
		super.delete(storeEquipment);
	}
	
	@Transactional(readOnly = false)
	public void changeStatus(StoreEquipment storeEquipment) {
		// TODO Auto-generated method stub
		storeEquipmentDao.changeStatus(storeEquipment);
	}
	@Transactional(readOnly = false)
	public void changeStoreno(StoreEquipment storeEquipment) {
		// TODO Auto-generated method stub
		storeEquipmentDao.changeStoreno(storeEquipment);
	}
}