/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.modules.gamehomeinfo.entity;

import org.hibernate.validator.constraints.Length;

import com.csgame.common.persistence.DataEntity;

/**
 * 游戏房间管理Entity
 * @author cy
 * @version 2018-08-15
 */
public class Gamehome extends DataEntity<Gamehome> {
	
	private static final long serialVersionUID = 1L;
	private String gromname;		// 房间名称
	private String grommap;		// 所用地图
	private String grommodu;		// 所用模式
	private String createshop;		// 所属门店
	private String adjusthp;		// HP调整
	private String peohp;		// HP数值
	private String havecircle;		// 缩圈模式
	private String startinjur;		// 毒圈初始伤害
	private String everyinjur;		// 毒圈叠加伤害
	private String teamtype;		// 组队类型
	private String teampeo;		// 队伍人数
	private String allpeo;		// 总人数
	private String createby;		// 创建人
	private String createtime;		// 创建日期
	private String homestate;		// 房间状态
	private String updateby;		// 更新人
	private String updatetime;		// 更新日期
	
	public Gamehome() {
		super();
	}

	public Gamehome(String id){
		super(id);
	}

	@Length(min=1, max=50, message="房间名称长度必须介于 1 和 50 之间")
	public String getGromname() {
		return gromname;
	}

	public void setGromname(String gromname) {
		this.gromname = gromname;
	}
	
	@Length(min=1, max=35, message="所用地图长度必须介于 1 和 35 之间")
	public String getGrommap() {
		return grommap;
	}

	public void setGrommap(String grommap) {
		this.grommap = grommap;
	}
	
	@Length(min=1, max=35, message="所用模式长度必须介于 1 和 35 之间")
	public String getGrommodu() {
		return grommodu;
	}

	public void setGrommodu(String grommodu) {
		this.grommodu = grommodu;
	}
	
	@Length(min=1, max=33, message="所属门店长度必须介于 1 和 33 之间")
	public String getCreateshop() {
		return createshop;
	}

	public void setCreateshop(String createshop) {
		this.createshop = createshop;
	}
	
	@Length(min=1, max=3, message="HP调整长度必须介于 1 和 3 之间")
	public String getAdjusthp() {
		return adjusthp;
	}

	public void setAdjusthp(String adjusthp) {
		this.adjusthp = adjusthp;
	}
	
	@Length(min=0, max=11, message="HP数值长度必须介于 0 和 11 之间")
	public String getPeohp() {
		return peohp;
	}

	public void setPeohp(String peohp) {
		this.peohp = peohp;
	}
	
	@Length(min=1, max=5, message="缩圈模式长度必须介于 1 和 5 之间")
	public String getHavecircle() {
		return havecircle;
	}

	public void setHavecircle(String havecircle) {
		this.havecircle = havecircle;
	}
	
	@Length(min=1, max=11, message="毒圈初始伤害长度必须介于 1 和 11 之间")
	public String getStartinjur() {
		return startinjur;
	}

	public void setStartinjur(String startinjur) {
		this.startinjur = startinjur;
	}
	
	@Length(min=0, max=11, message="毒圈叠加伤害长度必须介于 0 和 11 之间")
	public String getEveryinjur() {
		return everyinjur;
	}

	public void setEveryinjur(String everyinjur) {
		this.everyinjur = everyinjur;
	}
	
	@Length(min=0, max=2, message="组队类型长度必须介于 0 和 2 之间")
	public String getTeamtype() {
		return teamtype;
	}

	public void setTeamtype(String teamtype) {
		this.teamtype = teamtype;
	}
	
	@Length(min=1, max=11, message="队伍人数长度必须介于 1 和 11 之间")
	public String getTeampeo() {
		return teampeo;
	}

	public void setTeampeo(String teampeo) {
		this.teampeo = teampeo;
	}
	
	@Length(min=1, max=11, message="总人数长度必须介于 1 和 11 之间")
	public String getAllpeo() {
		return allpeo;
	}

	public void setAllpeo(String allpeo) {
		this.allpeo = allpeo;
	}
	
	@Length(min=0, max=50, message="创建人长度必须介于 0 和 50 之间")
	public String getCreateby() {
		return createby;
	}

	public void setCreateby(String createby) {
		this.createby = createby;
	}
	
	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	
	@Length(min=1, max=3, message="房间状态长度必须介于 1 和 3 之间")
	public String getHomestate() {
		return homestate;
	}

	public void setHomestate(String homestate) {
		this.homestate = homestate;
	}
	
	@Length(min=0, max=50, message="更新人长度必须介于 0 和 50 之间")
	public String getUpdateby() {
		return updateby;
	}

	public void setUpdateby(String updateby) {
		this.updateby = updateby;
	}
	
	public String getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}
	
}