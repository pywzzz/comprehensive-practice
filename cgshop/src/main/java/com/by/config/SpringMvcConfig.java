package com.by.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration //声明为一个配置类
public class SpringMvcConfig implements WebMvcConfigurer {


    /**
     * @Bean向容器中注入一个bean  bean的名称就是方法名multipartResolver (这里只能是这个)
     * @return
     */
    @Bean
    public MultipartResolver multipartResolver(){
        return new StandardServletMultipartResolver();
    }


}
