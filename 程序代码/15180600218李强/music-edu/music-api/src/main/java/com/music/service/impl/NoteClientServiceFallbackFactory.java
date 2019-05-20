package com.music.service.impl;

import com.music.service.ImgClientService;
import com.music.service.NoteClientService;
import com.music.utils.Msg;
import feign.hystrix.FallbackFactory;
import org.springframework.stereotype.Component;

@Component
public class NoteClientServiceFallbackFactory implements FallbackFactory<NoteClientService> {
    @Override
    public NoteClientService create(Throwable throwable) {
        return new NoteClientService() {
            @Override
            public Msg getNote() {
                return Msg.fail().add("info","未能成功调取到provider提供的接口，这是服务降级返回的信息--NoteController");
            }

            @Override
            public Msg getArticleById(Integer id) {
                return Msg.fail().add("info","未能成功调取到provider提供的接口，这是服务降级返回的信息--NoteController");
            }
        };
    }
}
