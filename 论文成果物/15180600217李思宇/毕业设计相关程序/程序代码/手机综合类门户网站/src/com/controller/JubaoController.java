package com.controller;

import java.io.File;
import java.io.IOException;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.entity.Jubao;
import com.server.JubaoServer;
import com.util.PageBean;
import net.sf.json.JSONObject;
import com.util.db;
import java.sql.SQLException;
import java.sql.*;
@Controller
public class JubaoController {
	@Resource
	private JubaoServer jubaoService;


   
	@RequestMapping("addJubao.do")
	public String addJubao(HttpServletRequest request,Jubao jubao,HttpSession session) throws SQLException{
		Timestamp time=new Timestamp(System.currentTimeMillis());
		
		jubao.setAddtime(time.toString().substring(0, 19));
		jubaoService.add(jubao);
		session.setAttribute("backxx", "添加成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		
		//session.setAttribute("backurl", "jubaoList.do");
		
		return "redirect:postback.jsp";
		//return "redirect:jubaoList.do";
		
		
		
	}
 
//	处理编辑
	@RequestMapping("doUpdateJubao.do")
	public String doUpdateJubao(int id,ModelMap map,Jubao jubao){
		jubao=jubaoService.getById(id);
		map.put("jubao", jubao);
		return "jubao_updt";
	}
	
	
	
	
	
//	后台详细
	@RequestMapping("jubaoDetail.do")
	public String jubaoDetail(int id,ModelMap map,Jubao jubao){
		jubao=jubaoService.getById(id);
		map.put("jubao", jubao);
		return "jubao_detail";
	}
//	前台详细
	@RequestMapping("jbDetail.do")
	public String jbDetail(int id,ModelMap map,Jubao jubao){
		jubao=jubaoService.getById(id);
		map.put("jubao", jubao);
		return "jubaodetail";
	}
//	
	@RequestMapping("updateJubao.do")
	public String updateJubao(int id,ModelMap map,Jubao jubao,HttpServletRequest request,HttpSession session){
		jubaoService.update(jubao);
		session.setAttribute("backxx", "修改成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		return "redirect:postback.jsp";
		//String url = request.getHeader("Referer");
		//return "redirect:"+url;
		//return "redirect:jubaoList.do";
	}

//	分页查询
	@RequestMapping("jubaoList.do")
	public String jubaoList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Jubao jubao, String pinglunneirong, String pinglunren, String jubaoneirong, String jubaoren){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		
		if(pinglunneirong==null||pinglunneirong.equals("")){pmap.put("pinglunneirong", null);}else{pmap.put("pinglunneirong", pinglunneirong);}		if(pinglunren==null||pinglunren.equals("")){pmap.put("pinglunren", null);}else{pmap.put("pinglunren", pinglunren);}		if(jubaoneirong==null||jubaoneirong.equals("")){pmap.put("jubaoneirong", null);}else{pmap.put("jubaoneirong", jubaoneirong);}		if(jubaoren==null||jubaoren.equals("")){pmap.put("jubaoren", null);}else{pmap.put("jubaoren", jubaoren);}		
		int total=jubaoService.getCount(pmap);
		pageBean.setTotal(total);
		List<Jubao> list=jubaoService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "jubao_list";
	}
	
	@RequestMapping("jubaoList2.do")
	public String jubaoList2(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Jubao jubao, String pinglunneirong, String pinglunren, String jubaoneirong, String jubaoren,HttpServletRequest request){
		/*if(session.getAttribute("user")==null){
			return "login";
		}*/
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		pmap.put("jubaoren", (String)request.getSession().getAttribute("username"));
		if(pinglunneirong==null||pinglunneirong.equals("")){pmap.put("pinglunneirong", null);}else{pmap.put("pinglunneirong", pinglunneirong);}		if(pinglunren==null||pinglunren.equals("")){pmap.put("pinglunren", null);}else{pmap.put("pinglunren", pinglunren);}		if(jubaoneirong==null||jubaoneirong.equals("")){pmap.put("jubaoneirong", null);}else{pmap.put("jubaoneirong", jubaoneirong);}		
		
		int total=jubaoService.getCount(pmap);
		pageBean.setTotal(total);
		List<Jubao> list=jubaoService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "jubao_list2";
	}	
	
	@RequestMapping("jbList.do")
	public String jbList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Jubao jubao, String pinglunneirong, String pinglunren, String jubaoneirong, String jubaoren){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		
		if(pinglunneirong==null||pinglunneirong.equals("")){pmap.put("pinglunneirong", null);}else{pmap.put("pinglunneirong", pinglunneirong);}		if(pinglunren==null||pinglunren.equals("")){pmap.put("pinglunren", null);}else{pmap.put("pinglunren", pinglunren);}		if(jubaoneirong==null||jubaoneirong.equals("")){pmap.put("jubaoneirong", null);}else{pmap.put("jubaoneirong", jubaoneirong);}		if(jubaoren==null||jubaoren.equals("")){pmap.put("jubaoren", null);}else{pmap.put("jubaoren", jubaoren);}		
		int total=jubaoService.getCount(pmap);
		pageBean.setTotal(total);
		List<Jubao> list=jubaoService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "jubaolist";
	}
	
	@RequestMapping("deleteJubao.do")
	public String deleteJubao(int id,HttpServletRequest request){
		jubaoService.delete(id);
		String url = request.getHeader("Referer");
		return "redirect:"+url;
		//return "redirect:jubaoList.do";
	}
	
	
}
