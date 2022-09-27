package com.youlai.auth.captcha;

import lombok.Getter;
import lombok.Setter;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
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
        // 验证码校验 TODO


        // 用户名密码校验
        String username = (String) authenticationToken.getPrincipal();
        String password = (String) authenticationToken.getCredentials();

        UserDetails user = userDetailsService.loadUserByUsername(username);
        if (!this.passwordEncoder.matches(password, user.getPassword())) {
            throw new BadCredentialsException("用户名或密码错误");
        }

        // 认证成功
        Object principalToReturn = user;
        CaptchaAuthenticationToken result = new CaptchaAuthenticationToken(principalToReturn, password, user.getAuthorities());
        return result;
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return CaptchaAuthenticationToken.class.isAssignableFrom(authentication);
    }
}
