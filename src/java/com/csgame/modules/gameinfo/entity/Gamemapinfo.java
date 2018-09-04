/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.modules.gameinfo.entity;

import org.hibernate.validator.constraints.Length;
import javax.validation.constraints.NotNull;

import com.csgame.common.persistence.DataEntity;

/**
 * 游戏地图管理Entity
 * @author cy
 * @version 2018-08-22
 */
public class Gamemapinfo extends DataEntity<Gamemapinfo> {
	
	private static final long serialVersionUID = 1L;
	private String gamemapid;		// 主键
	private String gamemapimg;		// 地图快照
	private String gamemapshop;		// 所属门店
	private String ggunpoi;		// 补给点
	private String gamemapcenter;		// 地图范围
	private String gamemaprang;		// 初始安全区
	private String gsafepoi;		// 安全屋点
	private String creatby;		// 创建人
	private String remarktime;		// 记录时间
	private Double scirintime;		// 缩圈时间
	private Double scrichtime;		// 缩圈间隔
	private Double stinjur;		// 初始伤害
	private Double addinjur;		// 叠加伤害
	private String remarkstw;		// remarkstw
	private String remarksth;		// remarksth
	
	public Gamemapinfo() {
		super();
	}

	public Gamemapinfo(String id){
		super(id);
	}

	@Length(min=1, max=33, message="主键长度必须介于 1 和 33 之间")
	public String getGamemapid() {
		return gamemapid;
	}

	public void setGamemapid(String gamemapid) {
		this.gamemapid = gamemapid;
	}
	
	@Length(min=1, max=50, message="地图快照长度必须介于 1 和 50 之间")
	public String getGamemapimg() {
		return gamemapimg;
	}

	public void setGamemapimg(String gamemapimg) {
		this.gamemapimg = gamemapimg;
	}
	
	@Length(min=1, max=33, message="所属门店长度必须介于 1 和 33 之间")
	public String getGamemapshop() {
		return gamemapshop;
	}

	public void setGamemapshop(String gamemapshop) {
		this.gamemapshop = gamemapshop;
	}
	
	public String getGgunpoi() {
		return ggunpoi;
	}

	public void setGgunpoi(String ggunpoi) {
		this.ggunpoi = ggunpoi;
	}
	
	public String getGamemapcenter() {
		return gamemapcenter;
	}

	public void setGamemapcenter(String gamemapcenter) {
		this.gamemapcenter = gamemapcenter;
	}
	
	public String getGamemaprang() {
		return gamemaprang;
	}

	public void setGamemaprang(String gamemaprang) {
		this.gamemaprang = gamemaprang;
	}
	
	public String getGsafepoi() {
		return gsafepoi;
	}

	public void setGsafepoi(String gsafepoi) {
		this.gsafepoi = gsafepoi;
	}
	
	@Length(min=0, max=50, message="创建人长度必须介于 0 和 50 之间")
	public String getCreatby() {
		return creatby;
	}

	public void setCreatby(String creatby) {
		this.creatby = creatby;
	}
	
	public String getRemarktime() {
		return remarktime;
	}

	public void setRemarktime(String remarktime) {
		this.remarktime = remarktime;
	}
	
	@NotNull(message="缩圈时间不能为空")
	public Double getScirintime() {
		return scirintime;
	}

	public void setScirintime(Double scirintime) {
		this.scirintime = scirintime;
	}
	
	@NotNull(message="缩圈间隔不能为空")
	public Double getScrichtime() {
		return scrichtime;
	}

	public void setScrichtime(Double scrichtime) {
		this.scrichtime = scrichtime;
	}
	
	@NotNull(message="初始伤害不能为空")
	public Double getStinjur() {
		return stinjur;
	}

	public void setStinjur(Double stinjur) {
		this.stinjur = stinjur;
	}
	
	@NotNull(message="叠加伤害不能为空")
	public Double getAddinjur() {
		return addinjur;
	}

	public void setAddinjur(Double addinjur) {
		this.addinjur = addinjur;
	}
	
	@Length(min=0, max=100, message="remarkstw长度必须介于 0 和 100 之间")
	public String getRemarkstw() {
		return remarkstw;
	}

	public void setRemarkstw(String remarkstw) {
		this.remarkstw = remarkstw;
	}
	
	@Length(min=0, max=100, message="remarksth长度必须介于 0 和 100 之间")
	public String getRemarksth() {
		return remarksth;
	}

	public void setRemarksth(String remarksth) {
		this.remarksth = remarksth;
	}
	
}