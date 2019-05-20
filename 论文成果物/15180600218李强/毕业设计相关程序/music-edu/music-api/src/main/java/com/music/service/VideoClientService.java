package com.music.service;

import com.music.entities.Video;
import com.music.service.impl.VideoClientServiceFallbackFactory;
import com.music.utils.Msg;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/api")
@FeignClient(name = "music-provider",fallbackFactory = VideoClientServiceFallbackFactory.class)/**/
public interface VideoClientService {

    @GetMapping(value = "/get")
    Msg get();

    //@PostMapping(value = "/insertVideo")
    @PostMapping(value = "/insertVideo")/*,method = RequestMethod.POST*/
    Msg insertVideo(@RequestBody Video video);

    @GetMapping(value = "/getLastVideo")
    Msg getLastVideo();
    @GetMapping(value = "/getHotVideo")
    Msg getHotVideo();
    @GetMapping(value = "/getVideo")
    Msg getVideo();
}

