package com.logistic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.logistic.mapper.RoleMapper;
import com.logistic.pojo.Role;

@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleMapper roleMapper;

	//查找所有的角色信息
	public List<Role> findAll() {
		return roleMapper.findAll();
	}

}
