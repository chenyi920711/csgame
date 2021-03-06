/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.modules.storepay.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.csgame.common.persistence.Page;
import com.csgame.common.service.CrudService;
import com.csgame.modules.storepay.entity.StorePay;
import com.csgame.modules.storepay.dao.StorePayDao;

/**
 * 门店充值Service
 * @author wxf
 * @version 2018-08-16
 */
@Service
@Transactional(readOnly = true)
public class StorePayService extends CrudService<StorePayDao, StorePay> {

	@Autowired
	private StorePayDao storePayDao;
	
	public StorePay get(String id) {
		return super.get(id);
	}
	
	public List<StorePay> findList(StorePay storePay) {
		return super.findList(storePay);
	}
	
	public Page<StorePay> findPage(Page<StorePay> page, StorePay storePay) {
		return super.findPage(page, storePay);
	}
	
	@Transactional(readOnly = false)
	public void save(StorePay storePay) {
		super.save(storePay);
	}
	
	@Transactional(readOnly = false)
	public void delete(StorePay storePay) {
		super.delete(storePay);
	}

	public StorePay findBalance() {
		return storePayDao.findBalance();
	}

	public String findImageByTypeIndex() {
		return storePayDao.findImageByTypeIndex();
	}
	
}