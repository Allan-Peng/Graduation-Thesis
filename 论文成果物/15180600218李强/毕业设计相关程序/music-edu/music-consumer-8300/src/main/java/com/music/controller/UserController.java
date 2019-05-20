package com.music.controller;

import com.music.entities.User;
import com.music.service.UserClientService;
import com.music.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("degradeApi")
public class UserController {
    @Autowired
    private UserClientService userClientService;

    @PostMapping(value = "/register",produces = "application/json;charset=UTF-8")
    public Msg register(@RequestBody User user) {

        return userClientService.register(user);
    }
    @PostMapping(value = "/login",produces = "application/json;charset=UTF-8")
    public Msg login(@RequestBody User user) {
        return userClientService.login(user);
    }
}
