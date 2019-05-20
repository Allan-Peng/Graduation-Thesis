package com.server.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.ZuozhexinxiMapper;
import com.entity.Zuozhexinxi;
import com.server.ZuozhexinxiServer;
@Service
public class ZuozhexinxiServerImpi implements ZuozhexinxiServer {
   @Resource
   private ZuozhexinxiMapper gdao;
	@Override
	public int add(Zuozhexinxi po) {
		return gdao.insert(po);
	}

	@Override
	public int update(Zuozhexinxi po) {
		return gdao.updateByPrimaryKeySelective(po);
	}

	
	
	@Override
	public int delete(int id) {
		return gdao.deleteByPrimaryKey(id);
	}

	@Override
	public List<Zuozhexinxi> getAll(Map<String, Object> map) {
		return gdao.getAll(map);
	}
	
	public List<Zuozhexinxi> getsyzuozhexinxi1(Map<String, Object> map) {
		return gdao.getsyzuozhexinxi1(map);
	}
	public List<Zuozhexinxi> getsyzuozhexinxi2(Map<String, Object> map) {
		return gdao.getsyzuozhexinxi2(map);
	}
	public List<Zuozhexinxi> getsyzuozhexinxi3(Map<String, Object> map) {
		return gdao.getsyzuozhexinxi3(map);
	}
	
	@Override
	public Zuozhexinxi quchongZuozhexinxi(Map<String, Object> account) {
		return gdao.quchongZuozhexinxi(account);
	}

	@Override
	public List<Zuozhexinxi> getByPage(Map<String, Object> map) {
		return gdao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return gdao.getCount(map);
	}

	@Override
	public List<Zuozhexinxi> select(Map<String, Object> map) {
		return gdao.select(map);
	}

	@Override
	public Zuozhexinxi getById(int id) {
		return gdao.selectByPrimaryKey(id);
	}

}

