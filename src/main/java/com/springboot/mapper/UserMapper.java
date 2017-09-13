package com.springboot.mapper;

import com.springboot.pojo.User;

import java.util.List;


public interface UserMapper {
    public List<User> findAll();

}
