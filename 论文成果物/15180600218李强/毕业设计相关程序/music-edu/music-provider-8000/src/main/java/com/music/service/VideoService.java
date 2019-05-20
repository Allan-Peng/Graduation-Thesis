package com.music.service;


import com.music.dao.VideoMapper;
import com.music.entities.Video;
import com.music.entities.VideoExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.*;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class VideoService {
    @Autowired
    private VideoMapper videoMapper;

    public int insertVideo(Video video) {
        video.setUpdateTime(new Date());
        return videoMapper.insertSelective(video);
    }

    public Video getLastVideo() {
        VideoExample videoExample=new VideoExample();
        videoExample.setOrderByClause("update_time desc");
        List<Video> videos = videoMapper.selectByExample(videoExample);
        return videos.get(0);
    }

    public Video getHotVideo() {
        VideoExample videoExample=new VideoExample();
        videoExample.setOrderByClause("play_times desc");
        List<Video> videos = videoMapper.selectByExample(videoExample);
        return videos.get(0);
    }
    
    public List<Video> getVideo() {
        return videoMapper.selectByExample(new VideoExample());
    }
}
