package com.music.service;

import com.music.entities.User;
import com.music.entities.Video;
import com.music.service.impl.UserClientServiceFallbackFactory;
import com.music.service.impl.VideoClientServiceFallbackFactory;
import com.music.utils.Msg;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/api")
@FeignClient(name = "music-provider",fallbackFactory = UserClientServiceFallbackFactory.class)
public interface UserClientService {

    @PostMapping(value = "/register",produces = "application/json;charset=UTF-8")
    Msg register(@RequestBody User user);

    @PostMapping(value = "/login",produces = "application/json;charset=UTF-8")
    Msg login(@RequestBody User user);
}

