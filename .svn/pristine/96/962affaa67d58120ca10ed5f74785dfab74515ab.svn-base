/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.modules.equip.entity.equipment;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.csgame.common.persistence.DataEntity;

/**
 * 设备增删改查Entity
 * @author xlq
 * @version 2018-08-15
 */
public class StoreEquipment extends DataEntity<StoreEquipment> {
	
	private static final long serialVersionUID = 1L;
	private String equipmentno;		// 设备编号
	private String equipmentname;		// 设备名称
	private Date equipmentdate;		// 质保日期
	private String equipmenttype;		// 设备型号
	private String storeequipno;		// 店内设备编号
	private String isbinding;		// 绑定小程序
	private String storeno;		// 门店编号
	private String storename;		// 门店名称
	
	public StoreEquipment() {
		super();
	}

	public StoreEquipment(String id){
		super(id);
	}

	@Length(min=0, max=255, message="设备编号长度必须介于 0 和 255 之间")
	public String getEquipmentno() {
		return equipmentno;
	}

	public void setEquipmentno(String equipmentno) {
		this.equipmentno = equipmentno;
	}
	
	@Length(min=0, max=255, message="设备名称长度必须介于 0 和 255 之间")
	public String getEquipmentname() {
		return equipmentname;
	}

	public void setEquipmentname(String equipmentname) {
		this.equipmentname = equipmentname;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEquipmentdate() {
		return equipmentdate;
	}

	public void setEquipmentdate(Date equipmentdate) {
		this.equipmentdate = equipmentdate;
	}
	
	@Length(min=0, max=255, message="设备型号长度必须介于 0 和 255 之间")
	public String getEquipmenttype() {
		return equipmenttype;
	}

	public void setEquipmenttype(String equipmenttype) {
		this.equipmenttype = equipmenttype;
	}
	
	@Length(min=0, max=255, message="店内设备编号长度必须介于 0 和 255 之间")
	public String getStoreequipno() {
		return storeequipno;
	}

	public void setStoreequipno(String storeequipno) {
		this.storeequipno = storeequipno;
	}
	
	@Length(min=0, max=255, message="绑定小程序长度必须介于 0 和 255 之间")
	public String getIsbinding() {
		return isbinding;
	}

	public void setIsbinding(String isbinding) {
		this.isbinding = isbinding;
	}
	
	@Length(min=0, max=64, message="门店编号长度必须介于 0 和 64 之间")
	public String getStoreno() {
		return storeno;
	}

	public void setStoreno(String storeno) {
		this.storeno = storeno;
	}
	
	@Length(min=0, max=255, message="门店名称长度必须介于 0 和 255 之间")
	public String getStorename() {
		return storename;
	}

	public void setStorename(String storename) {
		this.storename = storename;
	}
	
}