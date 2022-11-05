package com.youlai.security.util;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.StrUtil;
import com.youlai.common.constant.GlobalConstants;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;

import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

public class SecurityUtils {

    public static Long getUserId() {
        Long userId = Convert.toLong(getTokenAttributes().get("userId"));
        return userId;
    }

    public static String getUsername() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        return username;
    }

    public static Map<String, Object> getTokenAttributes() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        JwtAuthenticationToken jwtAuthenticationToken = (JwtAuthenticationToken) authentication;
        Map<String, Object> tokenAttributes = jwtAuthenticationToken.getTokenAttributes();
        return tokenAttributes;
    }


    public static Set<String> getRoles() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        Set<String> roles;
        if (CollectionUtil.isNotEmpty(authentication.getAuthorities())) {
            roles = authentication.getAuthorities()
                    .stream()
                    .map(item -> StrUtil.removePrefix(item.getAuthority(), "ROLE_")).collect(Collectors.toSet());
        } else {
            roles = Collections.EMPTY_SET;
        }
        return roles;
    }

    /**
     * 获取部门ID
     */
    public static Long getDeptId() {
        Long deptId = Convert.toLong(getTokenAttributes().get("deptId"));
        return deptId;
    }

    public static boolean isRoot() {
        return getRoles().contains(GlobalConstants.ROOT_ROLE_CODE);
    }


}
