package com.server;

import java.util.List;

import java.util.Map;

import com.entity.Jubao;

public interface JubaoServer {

  public int add(Jubao po);

  public int update(Jubao po);
  
  
  
  public int delete(int id);

  public List<Jubao> getAll(Map<String,Object> map);
  public List<Jubao> getsyjubao1(Map<String,Object> map);
  public List<Jubao> getsyjubao2(Map<String,Object> map);
  public List<Jubao> getsyjubao3(Map<String,Object> map);
  public Jubao quchongJubao(Map<String, Object> acount);

  public Jubao getById( int id);

  public List<Jubao> getByPage(Map<String, Object> map);

  public int getCount(Map<String,Object> map);

  public List<Jubao> select(Map<String, Object> map);
}
//	所有List
