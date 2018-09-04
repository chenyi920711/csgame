/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.modules.equip.web.equipment;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csgame.common.config.Global;
import com.csgame.common.persistence.Page;
import com.csgame.common.web.BaseController;
import com.csgame.common.utils.StringUtils;
import com.csgame.modules.equip.entity.equipment.StoreEquipment;
import com.csgame.modules.equip.service.equipment.StoreEquipmentService;
import com.csgame.modules.sys.service.RecCompanyIdservice;
import com.google.gson.JsonObject;

import net.sf.json.JSONObject;

/**
 * 设备增删改查Controller
 * @author xlq
 * @version 2018-08-15
 */
@Controller
@RequestMapping(value = "${adminPath}/equip/equipment/storeEquipment")
public class StoreEquipmentController extends BaseController {
	@Autowired
	private RecCompanyIdservice recCompanyIdservice;

	@Autowired
	private StoreEquipmentService storeEquipmentService;
	
	@ModelAttribute
	public StoreEquipment get(@RequestParam(required=false) String id) {
		StoreEquipment entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = storeEquipmentService.get(id);
		}
		if (entity == null){
			entity = new StoreEquipment();
		}
		return entity;
	}
	
	@RequiresPermissions("equip:equipment:storeEquipment:view")
	@RequestMapping(value = {"list", ""})
	public String list(StoreEquipment storeEquipment, HttpServletRequest request, HttpServletResponse response, Model model) {
		//String storeNo = request.getAttribute("storeNo").toString();
		storeEquipment.setStoreno(recCompanyIdservice.gecompanyid(request));
		Page<StoreEquipment> page = storeEquipmentService.findPage(new Page<StoreEquipment>(request, response), storeEquipment); 
		model.addAttribute("page", page);
		return "modules/equip/equipment/storeEquipmentList";
	}

	@RequiresPermissions("equip:equipment:storeEquipment:view")
	@RequestMapping(value = "form")
	public String form(StoreEquipment storeEquipment, HttpServletRequest request, Model model) {
		model.addAttribute("storeEquipment", storeEquipment);
		return "modules/equip/equipment/storeEquipmentForm";
	}

	@RequiresPermissions("equip:equipment:storeEquipment:edit")
	@RequestMapping(value = "save")
	public String save(StoreEquipment storeEquipment, Model model,  HttpServletRequest request,RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, storeEquipment)){
			return form(storeEquipment,request, model);
		}
		storeEquipment.setStoreno(recCompanyIdservice.gecompanyid(request));
		storeEquipmentService.save(storeEquipment);
		addMessage(redirectAttributes, "保存门店设备成功");
		return "redirect:"+Global.getAdminPath()+"/equip/equipment/storeEquipment/?repage";
	}
	
	@RequiresPermissions("equip:equipment:storeEquipment:edit")
	@RequestMapping(value = "delete")
	public String delete(StoreEquipment storeEquipment, RedirectAttributes redirectAttributes) {
		storeEquipmentService.delete(storeEquipment);
		addMessage(redirectAttributes, "删除门店设备成功");
		return "redirect:"+Global.getAdminPath()+"/equip/equipment/storeEquipment/?repage";
	}
	
	
	@RequestMapping(value = "changeStatus")
	public void changeStatus(StoreEquipment storeEquipment,HttpServletRequest request,HttpServletResponse response) {
		storeEquipmentService.changeStatus(storeEquipment);
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", true);
		try {
			response.getWriter().write(JSONObject.fromObject(result).toString());
		} catch (IOException e) {
			e.printStackTrace();
		};
	}
	@RequestMapping(value = "changeStoreno")
	public void changeStoreno(StoreEquipment storeEquipment,HttpServletRequest request,HttpServletResponse response) {
		storeEquipmentService.changeStoreno(storeEquipment);
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", true);
		try {
			response.getWriter().write(JSONObject.fromObject(result).toString());
		} catch (IOException e) {
			e.printStackTrace();
		};
	}

}