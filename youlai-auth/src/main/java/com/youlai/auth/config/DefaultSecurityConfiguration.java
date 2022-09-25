package com.youlai.auth.config;

import com.youlai.auth.ext.captcha.CaptchaAuthenticationConfigurer;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import static org.springframework.security.config.Customizer.withDefaults;

@Configuration
@EnableWebSecurity(debug = true)
@RequiredArgsConstructor
public class DefaultSecurityConfiguration {

    private final UserDetailsService sysUserDetailService;

    private final PasswordEncoder passwordEncoder;


    @Bean
    SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http) throws Exception {
        http
                .authorizeRequests(authorizeRequests ->
                        authorizeRequests.anyRequest().authenticated()
                )
                .formLogin(withDefaults())
                .csrf().disable()
                .apply(new CaptchaAuthenticationConfigurer(sysUserDetailService,passwordEncoder))
        ;
        return http.build();
    }


}
