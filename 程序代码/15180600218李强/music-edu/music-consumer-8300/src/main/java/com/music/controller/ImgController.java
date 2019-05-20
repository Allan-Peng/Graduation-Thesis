package com.music.controller;

import com.music.service.ImgClientService;
import com.music.service.VideoClientService;
import com.music.service.VideoClientUpload;
import com.music.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/degradeApi")
public class ImgController {
    @Autowired
    private ImgClientService imgClientService;

    //获取所有图片
    @GetMapping(value = "/getImg")
    public Msg getImg(){
        return imgClientService.getImg();
    }

}
