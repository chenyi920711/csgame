/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.modules.storepay.web;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csgame.common.config.Global;
import com.csgame.common.persistence.Page;
import com.csgame.common.utils.StringUtils;
import com.csgame.common.web.BaseController;
import com.csgame.modules.storepay.entity.StorePay;
import com.csgame.modules.storepay.service.StorePayService;
import com.csgame.modules.sys.service.RecCompanyIdservice;

/**
 * 门店充值Controller
 * @author wxf
 * @version 2018-08-16
 */
@Controller
@RequestMapping(value = "${adminPath}/storepay/storePay")
public class StorePayController extends BaseController {
	@Autowired
	private RecCompanyIdservice recCompanyIdservice;
	@Autowired
	private StorePayService storePayService;
	
	@ModelAttribute
	public StorePay get(@RequestParam(required=false) String id) {
		StorePay entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = storePayService.get(id);
		}
		if (entity == null){
			entity = new StorePay();
		}
		return entity;
	}
	/*@ResponseBody
	@RequestMapping(value = "findBalance")
	public String findBalance(Model model, HttpServletRequest request){
		System.out.println("1111111111");
		StorePay storePay =storePayService.findBalance();
		double bal =  storePay.getBalance();
		System.out.println(bal);
		model.addAttribute("storePay",storePay);
		String jsonStr = JSONArray.fromObject(storePay).toString();  
    	System.out.println(jsonStr);
        return jsonStr; 
		
		
	}
	*/
	
//	@RequiresPermissions("storepay:storePay:image")
//	@RequestMapping(value="image")
//	public String image(HttpServletRequest request,Model model){
//		List<String> IndeximageList = new ArrayList<String>();
//		String image = storePayService.findImageByTypeIndex();
//		String Basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
//		if(image != null || image.equals("")){
//			String[] strs_s = image.split(",");
//			for (String str : strs_s) {
//				IndeximageList.add(Basepath+str);
//			}
//		}
//		System.out.println("-------------------------------------");
//		System.out.println(IndeximageList);
//		model.addAttribute("IndeximageList", IndeximageList);
//		return "modules/storepay/image";
//	}
	
	@RequiresPermissions("storepay:storePay:view")
	@RequestMapping(value = {"list", ""})
	public String list(StorePay storePay, HttpServletRequest request, HttpServletResponse response, Model model) {
		storePay.setStoreno(recCompanyIdservice.gecompanyid(request));
		Page<StorePay> page = storePayService.findPage(new Page<StorePay>(request, response), storePay); 
		model.addAttribute("page", page);
		return "modules/storepay/storePayList";
	}

	@RequiresPermissions("storepay:storePay:view")
	@RequestMapping(value = "form")
	public String form(StorePay storePay, Model model) {
		storePay =storePayService.findBalance();
		model.addAttribute("storePay", storePay);
		return "modules/storepay/storePayForm";
	}

	@RequiresPermissions("storepay:storePay:edit")
	@RequestMapping(value = "save")
	public String save(StorePay storePay, Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, storePay)){
			return form(storePay, model);
		}
		storePay.setStoreno(recCompanyIdservice.gecompanyid(request));
		//拿到充值金额
		double rech = storePay.getRecharge();
		//拿到之前的余额
		double bal =  storePay.getBalance();
		//System.out.println(rech);
		//System.out.println(bal);

		storePay.setBalance(rech+bal);
		storePayService.save(storePay);
		addMessage(redirectAttributes, "保存充值记录成功");
		return "redirect:"+Global.getAdminPath()+"/storepay/storePay/?repage";
	}
	
	@RequiresPermissions("storepay:storePay:edit")
	@RequestMapping(value = "delete")
	public String delete(StorePay storePay, RedirectAttributes redirectAttributes) {
		storePayService.delete(storePay);
		addMessage(redirectAttributes, "删除充值记录成功");
		return "redirect:"+Global.getAdminPath()+"/storepay/storePay/?repage";
	}

}