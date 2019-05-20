package com.music.service;

import com.music.dao.NoteMapper;
import com.music.entities.Note;
import com.music.entities.NoteExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class NoteService {
    @Autowired
    NoteMapper noteMapper;

    public int insertArticle(Note note) {
        note.setCreateTime(new Date());
        note.setUpdateTime(new Date());
        note.setStatus(0);

        return noteMapper.insertSelective(note);
    }

    public List<Note> getAllArticle() {
        return noteMapper.selectByExample(new NoteExample());
    }

    public Note getArticle(Integer id) {
        NoteExample noteExample=new NoteExample();
        noteExample.or().andIdEqualTo(id);
        return noteMapper.selectByExample(noteExample).get(0);
    }

    public int updateArticle(Note note) {
        NoteExample noteExample=new NoteExample();
        noteExample.or().andIdEqualTo(note.getId());
        return noteMapper.updateByExampleSelective(note,noteExample);
    }

    public boolean deleteByKeys(Integer[] ids) {
        for(Integer id:ids){
            NoteExample noteExample=new NoteExample();
            noteExample.or().andIdEqualTo(id);
            noteMapper.deleteByExample(noteExample);
        }
        return true;
    }

    public boolean updatePublic(Integer[] ids,Integer status) {
        for(Integer id:ids){
            NoteExample noteExample=new NoteExample();
            noteExample.or().andIdEqualTo(id);
            Note note=new Note();
            note.setId(id);
            note.setStatus(status);
            noteMapper.updateByExampleSelective(note,noteExample);
        }
        return true;
    }

    public List<Note> getArticleByStatus(Integer status) {
        NoteExample noteExample=new NoteExample();
        noteExample.or().andStatusEqualTo(status);
        return noteMapper.selectByExample(noteExample);
    }

    public List<Note> getArticleBySearch(String title) {
        NoteExample noteExample=new NoteExample();
        noteExample.or().andTitleLike("%" + title + "%");
        return noteMapper.selectByExample(noteExample);
    }
}
