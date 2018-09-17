/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.modules.gamehomeinfo.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csgame.common.config.Global;
import com.csgame.common.persistence.Page;
import com.csgame.common.web.BaseController;
import com.csgame.common.utils.StringUtils;
import com.csgame.modules.gamehomeinfo.entity.Gamehome;
import com.csgame.modules.gamehomeinfo.service.GamehomeService;
import com.csgame.modules.gamehomeinfo.utils.RedisUtil;
import com.csgame.modules.gameinfo.service.GamemapinfoService;
import com.csgame.modules.sys.service.RecCompanyIdservice;

import net.sf.json.JSONArray;
import redis.clients.jedis.Jedis;

/**
 * 游戏房间管理Controller
 * @author cy
 * @version 2018-08-15
 */
@Controller
@RequestMapping(value = "${adminPath}/gamehomeinfo/gamehome")
public class GamehomeController extends BaseController {

	@Autowired
	private RecCompanyIdservice recCompanyIdservice;
	
	@Autowired
	private GamehomeService gamehomeService;
	
	@Autowired
	private GamemapinfoService gamemapinfoService;
	

    private Jedis jedis;
    
    /**
     * 连接redis服务器
     */
    public void connectRedis() {
        jedis=RedisUtil.getJedis();
    }
	@ModelAttribute
	public Gamehome get(@RequestParam(required=false) String id) {
		Gamehome entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = gamehomeService.get(id);
		}
		if (entity == null){
			entity = new Gamehome();
		}
		return entity;
	}
	
	@RequiresPermissions("gamehomeinfo:gamehome:view")
	@RequestMapping(value = {"list", ""})
	public String list(Gamehome gamehome, HttpServletRequest request, HttpServletResponse response, Model model) {
		gamehome.setCreateshop(recCompanyIdservice.gecompanyid(request));
		Page<Gamehome> page = gamehomeService.findPage(new Page<Gamehome>(request, response,6), gamehome); 	
		model.addAttribute("page", page);
		return "modules/gamehomeinfo/gamehomeList";
	}

	@RequiresPermissions("gamehomeinfo:gamehome:view")
	@RequestMapping(value = "form")
	public String form(Gamehome gamehome, Model model) {
		model.addAttribute("gamehome", gamehome);
		return "modules/gamehomeinfo/gamehomeForm";
	}

	@RequiresPermissions("gamehomeinfo:gamehome:view")
	@RequestMapping(value = "formr")
	public String formr(Gamehome gamehome, Model model) {
		model.addAttribute("gamehome", gamehome);
		return "modules/gamehomeinfo/gamehomeFormr";
	}

	@RequiresPermissions("gamehomeinfo:gamehome:view")
	@RequestMapping(value = "formrr")
	public String formrr(Gamehome gamehome, Model model) {
		gamehome = gamehomeService.get(gamehome.getId());
		model.addAttribute("gamehome", gamehome);
		return "modules/gamehomeinfo/module5";
	}	
	
	@RequiresPermissions("gamehomeinfo:gamehome:view")
	@RequestMapping(value = "formrrom")
	public String formrrom(Model model, HttpServletRequest request) {
		String rid = request.getParameter("rommid");
		Gamehome gamehome = gamehomeService.get(rid);
		model.addAttribute("gamehome", gamehome);
		return "modules/gamehomeinfo/gamehomeFormrom";
	}
	
	@RequiresPermissions("gamehomeinfo:gamehome:edit")
	@RequestMapping(value = "save")
	public String save(Gamehome gamehome, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, gamehome)){
			return form(gamehome, model);
		}
		gamehome.setGrommap("10000");
		gamehomeService.save(gamehome);
		addMessage(redirectAttributes, "保存房间成功");
		return "redirect:"+Global.getAdminPath()+"/gamehomeinfo/gamehome/?repage";
	}
	
	@RequiresPermissions("gamehomeinfo:gamehome:edit")
	@RequestMapping(value = "delete")
	public String delete(Gamehome gamehome, RedirectAttributes redirectAttributes) {
		gamehomeService.delete(gamehome);
		addMessage(redirectAttributes, "删除房间成功");
		return "redirect:"+Global.getAdminPath()+"/gamehomeinfo/gamehome/?repage";
	}
	
