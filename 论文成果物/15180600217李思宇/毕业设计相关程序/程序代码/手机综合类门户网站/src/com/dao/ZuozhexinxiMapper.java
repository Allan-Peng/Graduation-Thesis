package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Zuozhexinxi;

public interface ZuozhexinxiMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Zuozhexinxi record);

    int insertSelective(Zuozhexinxi record);

    Zuozhexinxi selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Zuozhexinxi record);
	
    int updateByPrimaryKey(Zuozhexinxi record);
	public Zuozhexinxi quchongZuozhexinxi(Map<String, Object> zhanghao);
	public List<Zuozhexinxi> getAll(Map<String, Object> map);
	public List<Zuozhexinxi> getsyzuozhexinxi1(Map<String, Object> map);
	public List<Zuozhexinxi> getsyzuozhexinxi3(Map<String, Object> map);
	public List<Zuozhexinxi> getsyzuozhexinxi2(Map<String, Object> map);
	public int getCount(Map<String, Object> po);
	public List<Zuozhexinxi> getByPage(Map<String, Object> map);
	public List<Zuozhexinxi> select(Map<String, Object> map);
//	所有List
}

