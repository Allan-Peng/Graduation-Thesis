package com.music.utils;



import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class DateUtil {

	public static final String FORMAT_YYYY_MM_DD_HH_MM_SS = "yyyy-MM-dd HH:mm:ss";
	public static final String FORMAT_YYYY_MM_DD = "yyyy-MM-dd";
	public static final String FORMAT_YYYYMMDD = "yyyyMMdd";
	public static final String FORMAT_YYYYMMDDHHMMSSSSS = "yyyyMMddhhmmssSSS";
	public static final String FORMAT_YYYYMMDDHHMMSS = "yyyyMMddhhmmss";

	public static String getCurrentDate() {
		String formatPattern_Short = "yyyyMMddhhmmss";
		SimpleDateFormat format = new SimpleDateFormat(formatPattern_Short);
		return format.format(new Date());
	}

	public static String getSeqString() {
		SimpleDateFormat fm = new SimpleDateFormat("yyyyMMddHHmmss"); // "yyyyMMdd G
		return fm.format(new Date());
	}

	public static Timestamp getCurrentTimestamp() {
		return new Timestamp(System.currentTimeMillis());
	}



	public static String date2Str(Date date) {
		return date2Str(date, FORMAT_YYYY_MM_DD_HH_MM_SS);
	}

	/**
	 * 时间转换成 Date 类型
	 *
	 * @param date
	 * @param format
	 * @return
	 */
	public static String date2Str(Date date, String format) {
		if ((format == null) || format.equals("")) {
			format = FORMAT_YYYY_MM_DD_HH_MM_SS;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		if (date != null) {
			return sdf.format(date);
		}
		return "";
	}

	/**
	 * 获取批量付款预约时间
	 * @return
	 */
	public static String getRevTime() {
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, 1);
		String dateString = new SimpleDateFormat(DateUtil.FORMAT_YYYYMMDDHHMMSS).format(cal.getTime());
		System.out.println(dateString);
		return dateString;
	}

	/**
	 * 时间比较
	 * @param date1
	 * @param date2
	 * @return DATE1>DATE2返回1，DATE1<DATE2返回-1,等于返回0
	 */
	public static int compareDate(String date1, String date2, String format) {
		DateFormat df = new SimpleDateFormat(format);
		try {
			Date dt1 = df.parse(date1);
			Date dt2 = df.parse(date2);
			if (dt1.getTime() > dt2.getTime()) {
				return 1;
			} else if (dt1.getTime() < dt2.getTime()) {
				return -1;
			} else {
				return 0;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return 0;
	}

	/**
	 * 把给定的时间减掉给定的分钟数
	 * @param date
	 * @param minute
	 * @return
	 */
	public static Date minusDateByMinute(Date date, int minute) {
		Date newDate = new Date(date.getTime() - (minute * 60 * 1000));
		return newDate;
	}
	public static Date timeAddMinute(Date date, int minute) {
		Date newDate = new Date(date.getTime() + (minute * 60 * 1000));
		return newDate;
	}


	public static String getDatePoor( Date createDate) {

		Date endDate=getFetureDateTime(createDate,6);
		Date nowDate=new Date();

		long nd = 1000 * 24 * 60 * 60;
		long nh = 1000 * 60 * 60;
		long nm = 1000 * 60;
		// long ns = 1000;
		// 获得两个时间的毫秒时间差异
		long diff = endDate.getTime() - nowDate.getTime();
		// 计算差多少天
		long day = diff / nd;
		// 计算差多少小时
		long hour = diff % nd / nh;
		// 计算差多少分钟
		long min = diff % nd % nh / nm;
		// 计算差多少秒//输出结果
		// long sec = diff % nd % nh % nm / ns;
		return "还剩"+day + "天" + hour + "时" + min + "分";
	}



	/**
	 * 获取过去第几天的日期
	 *
	 * @param past
	 * @return
	 */
	public static String getPastDate(int past,String f) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - past);
		Date today = calendar.getTime();
		SimpleDateFormat format = new SimpleDateFormat(f);
		String result = format.format(today);
		return result;
	}
	
	/**
	 * 获取过去第几天的日期
	 *
	 * @param past
	 * @return
	 */
	public static String getPastMonth(int past,String f) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) - past);
		Date today = calendar.getTime();
		SimpleDateFormat format = new SimpleDateFormat(f);
		String result = format.format(today);
		return result;
	}

	/**
	 * 获取未来 第 past 天的日期
	 * @param past
	 * @return
	 */
	public static String getFetureDate(Date date,int past) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) + past);
		Date today = calendar.getTime();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String result = format.format(today);
		return result;
	}

	public static Date getFetureDateTime(Date date,int past) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) + past);
		Date today = calendar.getTime();
		return today;
	}

	public static Timestamp getCurrentTime() {
		return new Timestamp(new Date().getTime());
	}



	/**
	 * 日期转换成字符串
	 * @param date
	 * @return str
	 */
	public static String DateToStr(Date date) {

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str = format.format(date);
		return str;
	}
	
	/**
	 * 日期转换成字符串
	 * @param date
	 * @return str
	 */
	public static String DateToStr(Date date,String f) {
		SimpleDateFormat format = new SimpleDateFormat(f);
		String str = format.format(date);
		return str;
	}

	/**
	 * 字符串转换成日期
	 * @param str
	 * @return date
	 */
	public static Date StrToDate(String str,String f) {

		SimpleDateFormat format = new SimpleDateFormat(f);
		Date date = null;
		try {
			date = format.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	public static void main(String[] args) {
		Timestamp apply_time = new Timestamp(new Date().getTime());
		System.out.println( apply_time);
		System.out.println( getCurrentTime());
		System.out.println( StrToDate("2017-07-09",FORMAT_YYYY_MM_DD));
	}
	
	/**
	 * 字符串时间调整月份
	 * @param str
	 * @return date
	 */
	public static String StrAddMonth(String str,int addMonth,String f) {
		SimpleDateFormat format = new SimpleDateFormat(f);
		String r = null;
		try {
			Date date = format.parse(str);
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			calendar.add(Calendar.MONTH, +addMonth);  
			Date rTime = calendar.getTime();
			r = DateToStr(rTime,f);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return r;
	}
	
	/**
	 * 字符串时间调整月份
	 * @param str
	 * @return date
	 */
	public static String StrAddDate(String str,int addDate,String f) {
		SimpleDateFormat format = new SimpleDateFormat(f);
		String r = null;
		try {
			Date date = format.parse(str);
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			calendar.add(Calendar.DAY_OF_MONTH, +addDate);  
			Date rTime = calendar.getTime();
			r = DateToStr(rTime,f);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return r;
	}
	
	
	/**
	 * 字符串时间调整月份
	 * @param str
	 * @return date
	 */
	public static String addYear(String str,int addYear,String f) {

		SimpleDateFormat format = new SimpleDateFormat(f);
		String r = null;
		try {
			Date date = format.parse(str);
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			calendar.add(Calendar.YEAR, addYear);  
			Date rTime = calendar.getTime();
			r = DateToStr(rTime,f);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return r;
	}
	
	
	/**
	 * 时间调整月份
	 * @param str
	 * @return date
	 */
	public static Date DateAddMonth(Date date,int addMonth) {
		Date r = null;
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MONTH, addMonth);  
		r = calendar.getTime();
		return r;
	}
	
	
	/**
	 * 获取当前月份
	 * @param str
	 * @return date
	 */
	public static int getMonth(String str,String f) {

		SimpleDateFormat format = new SimpleDateFormat(f);
		int m = -1;
		try {
			Date date = format.parse(str);
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			m = calendar.get(Calendar.MONTH)+1;
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return m;
	}

	/**
	 * 字符串时间指定月份
	 * @param str
	 * @return date
	 */
	public static String thisMonth(String str,int month,String f) {

		SimpleDateFormat format = new SimpleDateFormat(f);
		String r = null;
		try {
			Date date = format.parse(str);
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			calendar.set(Calendar.MONTH,month-1);
			Date rTime = calendar.getTime();
			r = DateToStr(rTime,f);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return r;
	}
	
	/**
	 * 包含开始结束日期
	 * @param beginDate
	 * @param endDate
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<String> getDateBetween(String beginDateStr, String endDateStr,String f) {  
		SimpleDateFormat format = new SimpleDateFormat(f);
		Date beginDate;
		try {
			@SuppressWarnings("rawtypes")
			List lDate = new ArrayList();
			beginDate = format.parse(beginDateStr);
		
			Date endDate = format.parse(endDateStr);
		
			if(beginDate.getTime() == endDate.getTime()){
				lDate.add(beginDateStr);
	            return lDate;
	        }  
			  
	        lDate.add(beginDateStr);//把开始时间加入集合  
	        Calendar cal = Calendar.getInstance();  
	        //使用给定的 Date 设置此 Calendar 的时间  
	        cal.setTime(beginDate);  
	        boolean bContinue = true;  
	        while (bContinue) {  
	            //根据日历的规则，为给定的日历字段添加或减去指定的时间量  
	            cal.add(Calendar.DAY_OF_MONTH, 1);  
	            // 测试此日期是否在指定日期之后  
	            if (endDate.after(cal.getTime())) { 
	                lDate.add(DateToStr(cal.getTime(),f));  
	            } else {  
	                break;  
	            }  
	        } 
	        lDate.add(endDateStr);//把结束时间加入集合  
	        return lDate; 
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null; 
		}  
    } 

}
