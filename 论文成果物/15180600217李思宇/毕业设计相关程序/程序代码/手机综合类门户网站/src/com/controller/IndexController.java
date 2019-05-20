package com.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.entity.Xinwentongzhi;
import com.entity.Yonghuzhuce;
//jixacxishxu1
import com.server.XinwentongzhiServer;
import com.server.YonghuzhuceServer;
//jixacxishxu2

@Controller
public class IndexController {
	
	
	@Resource
	private XinwentongzhiServer xinwentongzhiService;
	@Resource
	private YonghuzhuceServer yonghuzhuceServer;
	//jixacxishxu3
	
	@RequestMapping("videoAdd.do")
	public String addVideoView(){
		
		

		return "videoAdd";
	}
	
//	首页显示内容
	@RequestMapping("index.do")
	public String showIndex(ModelMap map){
		
		List<Xinwentongzhi> syxinwentongzhi1=xinwentongzhiService.getsyxinwentongzhi1(null);
		List<Xinwentongzhi> syxinwentongzhi2=xinwentongzhiService.getsyxinwentongzhi2(null);
		List<Xinwentongzhi> syxinwentongzhi3=xinwentongzhiService.getsyxinwentongzhi3(null);

		List<Yonghuzhuce> syyonghuzhuce1=yonghuzhuceServer.getsyyonghuzhuce1(null);
		//jixacxishxu4
		
	    map.put("syxinwentongzhi1", syxinwentongzhi1);
	    map.put("syxinwentongzhi2", syxinwentongzhi2);
	    map.put("syxinwentongzhi3", syxinwentongzhi3);
	    map.put("syyonghuzhuce1", syyonghuzhuce1);
	    //jixacxishxu5

		return "default";
	}
	@RequestMapping("addVideo.do")
	public String addPost( @RequestParam(value = "video") MultipartFile video,
			HttpServletRequest request,String shuoming) {
		ModelAndView mv = new ModelAndView();
		Long num = System.currentTimeMillis();
		String count = num.toString();
	  
		yonghuzhuceServer.addVideo(count);
		yonghuzhuceServer.addVideo2(shuoming);
		
		ServletContext application = request.getServletContext();
		String realPath = application.getRealPath("upload/");
	
		int index = video.getOriginalFilename().lastIndexOf(".");
		String suffix = video.getOriginalFilename().substring(index + 1);
		String fileName = realPath + File.separator + count + "." + suffix;
		
		try {
			video.transferTo(new File(fileName));
		} catch (Exception e) {
			e.printStackTrace();
		}

		// poster.
		// return userService.addPost(title, content);
		
		return "redirect:xiaomi.do";
	}
	@RequestMapping("video.do")
	public void posterPhoto(String imgName, HttpServletRequest request, HttpServletResponse response) {
		// 找到文件
String imgType="MP4";
		ServletContext application = request.getServletContext();
		String realPath = application.getRealPath("upload");
		// System.out.println(id);
		String fileName = realPath + File.separator + imgName + "." + imgType;
		System.out.println(fileName);
		File file = new File(fileName);
		if (file.exists()) {
			byte[] buffer = new byte[1024];
			FileInputStream fis = null;
			BufferedInputStream bis = null;
			try {
				fis = new FileInputStream(file);
				bis = new BufferedInputStream(fis);
				OutputStream os = response.getOutputStream();
				int i = bis.read(buffer);
				while (i != -1) {
					os.write(buffer, 0, i);
					i = bis.read(buffer);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (bis != null)
					try {
						bis.close();
					} catch (Exception e) {
					}
				if (fis != null)
					try {
						fis.close();
					} catch (Exception e) {
					}
			}
		}
	}
	
}
