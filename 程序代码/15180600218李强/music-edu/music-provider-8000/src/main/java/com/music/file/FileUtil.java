package com.music.file;

import com.music.utils.DateUtil;
import lombok.experimental.var;
import org.bytedeco.javacv.FFmpegFrameGrabber;
import org.bytedeco.javacv.Frame;
import org.bytedeco.javacv.FrameGrabber;
import org.bytedeco.javacv.Java2DFrameConverter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;

@Component
public class FileUtil {

    @Value("${file.uploadFolder}")
    public String uploadFolder ; //     /home/sleepy/music/uploadFolder/  对外暴漏路径  /music/download/**


    public String creatImg(String fileName) {

        String imgName = DateUtil.getCurrentDate()+getFileName(fileName)+".png";
        System.out.println("imgName = " + imgName);
        FFmpegFrameGrabber ff = null;
        try {
            ff = FFmpegFrameGrabber.createDefault(uploadFolder+fileName);
            ff.start();
            int ffLength = ff.getLengthInFrames();
            Frame f;
            int i = 0;
            while (i < ffLength) {
                f = ff.grabImage();
                //截取第6帧
                if((i>1) &&  (f.image != null)){
                    //生成图片的相对路径 例如：pic/uuid.png
                    //执行截图并放入指定位置
                    doExecuteFrame(f, uploadFolder+imgName);
                    break;
                }
                i++;
            }
        } catch (FrameGrabber.Exception e) {
            e.printStackTrace();
        } finally {
            try {
                ff.stop();
            } catch (FrameGrabber.Exception e) {
                e.printStackTrace();
            }
        }



        return imgName;
    }

    /**
     * 截取缩略图
     * @param f Frame
     * @param targerFilePath:封面图片存放路径
     */
    private static void doExecuteFrame(Frame f, String targerFilePath) {
        String imagemat = "png";
        if (null == f || null == f.image) {
            return;
        }
        Java2DFrameConverter converter = new Java2DFrameConverter();
        BufferedImage bi = converter.getBufferedImage(f);
        File output = new File(targerFilePath);
        try {
            ImageIO.write(bi, imagemat, output);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public static String getFileName(String str) {
        int start = str.indexOf("-");
        int end = str.indexOf(".");
        return str.substring(start,end);
    }
}
