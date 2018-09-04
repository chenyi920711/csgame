/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.modules.storepay.entity;

import org.hibernate.validator.constraints.Length;

import com.csgame.common.persistence.DataEntity;

/**
 * 门店充值Entity
 * @author wxf
 * @version 2018-08-16
 */
public class StorePay extends DataEntity<StorePay> {
	
	private static final long serialVersionUID = 1L;
	private String storeno;		// 门店编号
	private String tel;		// 电话
	private Double balance;		// 余额
	private Double recharge;		// 充值金额
	
	public StorePay() {
		super();
	}

	public StorePay(String id){
		super(id);
	}

	@Length(min=0, max=64, message="门店编号长度必须介于 0 和 64 之间")
	public String getStoreno() {
		return storeno;
	}

	public void setStoreno(String storeno) {
		this.storeno = storeno;
	}
	
	@Length(min=0, max=64, message="电话长度必须介于 0 和 64 之间")
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public Double getBalance() {
		return balance;
	}

	public void setBalance(Double balance) {
		this.balance = balance;
	}
	
	public Double getRecharge() {
		return recharge;
	}

	public void setRecharge(Double recharge) {
		this.recharge = recharge;
	}
	
}