/*	
	@RequiresPermissions("gamehomeinfo:gamehome:edit")
	@ResponseBody
	@RequestMapping(value = "recshopmodu", method = RequestMethod.POST)
	public String recshopmodu(@RequestParam(value="manshopid") String manshopid,HttpServletRequest  request,HttpServletResponse response) {
		Map<String, String> ma = new HashMap<String, String>();
		ma.put("remarkshop", manshopid);
		List<Map<String, String>> sbmputillist = gamehomeService.seleshopmodu(ma);
		String jsonStr = JSONArray.fromObject(sbmputillist).toString();  
		return jsonStr;
	}
	*/
	
	@RequiresPermissions("gamehomeinfo:gamehome:edit")
	@ResponseBody
	@RequestMapping(value = "recshopmap", method = RequestMethod.POST)
	public String recshopmap(@RequestParam(value="manshopid") String manshopid,HttpServletRequest  request,HttpServletResponse response) {
		Map<String, String> ma = new HashMap<String, String>();
		ma.put("gamemapid", manshopid);
		List<Map<String, String>> cll = gamemapinfoService.seleshopmap(ma);
		String jsonStr = JSONArray.fromObject(cll).toString();  
		return jsonStr;
	}
	//初始化房间状态
	@RequiresPermissions("gamehomeinfo:gamehome:edit")
	@ResponseBody
	@RequestMapping(value = "mapredissave", method = RequestMethod.POST)
	public void mapredissave(HttpServletRequest  request,HttpServletResponse response) {
		jedis=RedisUtil.getJedis();
		String ranen = request.getParameter("ranen");
		String ranws = request.getParameter("ranws");
		String mapran = request.getParameter("mapran");
		String gunpoi = request.getParameter("gunpoi");
		String hppoi = request.getParameter("hppoi");
		String roomid = request.getParameter("roomid");
		String status = request.getParameter("rstaus");
		Gamehome g = gamehomeService.get(roomid);
		g.setHomestate(status);
		//调整mysql游戏状态
		gamehomeService.srthomestatus(g);		
		jedis.select(0);
		if(g.getAdjusthp().equals("1")){
			jedis.hset(roomid, "peohp", g.getPeohp());
		}
		if(g.getAdjusthp().equals("0")){
			jedis.hset(roomid, "peohp", "100");
		}
		jedis.hset(roomid, "cradius", ranen);
		jedis.hset(roomid, "ccenter", ranws);
		jedis.hset(roomid, "maprange", mapran);
		jedis.hset(roomid, "gunpoi", gunpoi);
		jedis.hset(roomid, "hppoi", hppoi);
		jedis.hset(roomid, "status", status);
	}
	
	//结束该房间游戏
	@RequiresPermissions("gamehomeinfo:gamehome:edit")
	@RequestMapping(value = "endredissave", method = RequestMethod.GET)
	public String endredissave(Gamehome gamehome, HttpServletRequest request, HttpServletResponse response, Model model) {
		jedis=RedisUtil.getJedis();
		String roomid = request.getParameter("roomid");
		String status = request.getParameter("rstaus");
		if(request.getParameter("iscaluc")!=null&&!request.getParameter("iscaluc").equals("")){
			
		}
		Gamehome g = gamehomeService.get(roomid);
		g.setHomestate(status);
		//调整mysql游戏状态
		gamehomeService.srthomestatus(g);		
		jedis.select(0);
		jedis.hset(roomid, "status", status);
		return list(gamehome, request, response, model);
	}	
	
	//更改安全区位置
	@RequiresPermissions("gamehomeinfo:gamehome:edit")
	@ResponseBody
	@RequestMapping(value = "chhomcir", method = RequestMethod.POST)
	public void chhomcir(HttpServletRequest  request,HttpServletResponse response) {
		jedis=RedisUtil.getJedis();
		String ranen = request.getParameter("ccenter");
		String ranws = request.getParameter("cradius");
		String roomid = request.getParameter("roomid");
		jedis.hset(roomid, "ccenter", ranen);
		jedis.hset(roomid, "cradius", ranws);
	}
	
	@RequiresPermissions("gamehomeinfo:gamehome:edit")
	@RequestMapping(value = "setmapid", method = RequestMethod.POST)
	@ResponseBody
	public String updatemap(HttpServletRequest request) {
		String checval = request.getParameter("mapid");
		String romid = request.getParameter("romid");
		Map<String, String> ma = new HashMap<String, String>();
		if(checval!=null&&!checval.equals("")
			&&romid!=null&&!romid.equals("")){
			ma.put("grommap", checval);
			ma.put("gromid", romid);
			gamehomeService.settmapid(ma);
			return "{\"id\":\"success\"}";
		}else{
			return "{\"id\":\"false\"}";
		}
	}
	

	@RequiresPermissions("gamehomeinfo:gamehome:edit")
	@RequestMapping(value = "setrromm", method = RequestMethod.POST)
	@ResponseBody
	public void setrromm(Gamehome gamehome,HttpServletRequest request) {

		if(gamehome.getId()!=null&&!gamehome.getId().equals("")){
			gamehomeService.settromm(gamehome);		
		}else{
		}
	}
	
}