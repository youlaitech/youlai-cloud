package com.youlai.auth.ext.captcha;

import lombok.Getter;
import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.util.Assert;

import java.util.Collection;

/**
 * @see org.springframework.security.authentication.UsernamePasswordAuthenticationToken
 */
public class CaptchaAuthenticationToken extends AbstractAuthenticationToken {

    private static final long serialVersionUID = 570L;

    private Object principal;

    private Object credentials;

    @Getter
    private String validateCode;

    @Getter
    private String validateCodeCacheKey;

    public CaptchaAuthenticationToken(Object principal, Object credentials, String validateCode, String validateCodeKey) {
        super((Collection) null);
        this.principal = principal;
        this.credentials = credentials;
        this.validateCode = validateCode;
        this.validateCodeCacheKey = validateCodeKey;
        this.setAuthenticated(false);
    }

    public CaptchaAuthenticationToken(Object principal, String credentials, Collection<? extends GrantedAuthority> authorities) {
        super(authorities);
        this.principal = principal;
        this.credentials = credentials;
        super.setAuthenticated(true);
    }


    public Object getCredentials() {
        return this.credentials;
    }

    public Object getPrincipal() {
        return this.principal;
    }

    public void setAuthenticated(boolean isAuthenticated) throws IllegalArgumentException {
        Assert.isTrue(!isAuthenticated, "Cannot set this token to trusted - use constructor which takes a GrantedAuthority list instead");
        super.setAuthenticated(false);
    }

    public void eraseCredentials() {
        super.eraseCredentials();
        this.credentials = null;
    }
}
