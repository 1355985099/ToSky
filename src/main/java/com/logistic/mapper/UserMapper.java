package com.logistic.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;

import com.logistic.pojo.User;


public interface UserMapper {
     List<User> findAll();
    /**
     * 添加用户
     * @param user
     */
     void saveUser(User user);

}
