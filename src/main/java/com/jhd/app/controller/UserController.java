package com.jhd.app.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import com.google.gson.Gson;
import com.jhd.app.beans.User;
import com.jhd.app.constants.MYCONSTANTS;
import com.jhd.app.service.UserService;

@Controller
public class UserController extends BaseController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/index")
	public String toIndex() {
		return "index";
	}
	@RequestMapping("/order")
	public String toOrder() {
		return "order";
	}
	@RequestMapping("/product")
	public String toProduct() {
		return "product";
	}
	@RequestMapping("/stock")
	public String tosTock() {
		return "stock";
	}
	@RequestMapping("/trade")
	public String toTrade() {
		return "trade";
	}
	@RequestMapping("/supplier")
	public String toSupplier() {
		return "supplier";
	}
	@RequestMapping("/statistics")
	public String toStatistics() {
		return "statistics";
	}
	@RequestMapping("/user")
	public String toUser() {
		return "user";
	}
	@RequestMapping(value = "/dologin",method=RequestMethod.POST)
	@ResponseBody
	public Object login(ModelMap map,@RequestBody Map<String,String> user,HttpSession session) {
		start();
		try {
			Map<String,Object> params = new HashMap<>();
			params.put("loginAccount", user.get("loginAccount"));
			params.put("passWord", user.get("passWord"));
			User loginUser = userService.getUser(params);
			if(null != loginUser) {
				session.setAttribute("loginAccount", loginUser.getLoginAccount());
				session.setAttribute("userName", loginUser.getUserName());
				success(MYCONSTANTS.LOGINESUCCESS);
			}else {
				error(MYCONSTANTS.LOGINERROR);
			}
		} catch (Exception e) {
			e.printStackTrace();
			error(MYCONSTANTS.LOGINERROR);
		}
		return end();
	}
	
	@RequestMapping(value = "/doLoginOut",method=RequestMethod.POST)
	public Object login(HttpSession session) {
		session.removeAttribute("loginAccount");
		session.removeAttribute("userName");
		return "login";
	}
	
}
