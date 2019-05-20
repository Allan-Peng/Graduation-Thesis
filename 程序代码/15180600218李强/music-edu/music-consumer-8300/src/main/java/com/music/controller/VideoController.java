package com.music.controller;

import com.music.entities.Video;
import com.music.service.VideoClientService;
import com.music.service.VideoClientUpload;
import com.music.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/degradeApi")
public class VideoController {
    @Autowired
    private VideoClientService videoClientService;
    @Autowired
    private VideoClientUpload videoClientUpload;



    //视频文件上传
    @GetMapping( "/get")
    public Msg get() {
        return videoClientService.get();
    }

    //视频文件上传
    @PostMapping("/uploadVideo")
    public Msg uploadVideo(@RequestParam("file") MultipartFile file)  {
        return videoClientUpload.uploadVideo(file);
    }
    //视频信息存储
    @PostMapping(value = "/insertVideo",produces = "application/json;charset=UTF-8")
    public Msg insertVideo(@RequestBody Video video){
        return videoClientService.insertVideo(video);
    }
    //按时间获取最新视频
    @GetMapping(value = "/getLastVideo")
    public Msg getLastVideo(){
        return videoClientService.getLastVideo();
    }
    //按播放量获取最热视频
    @GetMapping(value = "/getHotVideo")
    public Msg getHotVideo(){
        return videoClientService.getHotVideo();
    }

    //获取所有视频
    @GetMapping(value = "/getVideo")
    public Msg getVideo(){
        return videoClientService.getVideo();
    }

}
