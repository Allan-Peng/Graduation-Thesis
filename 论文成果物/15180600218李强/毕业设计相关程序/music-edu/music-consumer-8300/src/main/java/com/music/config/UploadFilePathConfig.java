package com.music.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class UploadFilePathConfig extends WebMvcConfigurerAdapter {

	  @Value("${file.staticAccessPath}")
	  private String staticAccessPath;//
	  
	  @Value("${file.uploadFolder}")
	  private String uploadFolder; //
	  


	  @Override
	  public void addResourceHandlers(ResourceHandlerRegistry registry) {
	  	//用户访问该路径会被自动转到d:/PoliceChangPing/uploadFolder/下查找资源文件
		  registry.addResourceHandler(staticAccessPath).addResourceLocations("file:" + uploadFolder);
		//用户访问该路径会被自动转到d:/PoliceChangPing/uploadFolderColumn/下查找资源文件
		  //windows下会自动创建于workspace所在的盘符下
	  }

}
