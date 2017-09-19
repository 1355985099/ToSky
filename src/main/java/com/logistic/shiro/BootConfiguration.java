package com.logistic.shiro;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
@ImportResource(locations = "classpath:shiro/spring-shiro.xml")
public class BootConfiguration extends WebMvcConfigurerAdapter{
}
