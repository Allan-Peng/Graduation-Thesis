package com.music.controller;

import com.music.entities.User;
import com.music.service.UserService;
import com.music.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class UserController {
    @Autowired
    UserService userService;

    @PostMapping(value = "/register",produces = "application/json;charset=UTF-8")
    public Msg register(@RequestBody User user) {
        if(userService.register(user)){
            return Msg.success().add("username",user.getUsername());
        }else{
            return Msg.fail().add("username",user.getUsername());
        }
    }

    @PostMapping(value = "/login",produces = "application/json;charset=UTF-8")
    public Msg login(@RequestBody User user) {
        int statue=userService.login(user);
        if(statue==1){
            return Msg.success().add("info","登陆成功").add("username",user.getUsername());
        }else if(statue==0){
            return Msg.fail().add("info","用户名和密码错误");
        }
        else if(statue==2){
            return Msg.fail().add("info","用户违规被封禁");
        }else{
            return Msg.fail();
        }
    }

}
