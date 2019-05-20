package com.music.controller;

import com.music.service.ImgService;
import com.music.service.VideoService;
import com.music.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class ImgController {
    @Autowired
    private ImgService imgService;

    //获取所有图片
    @GetMapping(value = "/getImg")
    public Msg getImg(){
        List<String > imgs=imgService.getImg();
        return Msg.success().add("imgs",imgs);
    }
}
