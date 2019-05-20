package com.music.controller;

import com.music.utils.DateUtil;
import com.music.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;

@RestController
public class FileController {
    @Value("${file.uploadFolder}")
    public String uploadFolder ; //     /home/sleepy/music/uploadFolder/  对外暴漏路径  /music/download/**
    //视频文件上传
    @PostMapping("/uploadFile")
    public String uploadVideo(@RequestParam("file") MultipartFile upFile)  {
        String fileName = upFile.getOriginalFilename();
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        File file= new File(uploadFolder);
        if(!file.exists()){
            file.mkdirs();
        }
        try {
            InputStream is = upFile.getInputStream();
            FileOutputStream fos = new FileOutputStream(uploadFolder+ DateUtil.getCurrentDate()+"-"+fileName );
            bis=new BufferedInputStream(is);
            bos=new BufferedOutputStream(fos);
            int len;
            byte[] bytes = new byte[1024];
            while((len = bis.read(bytes)) != -1) {
                bos.write(bytes, 0, len);
                bos.flush();
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if(bos!=null){
                try {
                    bos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if(bis!=null){
                try {
                    bis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        System.out.println("我他妹上传文件成功了");
        return  DateUtil.getCurrentDate()+"-"+fileName;
    }
}
