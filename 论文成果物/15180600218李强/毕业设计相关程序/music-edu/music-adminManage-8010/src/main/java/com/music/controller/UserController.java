package com.music.controller;

import com.music.entities.User;
import com.music.service.UserService;

import com.music.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/api/user")
public class UserController {
    @Autowired
    UserService userService;

    @GetMapping(value = "/getAllUser")
    public Msg getAllUser(){
        List<User> users=userService.getAllUser();
        return Msg.success().add("users",users);
    }

    @PutMapping(value = "/enableUser")
    public Msg enableUser(@RequestBody Map<String,String[]> map){
        String[] users = map.get("users");
        if(userService.enableUser(users)){
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }
    @PutMapping(value = "/disableUser")
    public Msg disableUser(@RequestBody Map<String,String[]> map){
        String[] users = map.get("users");
        if(userService.disableUser(users)){
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }

}
