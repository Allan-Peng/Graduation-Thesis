package com.music.controller;

import com.alibaba.fastjson.JSON;
import com.music.entities.Note;
import com.music.service.NoteService;
import com.music.service.client.FileClientService;
import com.music.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.lang.model.SourceVersion;
import javax.servlet.ServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/article")
public class NoteController {
    @Autowired
    NoteService noteService;
    @Autowired
    private FileClientService fileClientService;

    @PostMapping(value = "/insertArticle", produces = "application/json;charset=UTF-8")
    public Msg insertArticle(@RequestBody Note note) {
        if (noteService.insertArticle(note) != 0) {
            return Msg.success();
        } else {
            return Msg.fail();
        }
    }
    //icon图片上传
    @PostMapping(value = "/pngUpload")
    public Msg pngUPload(@RequestParam("file") MultipartFile file, String fileName) {
        String imgSrc = fileClientService.uploadFile(file);
        if (imgSrc != null && !imgSrc.isEmpty()) {
            return Msg.success().add("imgSrc", imgSrc);
        } else {
            return Msg.fail();
        }
    }

    //ueditor图片上传
    @PostMapping(value = "/fileUpload2")
    public String fileUpload2(@RequestParam("file") MultipartFile file) {
        String fileName = fileClientService.uploadFile(file);
        Map<String, Object> result = new HashMap<String, Object>();

        result.put("url", fileName);// 展示图片的请求url
        result.put("state", "SUCCESS");
        String jStr = JSON.toJSONString(result);
        return jStr;
    }
    //ueditor视频上传
    @PostMapping("/uploadVideo")
    public String uploadVideo(@RequestParam("file") MultipartFile file) {
        String fileName = fileClientService.uploadFile(file);
        //return "../../upload/"+fileName;
        return fileName;
    }
    //获取所有文章信息
    @GetMapping(value = "/getAllArticle")
    public Msg getAllArticle() {
        List<Note> notes = noteService.getAllArticle();
        return Msg.success().add("graphicsList", notes);
    }

    @GetMapping(value = "/getArticle/{id}")
    public Msg getArticle(@PathVariable("id") Integer id) {
        Note note = noteService.getArticle(id);
        return Msg.success().add("article", note);
    }



    /*修改更新文章*/
    @PutMapping(value = "/updateArticle")
    public Msg updateArticle(@RequestBody Note note) {
        if (noteService.updateArticle(note) != 0) {
            return Msg.success();
        } else {
            return Msg.fail();
        }
    }

    @DeleteMapping(value = "/delete", produces = {"application/json;charset=UTF-8"})
    public Msg delete(@RequestBody Map<String, Integer[]> map) {
        Integer[] ids = map.get("articleIds");
        if (noteService.deleteByKeys(ids)) {
            return Msg.success();
        } else {
            return Msg.fail();
        }
    }

    //发布
    @PutMapping(value = "/public", produces = {"application/json;charset=UTF-8"})
    public Msg publicStatus(@RequestBody Map<String, Integer[]> map) {
        Integer[] ids = map.get("articleIds");
        if (noteService.updatePublic(ids, 1)) {
            return Msg.success();
        } else {
            return Msg.fail();
        }
    }

    //撤销发布
    @PutMapping(value = "/unpublic", produces = {"application/json;charset=UTF-8"})
    public Msg unpublic(@RequestBody Map<String, Integer[]> map) {
        Integer[] ids = map.get("articleIds");
        if (noteService.updatePublic(ids, 0)) {
            return Msg.success();
        } else {
            return Msg.fail();
        }
    }

    @GetMapping(value = "/getArticleByStatus/{status}")
    public Msg getArticleByStatus(@PathVariable("status") Integer status) {
        List<Note> graphics = null;
        if (status == -1) {
            graphics = noteService.getAllArticle();
        } else {
            graphics = noteService.getArticleByStatus(status);
        }

        return Msg.success().add("graphicsList", graphics);
    }
    //根据标题搜索
    @GetMapping("/getArticleBySearch/{title}")
    public Msg getArticleBySearch(@PathVariable("title") String title){
        List<Note> graphics=noteService.getArticleBySearch(title);
        return Msg.success().add("graphicsList",graphics);
    }
}
