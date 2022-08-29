package com.youlai.gateway.config;

import com.youlai.gateway.filter.UserInfoRelayGatewayFilterFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.reactive.EnableWebFluxSecurity;
import org.springframework.security.config.web.server.ServerHttpSecurity;
import org.springframework.security.web.server.SecurityWebFilterChain;

import java.net.URISyntaxException;

import static org.springframework.security.config.Customizer.withDefaults;


/**
 *  Security 安全配置
 *
 * @author haoxr
 * @date 2022/8/28
 */
@EnableWebFluxSecurity
@Slf4j
public class SecurityConfig {
    @Bean
    public SecurityWebFilterChain springSecurityFilterChain(ServerHttpSecurity http) throws URISyntaxException {
        http.authorizeExchange(authorizeExchangeSpec -> authorizeExchangeSpec
                        .pathMatchers("/login", "/logout")
                        .permitAll()
                        .anyExchange()
                        .authenticated())
                .oauth2Login(withDefaults());
        http.csrf().disable();
        return http.build();
    }


}