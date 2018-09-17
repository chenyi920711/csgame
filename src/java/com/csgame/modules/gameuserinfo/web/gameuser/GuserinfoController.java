/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.modules.gameuserinfo.web.gameuser;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csgame.common.config.Global;
import com.csgame.common.persistence.Page;
import com.csgame.common.web.BaseController;
import com.csgame.common.utils.StringUtils;
import com.csgame.modules.gameuserinfo.entity.gameuser.Guserinfo;
import com.csgame.modules.gameuserinfo.service.gameuser.GuserinfoService;
import com.csgame.modules.gameuserinfo.utils.CommonUtil;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;

/**
 * 游戏玩家Controller
 * @author cy
 * @version 2018-09-11
 */
@Controller
@RequestMapping(value = "${adminPath}/gameuserinfo/gameuser/guserinfo")
public class GuserinfoController extends BaseController {

	@Autowired
	private GuserinfoService guserinfoService;
	
	@ModelAttribute
	public Guserinfo get(@RequestParam(required=false) String id) {
		Guserinfo entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = guserinfoService.get(id);
		}
		if (entity == null){
			entity = new Guserinfo();
		}
		return entity;
	}
	
	@RequiresPermissions("gameuserinfo:gameuser:guserinfo:view")
	@RequestMapping(value = {"list", ""})
	public String list(Guserinfo guserinfo, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Guserinfo> page = guserinfoService.findPage(new Page<Guserinfo>(request, response), guserinfo); 
		model.addAttribute("page", page);
		return "modules/gameuserinfo/gameuser/guserinfoList";
	}

	@RequiresPermissions("gameuserinfo:gameuser:guserinfo:view")
	@RequestMapping(value = "form")
	public String form(Guserinfo guserinfo, Model model) {
		model.addAttribute("guserinfo", guserinfo);
		return "modules/gameuserinfo/gameuser/guserinfoForm";
	}

	@RequiresPermissions("gameuserinfo:gameuser:guserinfo:edit")
	@RequestMapping(value = "save")
	public String save(Guserinfo guserinfo, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, guserinfo)){
			return form(guserinfo, model);
		}
		guserinfoService.save(guserinfo);
		addMessage(redirectAttributes, "保存游戏玩家成功");
		return "redirect:"+Global.getAdminPath()+"/gameuserinfo/gameuser/guserinfo/?repage";
	}
	
	@RequiresPermissions("gameuserinfo:gameuser:guserinfo:edit")
	@RequestMapping(value = "delete")
	public String delete(Guserinfo guserinfo, RedirectAttributes redirectAttributes) {
		guserinfoService.delete(guserinfo);
		addMessage(redirectAttributes, "删除游戏玩家成功");
		return "redirect:"+Global.getAdminPath()+"/gameuserinfo/gameuser/guserinfo/?repage";
	}

    @ResponseBody
    @RequestMapping(value="/getOpenId",method = RequestMethod.POST)
    public Map<String, Object> getOpenId(HttpServletRequest request,HttpServletResponse response){
        Map<String, Object> map = new HashMap<String, Object>();
        String status = "1";
        String msg = "ok";
        String appid = "wx10a61a01e720143b";
        String SECRECT = "19e243787ce15467484003ae5a12dcc2";
        String WX_URL = "https://api.weixin.qq.com/sns/jscode2session?appid=APPID&secret=SECRET&js_code=JSCODE";
        try {
            String code = request.getParameter("code");
            if(StringUtils.isBlank(code)){
                status = "0";//失败状态
                msg = "code为空";
            }else {
                String requestUrl = WX_URL.replace("APPID", appid).
                        replace("SECRET", SECRECT).
                        replace("JSCODE", code);
                logger.info(requestUrl);
                // 发起GET请求获取凭证
                JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "GET", null);
                if (jsonObject != null) {
                    try {
                        map.put("openid", jsonObject.getString("openid"));
                        map.put("session_key", jsonObject.getString("session_key"));
                    } catch (JSONException e) {
                        // 获取token失败
                        status = "0";
                        msg = "code无效";
                    }
                }else {
                    status = "0";
                    msg = "code无效";
                }
            }
            map.put("status", status);
            map.put("msg", msg);
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
            return null;
        }
        //mysql非空判断+插入
        
        return map;

    }

}