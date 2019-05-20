package com.music.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PriceCalculator {

	/**
	 * @param serviceType 服务类型
	 * @param area	房屋面积
	 * @param floor  楼层
	 * @return 未折扣前价格
	 */
	public static String getPrice(String priceId,String price_quotation, double area, int floor) {
		double price = 0;
		int price_id = Integer.parseInt(priceId);
		double price_q = getNum(price_quotation);
		
		switch (price_id) {
		case 100860101:		//日常保洁-非出租房
			price = price_q*area;	
			break;
		case 100860102:	   //日常保洁-出租房
			price = price_q*area;	
			break;
		case 100860201:		//深度保洁
			price = price_q*area;	
			break;
		case 100860301:		//开荒保洁
			price = price_q*area;	
			break;
		case 100860401:		//擦玻璃10楼以下(用户选择)，实际计算还是需要判断地址中的楼层来算
			price = price_q*area;
			if (floor > 30) {	//30楼以上加100
				price += 100;		
			}
			else if (floor > 10) {	//10楼以下30楼以上加50
				price += 50;
			}
			else {			//10楼以下不加价
				price += 0;
			}
			break;
		case 100860402:		//擦玻璃10楼以上，30楼以下(用户选择)，实际计算还是需要判断地址中的楼层来算
			price = price_q*area;
			if (floor > 30) {	//30楼以上加100
				price += 100;		
			}
			else if (floor > 10) {	//10楼以下30楼以上加50
				price += 50;
			}
			else {			//10楼以下不加价
				price += 0;
			}
			break;
		case 100860403:		//30楼以上(用户选择)，实际计算还是需要判断地址中的楼层来算
			price = price_q*area;
			if (floor > 30) {	//30楼以上加100
				price += 100;		
			}
			else if (floor > 10) {	//10楼以下30楼以上加50
				price += 50;
			}
			else {			//10楼以下不加价
				price += 0;
			}
			break;
		case 100860501:		//可卸老式、欧式油烟机
			price = 150;	
			break;
		case 100860502:		//可卸侧吸双面机油烟机
			price = 150;	
			break;
		case 100860503:		//不可卸油烟机
			price = 200;	
			break;
		case 100860701:		//单开门冰箱
			price = 150;	
			break;
		case 100860702:		//双开门冰箱
			price = 200;	
			break;
		case 100860801:		//立式空调
			price = 200;
			break;
		case 100860802:		//室内挂机
			price = 150;
			break;
		case 100860803:		//室外挂机
			price = 200;
		case 100860901:		//涡轮全拆洗衣机
			price = 500;
			break;
		case 100860902:		//滚筒不拆洗衣机
			price = 200;
			break;
		case 100861001:		//甲醛治理
			price = price_q*area;	
			break;
		case 100860605: 	//地热
			price = price_q*area;	
			break;
		default:
			return price_quotation;
		}
		return Double.toString(price);
	}
	
	private static double getNum(String price_q) {
		String regEx="[^0-9]";   
		Pattern p = Pattern.compile(regEx);      
		Matcher m = p.matcher(price_q);
		Double price_num = Double.parseDouble(m.replaceAll("").trim());
		return price_num;
	}
}
