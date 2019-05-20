package com.music.service;

import com.music.service.impl.VideoClientServiceFallbackFactory;
import com.music.utils.Msg;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/api")
@FeignClient(name = "music-provider")
public interface ImgClientService {
    @GetMapping(value = "/getImg")
    Msg getImg();
}
