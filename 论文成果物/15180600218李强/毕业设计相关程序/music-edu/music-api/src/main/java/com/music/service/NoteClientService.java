package com.music.service;

import com.music.service.impl.NoteClientServiceFallbackFactory;
import com.music.utils.Msg;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/api")
@FeignClient(name = "music-provider",fallbackFactory = NoteClientServiceFallbackFactory.class)
public interface NoteClientService {
    @GetMapping(value = "/getNote")
    Msg getNote();

    @GetMapping(value = "/getArticleById/{id}")
    Msg getArticleById(@PathVariable("id") Integer id);
}
