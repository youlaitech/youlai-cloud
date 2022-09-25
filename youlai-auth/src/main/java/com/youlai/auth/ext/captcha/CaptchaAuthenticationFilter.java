package com.youlai.auth.ext.captcha;

import cn.hutool.core.util.StrUtil;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @see org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter
 */
public class CaptchaAuthenticationFilter extends AbstractAuthenticationProcessingFilter {

    private boolean postOnly = true;

    private static final AntPathRequestMatcher DEFAULT_ANT_PATH_REQUEST_MATCHER = new AntPathRequestMatcher("/login/captcha", "POST");



    protected CaptchaAuthenticationFilter(AuthenticationManager authenticationManager) {
        super(DEFAULT_ANT_PATH_REQUEST_MATCHER, authenticationManager);
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
            throws AuthenticationException {
        if (this.postOnly && !request.getMethod().equals("POST")) {
            throw new AuthenticationServiceException("Authentication method not supported: " + request.getMethod());
        } else {
            String username = StrUtil.trimToEmpty(request.getParameter("username"));
            String password = StrUtil.trimToEmpty(request.getParameter("password"));
            String validateCode = StrUtil.trimToEmpty(request.getParameter("validateCode"));
            String validateCodeCacheKey = StrUtil.trimToEmpty(request.getParameter("validateCodeCacheKey"));

            CaptchaAuthenticationToken authRequest = new CaptchaAuthenticationToken(username,password,validateCode,validateCodeCacheKey);
            this.setDetails(request, authRequest);
            return this.getAuthenticationManager().authenticate(authRequest);

        }
    }


    protected void setDetails(HttpServletRequest request, CaptchaAuthenticationToken authRequest) {
        authRequest.setDetails(this.authenticationDetailsSource.buildDetails(request));
    }
}
