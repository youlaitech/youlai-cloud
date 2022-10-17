package com.youlai.security.util;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.nimbusds.jose.JWSObject;
import com.youlai.common.constant.GlobalConstants;
import lombok.SneakyThrows;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.util.Collections;
import java.util.Set;
import java.util.stream.Collectors;

public class SecurityUtils {

    public static String getUsername() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        return username;
    }


    public static Set<String> getAuthorities() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Set<String> authorities;

        if (CollectionUtil.isNotEmpty(authentication.getAuthorities())) {
            authorities = authentication.getAuthorities()
                    .stream()
                    .map(item -> item.getAuthority()).collect(Collectors.toSet());
        } else {
            authorities = Collections.EMPTY_SET;
        }
        return authorities;
    }

    public static Set<String> getRoles() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Set<String> authorities;

        if (CollectionUtil.isNotEmpty(authentication.getAuthorities())) {
            authorities = authentication.getAuthorities()
                    .stream()
                    .map(item -> StrUtil.replace(item.getAuthority(),"SCOPE_","")).collect(Collectors.toSet());
        } else {
            authorities = Collections.EMPTY_SET;
        }
        return authorities;
    }

    /**
     * 获取部门ID
     */
    public static Long getDeptId() {
        Long deptId = getPayload().getLong("deptId");
        return deptId;
    }

    public static boolean isRoot() {
        Set<String> roles = getRoles();
        boolean isRoot = roles.contains(GlobalConstants.ROOT_ROLE_CODE);
        return isRoot;

    }


    @SneakyThrows
    public static JSONObject getPayload()  {
        JSONObject jsonObject = null;
     /*   String authorization = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest().getHeader("Authorization");

        String payload = null;
        if (StrUtil.isNotBlank(authorization) && StrUtil.startWithIgnoreCase(authorization, "Bearer ")) {
            authorization = StrUtil.replaceIgnoreCase(authorization, "Bearer ", "");
            payload = JWSObject.parse(authorization).getPayload().toString();

            jsonObject = JSONUtil.parseObj(URLDecoder.decode(payload, StandardCharsets.UTF_8.name()));
        }*/
        return jsonObject;
    }

}
