/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.modules.gameuserinfo.entity.gameuser;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.csgame.common.persistence.DataEntity;

/**
 * 游戏玩家Entity
 * @author cy
 * @version 2018-09-11
 */
public class Guserinfo extends DataEntity<Guserinfo> {
	
	private static final long serialVersionUID = 1L;
	private String userid;		// 用户编号
	private String username;		// 用户名
	private String usex;		// 性别
	private String uaddress;		// 地址
	private String uavatimg;		// 用户头像
	private String uexpress;		// 经验
	private String ugrade;		// 等级
	private String ukull;		// 击杀数
	private String uattack;		// 攻击增加
	private String uhp;		// 血量增加
	private String ustareon;		// 预留属性1
	private String ustaretw;		// 预留属性2
	private String ustareth;		// 预留属性3
	private Date ulastlogin;		// 最后登录时间
	private String ulastip;		// 最后登录ip
	private String uremarks1;		// 备注1
	private String uremarks2;		// 憋住2
	
	public Guserinfo() {
		super();
	}

	public Guserinfo(String id){
		super(id);
	}

	@Length(min=1, max=33, message="用户编号长度必须介于 1 和 33 之间")
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	@Length(min=0, max=45, message="用户名长度必须介于 0 和 45 之间")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	@Length(min=0, max=5, message="性别长度必须介于 0 和 5 之间")
	public String getUsex() {
		return usex;
	}

	public void setUsex(String usex) {
		this.usex = usex;
	}
	
	@Length(min=0, max=33, message="地址长度必须介于 0 和 33 之间")
	public String getUaddress() {
		return uaddress;
	}

	public void setUaddress(String uaddress) {
		this.uaddress = uaddress;
	}
	
	@Length(min=0, max=66, message="用户头像长度必须介于 0 和 66 之间")
	public String getUavatimg() {
		return uavatimg;
	}

	public void setUavatimg(String uavatimg) {
		this.uavatimg = uavatimg;
	}
	
	public String getUexpress() {
		return uexpress;
	}

	public void setUexpress(String uexpress) {
		this.uexpress = uexpress;
	}
	
	@Length(min=0, max=11, message="等级长度必须介于 0 和 11 之间")
	public String getUgrade() {
		return ugrade;
	}

	public void setUgrade(String ugrade) {
		this.ugrade = ugrade;
	}
	
	@Length(min=0, max=11, message="击杀数长度必须介于 0 和 11 之间")
	public String getUkull() {
		return ukull;
	}

	public void setUkull(String ukull) {
		this.ukull = ukull;
	}
	
	public String getUattack() {
		return uattack;
	}

	public void setUattack(String uattack) {
		this.uattack = uattack;
	}
	
	public String getUhp() {
		return uhp;
	}

	public void setUhp(String uhp) {
		this.uhp = uhp;
	}
	
	public String getUstareon() {
		return ustareon;
	}

	public void setUstareon(String ustareon) {
		this.ustareon = ustareon;
	}
	
	public String getUstaretw() {
		return ustaretw;
	}

	public void setUstaretw(String ustaretw) {
		this.ustaretw = ustaretw;
	}
	
	public String getUstareth() {
		return ustareth;
	}

	public void setUstareth(String ustareth) {
		this.ustareth = ustareth;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUlastlogin() {
		return ulastlogin;
	}

	public void setUlastlogin(Date ulastlogin) {
		this.ulastlogin = ulastlogin;
	}
	
	@Length(min=0, max=25, message="最后登录ip长度必须介于 0 和 25 之间")
	public String getUlastip() {
		return ulastip;
	}

	public void setUlastip(String ulastip) {
		this.ulastip = ulastip;
	}
	
	@Length(min=0, max=33, message="备注1长度必须介于 0 和 33 之间")
	public String getUremarks1() {
		return uremarks1;
	}

	public void setUremarks1(String uremarks1) {
		this.uremarks1 = uremarks1;
	}
	
	@Length(min=0, max=33, message="憋住2长度必须介于 0 和 33 之间")
	public String getUremarks2() {
		return uremarks2;
	}

	public void setUremarks2(String uremarks2) {
		this.uremarks2 = uremarks2;
	}
	
}