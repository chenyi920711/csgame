/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.modules.sys.service;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csgame.modules.sys.dao.RecCompanyId;


/**
 * 系统管理，安全相关实体的管理类,包括用户、角色、菜单.
 * @author xla
 * @version 2013-12-05
 */
@Service
public class RecCompanyIdservice{
	
	@Autowired
	private RecCompanyId recCompanyId;

	public Map<String, String> findacompany(Map<String, String> ma){
		return recCompanyId.findacompany(ma);
	}
	
	public String gecompanyid(HttpServletRequest request){
		Object id = (Object)request.getSession().getAttribute("org.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEY");
		Map<String, String> map = new HashMap<String, String>();
		map.put("compid", id.toString());
		return findacompany(map).get("company_id");
		
	}
}
