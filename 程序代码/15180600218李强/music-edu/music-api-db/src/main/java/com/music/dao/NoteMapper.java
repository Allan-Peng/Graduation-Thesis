package com.music.dao;

import com.music.entities.Note;
import com.music.entities.NoteExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface NoteMapper {
    long countByExample(NoteExample example);

    int deleteByExample(NoteExample example);

    int insert(Note record);

    int insertSelective(Note record);

    List<Note> selectByExample(NoteExample example);

    int updateByExampleSelective(@Param("record") Note record, @Param("example") NoteExample example);

    int updateByExample(@Param("record") Note record, @Param("example") NoteExample example);
}