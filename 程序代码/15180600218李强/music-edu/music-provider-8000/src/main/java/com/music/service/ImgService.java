package com.music.service;


import com.music.dao.NoteMapper;
import com.music.dao.VideoMapper;
import com.music.entities.Note;
import com.music.entities.NoteExample;
import com.music.entities.Video;
import com.music.entities.VideoExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ImgService {
    @Autowired
    private VideoMapper videoMapper;
    @Autowired
    private NoteMapper noteMapper;


    public List<String> getImg() {
        List<String> imgs=new ArrayList<>();
        List<Video> videos = videoMapper.selectByExample(new VideoExample());
        for(Video video:videos){
            String url=video.getPng();
            imgs.add(url);
        }
        List<Note> notes = noteMapper.selectByExample(new NoteExample());
        for(Note note:notes){
            String url=note.getIcon();
            imgs.add(url);
        }
        return imgs;
    }
}
