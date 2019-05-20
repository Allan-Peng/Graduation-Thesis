package com.music.utils;

import java.util.UUID;


public class BusinessUtils {
	
	/**
	 * 生成32位机器id，唯一
	 * @return string
	 */
	public static String getUUID32() {
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	/**
	 * 生成位机器id，唯一
	 * @return string
	 */
	public static String getUUID() {
		return UUID.randomUUID().toString();
	}

}
