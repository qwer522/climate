package org.climate.web.front.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@EnableWebMvc
@Configuration
public class MultipartResolverConfig {
	@Bean(name="multipartResolver")
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver=new CommonsMultipartResolver();
		//resolver.setMaxUploadSize(maxUploadSizeInMb * 2);
		//resolver.setMaxUploadSizePerFile(maxUploadSizeInMb);
		resolver.setDefaultEncoding("utf-8");
		return resolver;
	}

}