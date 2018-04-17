package org.climate.web.front.config;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
public class ViewResolverConfig {
	
	@Value("${climate.core.spring.view.prefix:/WEB-INF/views/}")
	private String prefix;
	
	@Value("${climate.core.spring.view.suffix:.jsp}")
	private String suffix;
	
	@Value("${climate.core.spring.view.charset:UTF-8}")
	private String charset;
	
	@Bean
	public InternalResourceViewResolver viewResolver() {  
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();  
		resolver.setPrefix(prefix);  
		resolver.setSuffix(suffix);
		resolver.setContentType( "text/html; cherset=" + charset);
		return resolver;  
	}
} 