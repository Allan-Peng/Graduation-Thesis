package com.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.Xinwentongzhi;
import com.entity.guanjianzi;
//import com.chengxusheji.po.News;
import com.server.XinwentongzhiServer;
import com.server.guanjianziServer;
import com.util.PageBean;

@Controller
public class XinwentongzhiController {
	@Resource
	private XinwentongzhiServer xinwentongzhiService;

	@Resource
	private guanjianziServer guanjianziService;
//	
   @RequestMapping("showXinwentongzhi.do")
   public String showXinwentongzhi(int id,ModelMap map,HttpSession session){
	 /*  Map<String,Object> bmap=new HashMap<String,Object>();
	   bmap.put("uid", id);*/
	  // map.put("blist", xinwentongzhiService.getAll(bmap));
	   map.put("xinwentongzhi", xinwentongzhiService.getById(id));
	   return "read";
   }
   
	@RequestMapping("addXinwentongzhi.do")
	public String addXinwentongzhi(HttpServletRequest request,Xinwentongzhi xinwentongzhi,HttpSession session){
		Timestamp time=new Timestamp(System.currentTimeMillis());
		//Users u=(Users)session.getAttribute("user");
		/*if(u==null||u.equals("")){
			return "redirect:showIndex.do";
		}else{*/
			List<guanjianzi> guanjianzis=guanjianziService.findAllGuanjianzi();
			for(guanjianzi a : guanjianzis)
			{
				System.out.println(a.toString());
			
			String userText=xinwentongzhi.getNeirong();
			 if (userText.indexOf(a.getText())!=-1){
				System.out.println("存在敏感字段");  
				session.setAttribute("backxx", "存在敏感字段，请重新编辑");
				session.setAttribute("backurl", "xinwentongzhiList.do?lb="+request.getParameter("leibie"));
				return "redirect:postback.jsp";									
			 }
			}
		    xinwentongzhi.setAddtime(time.toString().substring(0, 19));
			xinwentongzhiService.add(xinwentongzhi);
			session.setAttribute("backxx", "添加成功");
			session.setAttribute("backurl", "xinwentongzhiList.do?lb="+request.getParameter("leibie"));
			return "redirect:postback.jsp";
		/*}*/
		
		
	}

//	处理编辑
	@RequestMapping("doUpdateXinwentongzhi.do")
	public String doUpdateXinwentongzhi(int id,ModelMap map,Xinwentongzhi xinwentongzhi){
		xinwentongzhi=xinwentongzhiService.getById(id);
		map.put("xinwentongzhi", xinwentongzhi);
		return "xinwentongzhi_updt";
	}
	
