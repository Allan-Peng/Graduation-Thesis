package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.shipin;
import com.server.YonghuzhuceServer;

@Controller
public class shipinController {
	@Resource
	private YonghuzhuceServer yonghuzhuceServer;




	
	@RequestMapping("xiaomi.do")
	public String xiaomi(ModelMap map) {
		
		List<String> urls=yonghuzhuceServer.findVideo();
		List<String> shuomings=yonghuzhuceServer.findShuoming();
		List<String> arrs=new ArrayList<>();
		/*for(int i=0;i<urls.size();i++){
			String arr=urls.get(i)+"***"+shuomings.get(i);
			arrs.add(arr);

		}*/
		List<shipin> shipin= new  ArrayList();
		int count=urls.size();
		for(int i=0;i<count;i++)
		{
			
			shipin a=new shipin(0, shuomings.get(i),urls.get(i));
		 shipin.add(a);
			
		}
		map.put("shipin",shipin);
			map.put("arrs",arrs);
		return "xiaomi";
	}
	@RequestMapping("huawei.do")
	public String huawei() {
			return "huawei";
	}
}
