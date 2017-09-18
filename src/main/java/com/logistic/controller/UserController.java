package com.logistic.controller;

import com.logistic.Exception.MsgException;
import com.logistic.pojo.User;
import com.logistic.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/findAll")
    public String findAll(Model model){

        List<User> userList = userService.findAll();
        model.addAttribute("userList",userList);
        //经过视图解析器跳转页面
        return  "userList";
    }

    
    @RequestMapping("/login")
    public String login(String userName ,String password) {
    	
    	System.out.println(password + "<==password");
		return null;
    	
    }
    @RequestMapping("/user/reg")
    public String reg(@Validated User user,BindingResult br,Model model) {
    	if(br.hasErrors()) {
    		model.addAttribute("error", br.getFieldError().getDefaultMessage());
    	}
    	try {
			userService.saveUser(user);
		} catch (MsgException e) {
			model.addAttribute("error",e.getMessage());
		}
		return "redirect://";
    }
    



}
