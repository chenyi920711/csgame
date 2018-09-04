/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.modules.equip.dao.equipment;

import com.csgame.common.persistence.CrudDao;
import com.csgame.common.persistence.annotation.MyBatisDao;
import com.csgame.modules.equip.entity.equipment.StoreEquipment;

/**
 * 设备增删改查DAO接口
 * @author xlq
 * @version 2018-08-15
 */
@MyBatisDao
public interface StoreEquipmentDao extends CrudDao<StoreEquipment> {

	void changeStatus(StoreEquipment storeEquipment);
	void changeStoreno(StoreEquipment storeEquipment);
	
}