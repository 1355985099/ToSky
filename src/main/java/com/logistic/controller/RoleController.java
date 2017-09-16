package com.logistic.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.logistic.pojo.Role;
import com.logistic.service.RoleService;

@Controller
@RequestMapping("/role")
public class RoleController {
	@Autowired
	private RoleService roleService;
	
	@RequestMapping("/toFindAll")
	public String findAll(Model model){
		List<Role> roleList=roleService.findAll();
		model.addAttribute("roleList", roleList);
		return "/role/jRoleList";
	}
	

}
