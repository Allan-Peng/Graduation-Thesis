package com.music.controller;

import com.music.entities.Note;
import com.music.service.ImgService;
import com.music.service.NoteService;
import com.music.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class NoteController {
    @Autowired
    private NoteService noteService;

    //获取所有文章
    @GetMapping(value = "/getNote")
    public Msg getNote(){
        List<Note> notes=noteService.getNote();
        return Msg.success().add("notes",notes);
    }

    @GetMapping(value = "/getArticleById/{id}")
    public Msg getNote(@PathVariable("id") Integer id){
        Note note=noteService.getArticleById(id);
        return Msg.success().add("note",note);
    }
}
