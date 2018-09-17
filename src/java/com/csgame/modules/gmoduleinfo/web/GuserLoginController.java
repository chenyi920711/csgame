/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.modules.gmoduleinfo.web;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;



import com.csgame.common.web.BaseController;
import com.csgame.modules.gameuserinfo.utils.CommonUtil;
import com.csgame.common.utils.StringUtils;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;

/**
 * 游戏模式管理Controller
 * @author cy
 * @version 2018-08-14
 */
@Controller
@RequestMapping(value = "${adminPath}/gmoduleinfo/gameuserlogin")
public class GuserLoginController extends BaseController {

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