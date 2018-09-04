/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.modules.gmoduleinfo.entity;

import org.hibernate.validator.constraints.Length;

import com.csgame.common.persistence.DataEntity;

/**
 * 游戏模式管理Entity
 * @author cy
 * @version 2018-08-14
 */
public class Gamemodutype extends DataEntity<Gamemodutype> {
	
	private static final long serialVersionUID = 1L;
	private String gamemname;		// 模式名称
	private String gamemtype;		// 模式类型
	private String gamemcount;		// 结算排序
	private String remarkshop;		// 创建门店
	private String remarkman;		// 创建人
	private String remarktime;		// 创建时间
	
	public Gamemodutype() {
		super();
	}

	public Gamemodutype(String id){
		super(id);
	}

	@Length(min=1, max=66, message="模式名称长度必须介于 1 和 66 之间")
	public String getGamemname() {
		return gamemname;
	}

	public void setGamemname(String gamemname) {
		this.gamemname = gamemname;
	}
	
	@Length(min=1, max=22, message="模式类型长度必须介于 1 和 22 之间")
	public String getGamemtype() {
		return gamemtype;
	}

	public void setGamemtype(String gamemtype) {
		this.gamemtype = gamemtype;
	}
	
	@Length(min=1, max=10, message="结算排序长度必须介于 1 和 10 之间")
	public String getGamemcount() {
		return gamemcount;
	}

	public void setGamemcount(String gamemcount) {
		this.gamemcount = gamemcount;
	}
	
	@Length(min=0, max=35, message="创建门店长度必须介于 0 和 35 之间")
	public String getRemarkshop() {
		return remarkshop;
	}

	public void setRemarkshop(String remarkshop) {
		this.remarkshop = remarkshop;
	}
	
	@Length(min=0, max=30, message="创建人长度必须介于 0 和 30 之间")
	public String getRemarkman() {
		return remarkman;
	}

	public void setRemarkman(String remarkman) {
		this.remarkman = remarkman;
	}
	
	public String getRemarktime() {
		return remarktime;
	}

	public void setRemarktime(String remarktime) {
		this.remarktime = remarktime;
	}
	
}