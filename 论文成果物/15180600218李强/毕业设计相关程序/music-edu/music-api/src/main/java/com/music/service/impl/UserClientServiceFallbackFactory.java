package com.music.service.impl;

import com.music.entities.User;
import com.music.service.UserClientService;
import com.music.utils.Msg;
import feign.hystrix.FallbackFactory;
import org.springframework.stereotype.Component;

@Component
public class UserClientServiceFallbackFactory implements FallbackFactory<UserClientService> {
    @Override
    public UserClientService create(Throwable throwable) {
        return new UserClientService() {
            @Override
            public Msg register(User user) {
                return Msg.fail().add("info","未能成功调取到provider提供的接口，这是服务降级返回的信息");
            }

            @Override
            public Msg login(User user) {
                return Msg.fail().add("info","未能成功调取到provider提供的接口，这是服务降级返回的信息");
            }
        };
    }
}
