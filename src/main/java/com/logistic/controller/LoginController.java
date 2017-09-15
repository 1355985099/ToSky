package com.logistic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.logistic.Exception.MsgException;
import com.logistic.pojo.User;
import com.logistic.service.LoginService;
/**
 * 用户登陆注册控制
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    private LoginService loginService;
    @RequestMapping("/login")
    public String login(String userName ,String password) {
    	
    	System.out.println(password + "<==password");
		return null;
    	
    }
    //注册
    @RequestMapping("/reg")
    public String reg(@Validated User user,BindingResult br,Model model) {
    	if(br.hasErrors()) {
    		model.addAttribute("error", br.getFieldError().getDefaultMessage());
    		return "login/reg"; //注册页面
    	}
    	try {
    		loginService.registerUser(user);
		} catch (MsgException e) {
			model.addAttribute("error",e.getMessage());
			return "login/reg";  //返回注册页面
		}
    	model.addAttribute("user", user);
    	//推断邮箱的登陆地址
    	model.addAttribute("email",user.getEmail().substring(user.getEmail().indexOf("@")+1));
    	return "login/activate";
    }
    
    //邮箱校验
    @RequestMapping(value="/activate/{userId}",method=RequestMethod.GET)
    public String activateUser(@PathVariable String userId) {
    	try {
			loginService.activateUser(userId);
		} catch (MsgException e) {
			e.printStackTrace();
		}
		return "login/login";
    }
    
}
