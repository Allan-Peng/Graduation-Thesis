package com.music.service;

import com.music.service.impl.TestClientServiceFallbackFactory;
import com.music.utils.Msg;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * 
 * @Description: 修改microservicecloud-api工程，根据已经有的DeptClientService接口

新建

一个实现了FallbackFactory接口的类DeptClientServiceFallbackFactory
 * @author zzyy
 * @date 2018年4月21日
 */
@FeignClient(value = "music-provider",fallbackFactory= TestClientServiceFallbackFactory.class)
public interface TestClientService {

	@GetMapping(value = "/api/get")
	public Msg get();

}
