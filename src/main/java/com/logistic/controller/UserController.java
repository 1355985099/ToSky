package com.logistic.controller;

import com.logistic.pojo.User;
import com.logistic.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    
    @RequestMapping("/find")
    public String toFind() {
    	return "orderInfo";
    }
}
