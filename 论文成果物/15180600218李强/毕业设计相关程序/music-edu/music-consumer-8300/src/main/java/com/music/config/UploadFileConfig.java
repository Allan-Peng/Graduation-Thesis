package com.music.config;

import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.servlet.MultipartConfigElement;

@Configuration
public class UploadFileConfig {
	
	/*@Value("${file.uploadFolder}")
    private String uploadFolder;*/

/*    @Bean
    MultipartConfigElement multipartConfigElement() {
        MultipartConfigFactory factory = new MultipartConfigFactory();
        factory.setLocation(uploadFolder);
        //文件最大
//        factory.setMaxFileSize("20");
        // 设置总上传数据总大小
//        factory.setMaxRequestSize("10MB");
        return factory.createMultipartConfig();
    }*/
    /**
     * 文件上传配置
     *
     * @return
     */
    @Bean
    public MultipartConfigElement multipartConfigElement() {
        MultipartConfigFactory factory = new MultipartConfigFactory();
        //  单个数据大小
        factory.setMaxFileSize("2048MB"); // KB,MB
        /// 总上传数据大小
        factory.setMaxRequestSize("4096MB");
        return factory.createMultipartConfig();
    }

}
