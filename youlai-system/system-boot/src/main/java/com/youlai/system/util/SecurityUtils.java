package com.youlai.system.util;

import cn.hutool.core.collection.CollectionUtil;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.Collections;
import java.util.Set;
import java.util.stream.Collectors;

public class SecurityUtils {


    public static String getUsername() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username =  authentication.getName();
        return username;
    }

    public static Set<String> getAuthorities() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Set<String> authorities;

        if (CollectionUtil.isNotEmpty(authentication.getAuthorities())) {
            authorities = authentication.getAuthorities().stream().map(item -> item.getAuthority()).collect(Collectors.toSet());
        } else {
            authorities = Collections.EMPTY_SET;
        }
        return authorities;
    }


}
