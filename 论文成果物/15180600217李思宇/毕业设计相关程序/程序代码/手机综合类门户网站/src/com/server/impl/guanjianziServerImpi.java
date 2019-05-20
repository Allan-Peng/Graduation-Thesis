package com.server.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.JubaoMapper;
import com.dao.guanjianziMapper;
import com.entity.guanjianzi;
import com.server.guanjianziServer;
@Service
public class guanjianziServerImpi implements guanjianziServer {
	 @Resource
	   private guanjianziMapper guanDao;
	@Override
	public List<guanjianzi> findAllGuanjianzi() {
		// TODO Auto-generated method stub
		return guanDao.findAllGuanjianzi();
	}

}
