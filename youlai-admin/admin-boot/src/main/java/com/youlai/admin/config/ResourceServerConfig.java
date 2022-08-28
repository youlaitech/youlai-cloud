package com.youlai.admin.config;

import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@EnableWebSecurity
public class ResourceServerConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception{
        http.authorizeRequests(request->request
                .antMatchers(HttpMethod.GET,"/messages/**").hasAuthority("SCOPE_message.read")
                .anyRequest().authenticated()
        );
        http.oauth2ResourceServer().jwt();
        return http.build();
    }

}
