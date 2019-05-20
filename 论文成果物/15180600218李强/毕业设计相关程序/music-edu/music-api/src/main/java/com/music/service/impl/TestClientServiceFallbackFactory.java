package com.music.service.impl;

import com.music.service.TestClientService;
import com.music.utils.Msg;
import feign.hystrix.FallbackFactory;
import org.springframework.stereotype.Component;

@Component // 不要忘记添加，不要忘记添加
public class TestClientServiceFallbackFactory implements FallbackFactory<TestClientService> {
    @Override
    public TestClientService create(Throwable throwable) {
        return new TestClientService() {
            @Override
            public Msg get() {
                return Msg.fail().add("info","未能成功调取到provider提供的接口，这是服务降级返回的信息");
            }
        };
    }
}
