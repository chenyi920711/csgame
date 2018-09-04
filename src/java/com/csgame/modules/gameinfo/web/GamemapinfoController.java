/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.modules.gameinfo.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

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
import com.csgame.modules.gameinfo.entity.Gamemapinfo;
import com.csgame.modules.gameinfo.service.GamemapinfoService;
import com.csgame.modules.sys.service.RecCompanyIdservice;

/**
 * 游戏地图管理Controller
 * @author cy
 * @version 2018-08-10
 */
@Controller
@RequestMapping(value = "${adminPath}/gameinfo/gamemapinfo")
public class GamemapinfoController extends BaseController {

	@Autowired
	private RecCompanyIdservice recCompanyIdservice;
	
	@Autowired
	private GamemapinfoService gamemapinfoService;
	
	@ModelAttribute
	public Gamemapinfo get(@RequestParam(required=false) String getGamemapid) {
		Gamemapinfo entity = null;
		if (StringUtils.isNotBlank(getGamemapid)){
			entity = gamemapinfoService.get(getGamemapid);
		}
		if (entity == null){
			entity = new Gamemapinfo();
		}
		return entity;
	}
	
	@RequiresPermissions("gameinfo:gamemapinfo:view")
	@RequestMapping(value = {"list", ""})
	public String list(Gamemapinfo gamemapinfo, HttpServletRequest request, HttpServletResponse response, Model model) {
		if(request.getParameter("romid")!=null){
			model.addAttribute("gromid", request.getParameter("romid"));
		}
		gamemapinfo.setGamemapshop(recCompanyIdservice.gecompanyid(request));
		Page<Gamemapinfo> page = gamemapinfoService.findPage(new Page<Gamemapinfo>(request, response,4), gamemapinfo); 
		model.addAttribute("page", page);
		return "modules/gameinfo/gamemapinfoList";
	}

	@RequiresPermissions("gameinfo:gamemapinfo:view")
	@RequestMapping(value = "form")
	public String form(Gamemapinfo gamemapinfo, Model model, HttpServletRequest request) {
		String romid = request.getParameter("romid");
		if(romid!=null&&!romid.equals("")){
			model.addAttribute("romid",romid);
		}
		model.addAttribute("gamemapinfo", gamemapinfo);
		return "modules/gameinfo/gamemapinfoForm";
	}
	
	@RequiresPermissions("gameinfo:gamemapinfo:view")
	@RequestMapping(value = "formr")
	public String formr(Gamemapinfo gamemapinfo, Model model, HttpServletRequest request) {
		String romid = request.getParameter("romid");
		if(romid!=null&&!romid.equals("")){
			model.addAttribute("romid",romid);
		}
		model.addAttribute("gamemapinfo", gamemapinfoService.get(gamemapinfo.getGamemapid()));
		return "modules/gameinfo/gamemapinfoFormr";
	}
	@RequiresPermissions("gameinfo:gamemapinfo:edit")
	@RequestMapping(value = "save")
	public String save(Gamemapinfo gamemapinfo, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {

		if(gamemapinfo.getRemarktime()==null||gamemapinfo.getRemarktime().equals("")){
			gamemapinfo.setRemarktime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		}

		if(gamemapinfo.getGamemapid()==null||gamemapinfo.getGamemapid().equals("")){
			gamemapinfo.setGamemapid(UUID.randomUUID().toString().replace("-", ""));
		}
		String romid = request.getParameter("romidd");
		if(romid!=null&&!romid.equals("")){
			model.addAttribute("gromid",romid);
		}
		gamemapinfoService.save(gamemapinfo);	
		addMessage(redirectAttributes, "保存地图成功");
		return "forward:"+Global.getAdminPath()+"/gameinfo/gamemapinfo/?repage";
	}
	
	@RequiresPermissions("gameinfo:gamemapinfo:edit")
	@RequestMapping(value = "resave")
	public String resave(Gamemapinfo gamemapinfo, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {

		if(gamemapinfo.getRemarktime()==null||gamemapinfo.getRemarktime().equals("")){
			gamemapinfo.setRemarktime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		}
		if(gamemapinfo.getGamemapid()==null||gamemapinfo.getGamemapid().equals("")){
			gamemapinfo.setGamemapid(UUID.randomUUID().toString().replace("-", ""));
		}
		String romid = request.getParameter("romidd");
		if(romid!=null&&!romid.equals("")){
			model.addAttribute("gromid",romid);
		}		
		gamemapinfoService.delete(gamemapinfoService.get(gamemapinfo.getGamemapid()));
		gamemapinfoService.save(gamemapinfo);
		addMessage(redirectAttributes, "保存地图成功");
		return "forward:"+Global.getAdminPath()+"/gameinfo/gamemapinfo/?repage";
	}	
	@RequiresPermissions("gameinfo:gamemapinfo:edit")
	@RequestMapping(value = "delete")
	public String delete(Gamemapinfo gamemapinfo, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		String romid = request.getParameter("romidd");
		if(romid!=null&&!romid.equals("")){
			model.addAttribute("gromid",romid);
		}
		gamemapinfoService.delete(gamemapinfoService.get(request.getParameter("gamemapid")));
		addMessage(redirectAttributes, "删除地图成功");
		return "forward:"+Global.getAdminPath()+"/gameinfo/gamemapinfo/?repage";
	}

}