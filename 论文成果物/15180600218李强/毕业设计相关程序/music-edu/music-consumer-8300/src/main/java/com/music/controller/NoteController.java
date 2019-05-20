package com.music.controller;

import com.music.service.ImgClientService;
import com.music.service.NoteClientService;
import com.music.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/degradeApi")
public class NoteController {
    @Autowired
    private NoteClientService noteClientService;

    //获取所有文章
    @GetMapping(value = "/getNote")
    public Msg getNote(){
        return noteClientService.getNote();
    }


    @GetMapping(value = "/getArticleById/{id}")
    public Msg getNote(@PathVariable("id") Integer id){
        return noteClientService.getArticleById(id);
    }

}
