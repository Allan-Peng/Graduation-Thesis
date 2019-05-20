package com.music.controller;


import com.music.entities.Video;
import com.music.service.client.FileClientService;
import com.music.service.VideoService;
import com.music.file.FileUtil;
import com.music.utils.Msg;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/api")
public class VideoController {
    @Autowired
    private FileUtil fileUtil;
    @Autowired
    private VideoService videoService;
    @Autowired
    private FileClientService fileClientService;

    @GetMapping("/get")
    public Msg get(){
        return Msg.success().add("info","成功调取到了provider的get接口内容");
    }


    //视频文件上传
    /*@PostMapping("/uploadVideo")
    public Msg uploadVideo(@RequestParam("file") MultipartFile file)  {
        String fileName = fileUtil.upFileMethod(file);
        String imgName=fileUtil.creatImg(fileName);
        return Msg.success().add("videoName",fileName).add("imgName",imgName);
    }*/
    @PostMapping("/uploadVideo")
    public Msg uploadVideo(@RequestParam("file") MultipartFile file)  {
        String fileName = fileClientService.uploadFile(file);
        //String fileName =fileUtil.upFileMethod(file);
        String imgName=fileUtil.creatImg(fileName);
        return Msg.success().add("videoName",fileName).add("imgName",imgName);
    }
    //视频信息存储
    @PostMapping(value = "/insertVideo",produces = "application/json;charset=UTF-8")/**/
    public Msg insertVideo(@RequestBody Video video){
        if(videoService.insertVideo(video)!=0){
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }
    //按时间获取最新视频
    @GetMapping(value = "getLastVideo")
    @HystrixCommand
    public Msg getLastVideo(){
        Video lastVideo=videoService.getLastVideo();
        return Msg.success().add("lastVideo",lastVideo);
    }
    //按播放量获取最热视频
    @GetMapping(value = "getHotVideo")
    public Msg getHotVideo(){
        Video hotVideo=videoService.getHotVideo();
        return Msg.success().add("hotVideo",hotVideo);
    }
    //按播放量获取最热视频
    @GetMapping(value = "getVideo")
    public Msg getVideo(){
        List<Video> videos=videoService.getVideo();
        return Msg.success().add("videos",videos);
    }








}
