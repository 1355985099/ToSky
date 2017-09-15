package com.logistic.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.logistic.pojo.User;
import com.logistic.pojo.UserAging;


public interface UserMapper {
     List<User> findAll();
    /**
     * 添加用户
     * @param user
     */
     void saveUser(User user);
     
     
     /**
      * 添加时效验证
      * @param id 用户id
      * @param aging 用户时效
      * @param state 状态
      */
     @Insert("insert into user_activate (user_id,activate_aging,state,email) values (#{id},#{aging},#{state},#{email})")
      void saveAging(@Param("id")String id,@Param("aging")Date aging,@Param("state")Integer state,@Param("email")String email);
     /**
      * 更新用户表状态
      * @param userId
      * @param state
      */
     void updateUserState(@Param("userId")String userId,@Param("state")Integer state);
     
     /**
      * 更新邮箱时状态
      * @param userId
      * @param state
      */
     void updateUserActivateState(@Param("userId")String userId,@Param("state")Integer state);
     /**
      * 查询时效
      * @param userId
      * @return
      */
     UserAging finAging(String userId); 
}
