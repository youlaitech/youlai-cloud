package com.youlai.auth.extension.captcha;

import lombok.Getter;
import lombok.Setter;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.AbstractUserDetailsAuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * @see org.springframework.security.authentication.dao.DaoAuthenticationProvider
 */
public class CaptchaAuthenticationProvider implements AuthenticationProvider {

    @Getter
    @Setter
    private PasswordEncoder passwordEncoder;

    @Getter
    @Setter
    private UserDetailsService userDetailsService;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {

        CaptchaAuthenticationToken authenticationToken = (CaptchaAuthenticationToken) authentication;

        String validateCode = authenticationToken.getValidateCode();
        String validateCodeCacheKey = authenticationToken.getValidateCodeCacheKey();
        // 验证码校验


        // 用户名密码校验
        String username = (String) authenticationToken.getPrincipal();
        String password = (String) authenticationToken.getCredentials();

        UserDetails userDetails = userDetailsService.loadUserByUsername(username);
        if (this.passwordEncoder.matches(password, userDetails.getPassword())) {
            throw new BadCredentialsException("用户名密码错误");
        }

        CaptchaAuthenticationToken result=new CaptchaAuthenticationToken(username,password,userDetails.getAuthorities());
        return result;
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return CaptchaAuthenticationToken.class.isAssignableFrom(authentication);
    }
}
