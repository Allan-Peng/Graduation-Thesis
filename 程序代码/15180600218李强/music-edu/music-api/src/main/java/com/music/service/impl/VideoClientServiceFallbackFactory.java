package com.music.service.impl;

import com.music.entities.Video;
import com.music.service.VideoClientService;
import com.music.utils.Msg;
import feign.hystrix.FallbackFactory;
import org.springframework.stereotype.Component;

@Component // 不要忘记添加，不要忘记添加
public class VideoClientServiceFallbackFactory implements FallbackFactory<VideoClientService> {
    @Override
    public VideoClientService create(Throwable throwable) {
        return new VideoClientService() {
            @Override
            public Msg get() {
                return Msg.fail().add("info","我是测试服务熔断的");
            }
            @Override
            public Msg insertVideo(Video video) {
                return Msg.fail().add("info","视频信息插入服务异常");
            }
            @Override
            public Msg getLastVideo() {
                return Msg.fail().add("info","未能成功调取到provider提供的接口，这是服务降级返回的信息");
            }

            @Override
            public Msg getHotVideo() {
                return Msg.fail().add("info","未能成功调取到provider提供的接口，这是服务降级返回的信息");
            }

            @Override
            public Msg getVideo() {
                return Msg.fail().add("info","未能成功调取到provider提供的接口，这是服务降级返回的信息");
            }
        };
    }
}
