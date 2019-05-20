package com.music.service;

import com.music.dao.NoteMapper;
import com.music.entities.Note;
import com.music.entities.NoteExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoteService {
    @Autowired
    private NoteMapper noteMapper;

    public List<Note> getNote() {
        NoteExample noteExample = new NoteExample();
        noteExample.or().andStatusEqualTo(1);
        return noteMapper.selectByExample(noteExample);
    }

    public Note getArticleById(Integer id) {
        NoteExample noteExample = new NoteExample();
        noteExample.or().andIdEqualTo(id);
        return noteMapper.selectByExample(noteExample).get(0);
    }
}
