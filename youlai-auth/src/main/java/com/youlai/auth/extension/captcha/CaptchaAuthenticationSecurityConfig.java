package com.youlai.auth.extension.captcha;

import com.youlai.auth.userdetails.user.SysUserDetailServiceImpl;
import org.springframework.security.config.annotation.SecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.DefaultSecurityFilterChain;

public class CaptchaAuthenticationSecurityConfig  extends SecurityConfigurerAdapter<DefaultSecurityFilterChain, HttpSecurity> {


    public CaptchaAuthenticationSecurityConfig(UserDetailsService userDetailsService) {
    }
}
