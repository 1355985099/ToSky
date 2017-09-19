package com.logistic.controller;

import com.logistic.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by cqb on 2017/9/14.
 * 控制转向Echarts型统计图表
 */
@Controller
public class EchartsController {
//    @RequestMapping("getBMap")
//    public String getBMap(){
//        return "BMap";
//    }

    @RequestMapping("toEcharts")
    public String toEcharts(){
        return "echarts/echarts";
    }

    @RequestMapping("barquery")
    @ResponseBody
    public List<User> barquery(){
        List<User> userList=new ArrayList<User>();
        Map<String,User> map=new HashMap<String,User>();//{"1":{"id":null,"name":"tony5","age":73,"address":null}}
        for(int i=0;i<7;i++) {
            User user = new User();
            user.setUserName("tony"+i);
            user.setState(28+i*((int)(Math.random()*10)));
            userList.add(user);
            map.put("name"+(i+1),user);
        }
        String[] name=new String[]{"衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"};
        return userList;
    }
    
    @RequestMapping("piequery")
    @ResponseBody
    public List<User> piequery(){
        List<User> userList=new ArrayList<User>();
        Map<String,User> map=new HashMap<String,User>();//{"1":{"id":null,"name":"tony5","age":73,"address":null}}
        for(int i=0;i<7;i++) {
            User user = new User();
            user.setUserName("tony"+i);
            user.setState(28+i*((int)(Math.random()*10)));
            userList.add(user);
            map.put("name"+(i+1),user);
        }
        String[] name=new String[]{"衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"};
        return userList;
    }

    @RequestMapping("linequery")
    @ResponseBody
    public List<User> linequery(){
        List<User> userList=new ArrayList<User>();
        Map<String,User> map=new HashMap<String,User>();//{"1":{"id":null,"name":"tony5","age":73,"address":null}}
        for(int i=0;i<7;i++) {
            User user = new User();
            user.setUserName("tony"+i);
            user.setState(28+i*((int)(Math.random()*10)));
            userList.add(user);
            map.put("name"+(i+1),user);
        }
        String[] name=new String[]{"衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"};
        return userList;
    }
}
