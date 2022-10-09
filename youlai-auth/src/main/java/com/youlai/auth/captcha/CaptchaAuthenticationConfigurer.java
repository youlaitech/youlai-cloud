package com.youlai.auth.captcha;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.SecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.DefaultSecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;


/**
 * @see org.springframework.security.config.annotation.authentication.configurers.userdetails.AbstractDaoAuthenticationConfigurer
 */
public class CaptchaAuthenticationConfigurer extends SecurityConfigurerAdapter<DefaultSecurityFilterChain, HttpSecurity> {

    private CaptchaAuthenticationProvider provider = new CaptchaAuthenticationProvider();

    private UserDetailsService userDetailsService;

    private PasswordEncoder passwordEncoder;

    public CaptchaAuthenticationConfigurer(){
    }


    public CaptchaAuthenticationConfigurer(UserDetailsService userDetailsService, PasswordEncoder passwordEncoder) {
        this.userDetailsService = userDetailsService;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void configure(HttpSecurity http) {
        CaptchaAuthenticationFilter captchaAuthenticationFilter = new CaptchaAuthenticationFilter(http.getSharedObject(AuthenticationManager.class));

        CaptchaAuthenticationProvider captchaAuthenticationProvider = new CaptchaAuthenticationProvider();
        captchaAuthenticationProvider.setUserDetailsService(this.userDetailsService);
        captchaAuthenticationProvider.setPasswordEncoder(this.passwordEncoder);


        //security配置
        http.authenticationProvider(captchaAuthenticationProvider)
                .addFilterBefore(captchaAuthenticationFilter, UsernamePasswordAuthenticationFilter.class);
    }


}
