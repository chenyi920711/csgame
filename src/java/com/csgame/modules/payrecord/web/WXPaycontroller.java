package com.csgame.modules.payrecord.web;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value="${adminPath}/pay/WX")
public class WXPaycontroller {
	
	//@RequiresPermissions("pay:model:view")
	@RequestMapping(value = { "list", "" })
	public String modelList(String category, HttpServletRequest request, HttpServletResponse response, Model model) {

		System.out.println("-------------------------------");
		return "modules/payrecord/WXPay";
	}
}
