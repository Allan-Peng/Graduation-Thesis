package com.server.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.JubaoMapper;
import com.entity.Jubao;
import com.server.JubaoServer;
@Service
public class JubaoServerImpi implements JubaoServer {
   @Resource
   private JubaoMapper gdao;
	@Override
	public int add(Jubao po) {
		return gdao.insert(po);
	}

	@Override
	public int update(Jubao po) {
		return gdao.updateByPrimaryKeySelective(po);
	}

	
	
	@Override
	public int delete(int id) {
		return gdao.deleteByPrimaryKey(id);
	}

	@Override
	public List<Jubao> getAll(Map<String, Object> map) {
		return gdao.getAll(map);
	}
	
	public List<Jubao> getsyjubao1(Map<String, Object> map) {
		return gdao.getsyjubao1(map);
	}
	public List<Jubao> getsyjubao2(Map<String, Object> map) {
		return gdao.getsyjubao2(map);
	}
	public List<Jubao> getsyjubao3(Map<String, Object> map) {
		return gdao.getsyjubao3(map);
	}
	
	@Override
	public Jubao quchongJubao(Map<String, Object> account) {
		return gdao.quchongJubao(account);
	}

	@Override
	public List<Jubao> getByPage(Map<String, Object> map) {
		return gdao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return gdao.getCount(map);
	}

	@Override
	public List<Jubao> select(Map<String, Object> map) {
		return gdao.select(map);
	}

	@Override
	public Jubao getById(int id) {
		return gdao.selectByPrimaryKey(id);
	}

}

