package com.server;

import java.util.List;

import java.util.Map;

import com.entity.Zuozhexinxi;

public interface ZuozhexinxiServer {

  public int add(Zuozhexinxi po);

  public int update(Zuozhexinxi po);
  
  
  
  public int delete(int id);

  public List<Zuozhexinxi> getAll(Map<String,Object> map);
  public List<Zuozhexinxi> getsyzuozhexinxi1(Map<String,Object> map);
  public List<Zuozhexinxi> getsyzuozhexinxi2(Map<String,Object> map);
  public List<Zuozhexinxi> getsyzuozhexinxi3(Map<String,Object> map);
  public Zuozhexinxi quchongZuozhexinxi(Map<String, Object> acount);

  public Zuozhexinxi getById( int id);

  public List<Zuozhexinxi> getByPage(Map<String, Object> map);

  public int getCount(Map<String,Object> map);

  public List<Zuozhexinxi> select(Map<String, Object> map);
}
//	所有List
