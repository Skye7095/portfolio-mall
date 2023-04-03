package com.portfolio.mall.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.portfolio.mall.common.FileManagerService;

@Configuration
public class WebMVCConfig implements WebMvcConfigurer{
		
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/product/**")
		.addResourceLocations("file:///" + FileManagerService.FILE_UPLOAD_PATH + "/");
	}
	

}
