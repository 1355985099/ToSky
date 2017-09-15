package com.logistic.controller;

import com.logistic.Exception.MsgException;
import com.logistic.pojo.User;
import com.logistic.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;


@Controller
@RequestMapping("/user/")
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


    
}
