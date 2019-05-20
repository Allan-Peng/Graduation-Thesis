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

import com.entity.Zuozhexinxi;
import com.server.ZuozhexinxiServer;
import com.util.PageBean;
import net.sf.json.JSONObject;
import com.util.db;
import java.sql.SQLException;
import java.sql.*;
@Controller
public class ZuozhexinxiController {
	@Resource
	private ZuozhexinxiServer zuozhexinxiService;


   
	@RequestMapping("addZuozhexinxi.do")
	public String addZuozhexinxi(HttpServletRequest request,Zuozhexinxi zuozhexinxi,HttpSession session) throws SQLException{
		Timestamp time=new Timestamp(System.currentTimeMillis());
		
		zuozhexinxi.setAddtime(time.toString().substring(0, 19));
		zuozhexinxiService.add(zuozhexinxi);
		session.setAttribute("backxx", "添加成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		
		//session.setAttribute("backurl", "zuozhexinxiList.do");
		
		return "redirect:postback.jsp";
		//return "redirect:zuozhexinxiList.do";
		
		
		
	}
 
//	处理编辑
	@RequestMapping("doUpdateZuozhexinxi.do")
	public String doUpdateZuozhexinxi(int id,ModelMap map,Zuozhexinxi zuozhexinxi){
		zuozhexinxi=zuozhexinxiService.getById(id);
		map.put("zuozhexinxi", zuozhexinxi);
		return "zuozhexinxi_updt";
	}
	
	@RequestMapping("doUpdateZuozhexinxi2.do")
	public String doUpdateZuozhexinxi2(ModelMap map,Zuozhexinxi zuozhexinxi,HttpServletRequest request){
		zuozhexinxi=zuozhexinxiService.getById(Integer.parseInt((String)request.getSession().getAttribute("uid")));
		map.put("zuozhexinxi", zuozhexinxi);
		return "zuozhexinxi_updt2";
	}
	
@RequestMapping("updateZuozhexinxi2.do")
	public String updateZuozhexinxi2(int id,ModelMap map,Zuozhexinxi zuozhexinxi){
		zuozhexinxiService.update(zuozhexinxi);
		return "redirect:doUpdateZuozhexinxi2.do";
	}
	
	
	
//	后台详细
	@RequestMapping("zuozhexinxiDetail.do")
	public String zuozhexinxiDetail(int id,ModelMap map,Zuozhexinxi zuozhexinxi){
		zuozhexinxi=zuozhexinxiService.getById(id);
		map.put("zuozhexinxi", zuozhexinxi);
		return "zuozhexinxi_detail";
	}
//	前台详细
	@RequestMapping("zzxxDetail.do")
	public String zzxxDetail(int id,ModelMap map,Zuozhexinxi zuozhexinxi){
		zuozhexinxi=zuozhexinxiService.getById(id);
		map.put("zuozhexinxi", zuozhexinxi);
		return "zuozhexinxidetail";
	}
//	
	@RequestMapping("updateZuozhexinxi.do")
	public String updateZuozhexinxi(int id,ModelMap map,Zuozhexinxi zuozhexinxi,HttpServletRequest request,HttpSession session){
		zuozhexinxiService.update(zuozhexinxi);
		session.setAttribute("backxx", "修改成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		return "redirect:postback.jsp";
		//String url = request.getHeader("Referer");
		//return "redirect:"+url;
		//return "redirect:zuozhexinxiList.do";
	}

//	分页查询
	@RequestMapping("zuozhexinxiList.do")
	public String zuozhexinxiList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Zuozhexinxi zuozhexinxi, String zhanghao, String mima, String xingming, String xingbie, String nianling1,String nianling2, String shouji, String shenfenzheng, String jianjie, String issh){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		
		if(zhanghao==null||zhanghao.equals("")){pmap.put("zhanghao", null);}else{pmap.put("zhanghao", zhanghao);}		if(mima==null||mima.equals("")){pmap.put("mima", null);}else{pmap.put("mima", mima);}		if(xingming==null||xingming.equals("")){pmap.put("xingming", null);}else{pmap.put("xingming", xingming);}		if(xingbie==null||xingbie.equals("")){pmap.put("xingbie", null);}else{pmap.put("xingbie", xingbie);}		if(nianling1==null||nianling1.equals("")){pmap.put("nianling1", null);}else{pmap.put("nianling1", nianling1);}		if(nianling2==null||nianling2.equals("")){pmap.put("nianling2", null);}else{pmap.put("nianling2", nianling2);}		if(shouji==null||shouji.equals("")){pmap.put("shouji", null);}else{pmap.put("shouji", shouji);}		if(shenfenzheng==null||shenfenzheng.equals("")){pmap.put("shenfenzheng", null);}else{pmap.put("shenfenzheng", shenfenzheng);}		if(jianjie==null||jianjie.equals("")){pmap.put("jianjie", null);}else{pmap.put("jianjie", jianjie);}		
		int total=zuozhexinxiService.getCount(pmap);
		pageBean.setTotal(total);
		List<Zuozhexinxi> list=zuozhexinxiService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "zuozhexinxi_list";
	}
	
	
	
	@RequestMapping("zzxxList.do")
	public String zzxxList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Zuozhexinxi zuozhexinxi, String zhanghao, String mima, String xingming, String xingbie, String nianling1,String nianling2, String shouji, String shenfenzheng, String jianjie, String issh){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		
		if(zhanghao==null||zhanghao.equals("")){pmap.put("zhanghao", null);}else{pmap.put("zhanghao", zhanghao);}		if(mima==null||mima.equals("")){pmap.put("mima", null);}else{pmap.put("mima", mima);}		if(xingming==null||xingming.equals("")){pmap.put("xingming", null);}else{pmap.put("xingming", xingming);}		if(xingbie==null||xingbie.equals("")){pmap.put("xingbie", null);}else{pmap.put("xingbie", xingbie);}		if(nianling1==null||nianling1.equals("")){pmap.put("nianling1", null);}else{pmap.put("nianling1", nianling1);}		if(nianling2==null||nianling2.equals("")){pmap.put("nianling2", null);}else{pmap.put("nianling2", nianling2);}		if(shouji==null||shouji.equals("")){pmap.put("shouji", null);}else{pmap.put("shouji", shouji);}		if(shenfenzheng==null||shenfenzheng.equals("")){pmap.put("shenfenzheng", null);}else{pmap.put("shenfenzheng", shenfenzheng);}		if(jianjie==null||jianjie.equals("")){pmap.put("jianjie", null);}else{pmap.put("jianjie", jianjie);}		
		int total=zuozhexinxiService.getCount(pmap);
		pageBean.setTotal(total);
		List<Zuozhexinxi> list=zuozhexinxiService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "zuozhexinxilist";
	}
	
	@RequestMapping("deleteZuozhexinxi.do")
	public String deleteZuozhexinxi(int id,HttpServletRequest request){
		zuozhexinxiService.delete(id);
		String url = request.getHeader("Referer");
		return "redirect:"+url;
		//return "redirect:zuozhexinxiList.do";
	}
	
	@RequestMapping("quchongZuozhexinxi.do")
	public void quchongZuozhexinxi(Zuozhexinxi zuozhexinxi,HttpServletResponse response){
		   Map<String,Object> map=new HashMap<String,Object>();
		   map.put("zhanghao", zuozhexinxi.getZhanghao());
		   System.out.println("zhanghao==="+zuozhexinxi.getZhanghao());
		   System.out.println("zhanghao222==="+zuozhexinxiService.quchongZuozhexinxi(map));
		   JSONObject obj=new JSONObject();
		   if(zuozhexinxiService.quchongZuozhexinxi(map)!=null){
				 obj.put("info", "ng");
			   }else{
				   obj.put("info", "账号可以用！");
				  
			   }
		   response.setContentType("text/html;charset=utf-8");
		   PrintWriter out=null;
		   try {
			out=response.getWriter();
			out.print(obj);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			out.close();
		}
	}
}
