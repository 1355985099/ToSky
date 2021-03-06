package com.logistic.controller;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotNull;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
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
    //登陆
    public String login(String userName,String password,Model model,HttpSession Session) {
    	Subject subject = SecurityUtils.getSubject();
    	UsernamePasswordToken userToken = new UsernamePasswordToken(userName, password);
		try {
//			user = loginService.Login(userName,password);
			subject.login(userToken);
			User user=(User) subject.getPrincipal();
			Session.setAttribute("sessionUser",user);
			return "home"; 
		} catch (AuthenticationException e) {
			model.addAttribute("msg", "用戶名或密碼錯誤");
			e.printStackTrace();
			return "login/login";
		} catch (Exception e) {
			model.addAttribute("msg", "未知錯誤，請聯繫管理員");
			e.printStackTrace();
			return "login/login";
		}
    }
   
    //注册
    @RequestMapping("/reg")
    public String reg(@Validated User user,BindingResult br,Model model) {
    	if(br.hasErrors()) {
    		model.addAttribute("msg", br.getFieldError().getDefaultMessage());
    		model.addAttribute("user", user);
    		return "login/reg"; //注册页面
    	}
    	try {
    		loginService.registerUser(user);
		} catch (MsgException e) {
			model.addAttribute("msg",e.getMessage());
			model.addAttribute("user", user);
			return "login/reg";  //返回注册页面
		}
    	model.addAttribute("user", user);
    	//推断邮箱的登陆地址
    	model.addAttribute("email",user.getEmail().substring(user.getEmail().indexOf("@")+1));
    	return "login/activate";
    }
    
    //邮箱校验
    @RequestMapping(value="/activate/{userId}",method=RequestMethod.GET)
    public String activateUser(@PathVariable String userId,Model model) {
    	try {
			loginService.activateUser(userId);
		} catch (MsgException e) {
			String error=e.getMessage();
			model.addAttribute("msg", error.split(",")[0]); //错误提示
			model.addAttribute("link", error.split(",")[1]); //连接
			return "login/message";
		}
    	model.addAttribute("msg", "激活成功请登录");
		return "login/login";
    }
    
    //重新发送邮箱
    @RequestMapping(value="/timeout/{userId}",method=RequestMethod.GET)
    public String timeout(@PathVariable String userId,Model model) {
    	User user = loginService.sendEmail(userId);
    	model.addAttribute("user", user);
    	//推断邮箱的登陆地址
    	model.addAttribute("email",user.getEmail().substring(user.getEmail().indexOf("@")+1));
    	return "login/activate";
    	
    }
    
    //校验是否重复
    @RequestMapping("/isRepeat")
    public void isRepeat(String vf,HttpServletResponse rep) {
     	if(StringUtils.isEmpty(vf)) {
    		return ;
    	}
    	try {
			rep.getWriter().write(loginService.isRepeat(vf));
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
	@RequestMapping("/logout")
	//退出
	public String logout(String userName,String password,Model model,HttpSession Session) {
		User user=null;
		try {
			user = loginService.Login(userName,password);
		} catch (MsgException e) {
			model.addAttribute("msg", e.getMessage());
			e.printStackTrace();
		}
		Session.setAttribute("sessionUser",user);
		return "home";

	}
    
}
