package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Jubao;

public interface JubaoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Jubao record);

    int insertSelective(Jubao record);

    Jubao selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Jubao record);
	
    int updateByPrimaryKey(Jubao record);
	public Jubao quchongJubao(Map<String, Object> jubaoren);
	public List<Jubao> getAll(Map<String, Object> map);
	public List<Jubao> getsyjubao1(Map<String, Object> map);
	public List<Jubao> getsyjubao3(Map<String, Object> map);
	public List<Jubao> getsyjubao2(Map<String, Object> map);
	public int getCount(Map<String, Object> po);
	public List<Jubao> getByPage(Map<String, Object> map);
	public List<Jubao> select(Map<String, Object> map);
//	所有List
}