	//	后台详细
	@RequestMapping("XinwentongzhiDetail.do")
	public String XinwentongzhiDetail(int id,ModelMap map,Xinwentongzhi xinwentongzhi){
		xinwentongzhi=xinwentongzhiService.getById(id);
		map.put("xinwentongzhi", xinwentongzhi);
		return "xinwentongzhi_detail";
	}
//	前台详细
	@RequestMapping("xwtzDetail.do")
	public String xwtzDetail(int id,ModelMap map,Xinwentongzhi xinwentongzhi){
		xinwentongzhi=xinwentongzhiService.getById(id);
		map.put("xinwentongzhi", xinwentongzhi);
		return "gg_detail";
	}
	
//	
	@RequestMapping("updateXinwentongzhi.do")
	public String updateXinwentongzhi(int id,ModelMap map,Xinwentongzhi xinwentongzhi){
		xinwentongzhiService.update(xinwentongzhi);
		return "redirect:xinwentongzhiList.do";
	}
//	所有List
//	@RequestMapping("xinwentongzhiList.do")
//	public String xinwentongzhiList(ModelMap map,HttpSession session){
//		map.put("list", xinwentongzhiService.getAll(null));
//		map.put("clist", xinwentongzhiService.getAll(null));
//		return "xinwentongzhi";
//	}
//	分页查询
	@RequestMapping("xinwentongzhiList.do")
	public String xinwentongzhiList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Xinwentongzhi xinwentongzhi, String biaoti, String leibie, String neirong, String shouyetupian, String dianjilv, String tianjiaren,String lb){
		/*if(session.getAttribute("user")==null){
			return "login";
		}*/
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 5);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 20);
	
		if(biaoti==null||biaoti.equals("")){pmap.put("biaoti", null);}else{pmap.put("biaoti", biaoti);}
		if(leibie==null||leibie.equals("")){pmap.put("leibie", null);}else{pmap.put("leibie", leibie);}
		if(lb==null||lb.equals("")){pmap.put("lb", null);}else{pmap.put("lb", lb);}
		if(neirong==null||neirong.equals("")){pmap.put("neirong", null);}else{pmap.put("neirong", neirong);}
		if(shouyetupian==null||shouyetupian.equals("")){pmap.put("shouyetupian", null);}else{pmap.put("shouyetupian", shouyetupian);}
		if(dianjilv==null||dianjilv.equals("")){pmap.put("dianjilv", null);}else{pmap.put("dianjilv", dianjilv);}
		if(tianjiaren==null||tianjiaren.equals("")){pmap.put("tianjiaren", null);}else{pmap.put("tianjiaren", tianjiaren);}
		
		int total=xinwentongzhiService.getCount(pmap);
		pageBean.setTotal(total);
		List<Xinwentongzhi> list=xinwentongzhiService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "xinwentongzhi_list";
	}
	
	@RequestMapping("xinwentongzhiList2.do")
	public String xinwentongzhiList2(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Xinwentongzhi xinwentongzhi, String biaoti, String leibie, String neirong, String shouyetupian, String dianjilv, String tianjiaren,String lb,HttpServletRequest request){
		/*if(session.getAttribute("user")==null){
			return "login";
		}*/
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 5);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 20);
		
		
		pmap.put("tianjiaren", (String)request.getSession().getAttribute("username"));
		if(biaoti==null||biaoti.equals("")){pmap.put("biaoti", null);}else{pmap.put("biaoti", biaoti);}
		if(leibie==null||leibie.equals("")){pmap.put("leibie", null);}else{pmap.put("leibie", leibie);}
		if(lb==null||lb.equals("")){pmap.put("lb", null);}else{pmap.put("lb", lb);}
		if(neirong==null||neirong.equals("")){pmap.put("neirong", null);}else{pmap.put("neirong", neirong);}
		if(shouyetupian==null||shouyetupian.equals("")){pmap.put("shouyetupian", null);}else{pmap.put("shouyetupian", shouyetupian);}
		if(dianjilv==null||dianjilv.equals("")){pmap.put("dianjilv", null);}else{pmap.put("dianjilv", dianjilv);}
		if(tianjiaren==null||tianjiaren.equals("")){pmap.put("tianjiaren", null);}else{pmap.put("tianjiaren", tianjiaren);}
		
		int total=xinwentongzhiService.getCount(pmap);
		pageBean.setTotal(total);
		List<Xinwentongzhi> list=xinwentongzhiService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "xinwentongzhi_list2";
	}
	
	

	@RequestMapping("xwtzList.do")
	public String xwtzList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Xinwentongzhi xinwentongzhi, String biaoti, String leibie,
			String neirong, String shouyetupian, String dianjilv,
			String tianjiaren,String lb,HttpServletRequest request){
		/*if(session.getAttribute("user")==null){
			return "login";
		}*/
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 20);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 20);
		
	
		pmap.put("tianjiaren", (String)request.getSession().getAttribute("username"));
		if(biaoti==null||biaoti.equals("")){pmap.put("biaoti", null);}else{pmap.put("biaoti", biaoti);}
		if(leibie==null||leibie.equals("")){pmap.put("leibie", null);}else{pmap.put("leibie", leibie);}
		if(lb==null||lb.equals("")){pmap.put("lb", null);}
		else{
			pmap.put("lb", lb);}
		if(neirong==null||neirong.equals("")){pmap.put("neirong", null);}else{pmap.put("neirong", neirong);}
		if(shouyetupian==null||shouyetupian.equals("")){pmap.put("shouyetupian", null);}else{pmap.put("shouyetupian", shouyetupian);}
		if(dianjilv==null||dianjilv.equals("")){pmap.put("dianjilv", null);}else{pmap.put("dianjilv", dianjilv);}
		if(tianjiaren==null||tianjiaren.equals("")){pmap.put("tianjiaren", null);}else{pmap.put("tianjiaren", tianjiaren);}
		
		int total=xinwentongzhiService.getCount(pmap);
		pageBean.setTotal(total);
		List<Xinwentongzhi> list=xinwentongzhiService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		if(lb.equals("评测类文章"))
		{
			map.put("cao",1);
		}
		if(lb.equals("预测类文章"))
		{
			map.put("cao",3);
		}
		if(lb.equals("曝光类文章"))
		{
			map.put("cao",2);
		}
		if(lb.equals("娱乐新闻"))
		{
			map.put("cao",4);
		}
		if(lb.equals("科技新闻"))
		{
			map.put("cao",5);
		}
		if(lb.equals("发布会视频"))
		{
			map.put("cao",6);
		}
		if(lb.equals("后台管理"))
		{
			map.put("cao",7);
		}
		session.setAttribute("p", 1);
		return "news";
	}
	@RequestMapping("deleteXinwentongzhi.do")
	public String deleteXinwentongzhi(int id){
		xinwentongzhiService.delete(id);
		return "redirect:xinwentongzhiList.do";
	}
	
	
}
