package com.youlai.auth.extension.captcha;

import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.SecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.DefaultSecurityFilterChain;


/**
 * @see org.springframework.security.config.annotation.authentication.configurers.userdetails.AbstractDaoAuthenticationConfigurer
 */
public class CaptchaAuthenticationConfigurer extends SecurityConfigurerAdapter<DefaultSecurityFilterChain, HttpSecurity> {

    private CaptchaAuthenticationProvider provider = new CaptchaAuthenticationProvider();

    private final UserDetailsService userDetailsService;


    public CaptchaAuthenticationConfigurer(UserDetailsService userDetailsService) {
        this.userDetailsService = userDetailsService;
        this.provider.setUserDetailsService(userDetailsService);
    }

    @Override
    public void configure(HttpSecurity builder) {
        this.provider = (CaptchaAuthenticationProvider)this.postProcess(this.provider);
        builder.authenticationProvider(this.provider);
    }

    public CaptchaAuthenticationConfigurer passwordEncoder(PasswordEncoder passwordEncoder) {
        this.provider.setPasswordEncoder(passwordEncoder);
        return this;
    }

}
