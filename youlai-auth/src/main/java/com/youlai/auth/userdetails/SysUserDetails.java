package com.youlai.auth.userdetails;

import cn.hutool.core.collection.CollectionUtil;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.youlai.common.constant.GlobalConstants;
import com.youlai.common.enums.PasswordEncoderTypeEnum;
import com.youlai.system.dto.SysUserDetailsDTO;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.*;
import java.util.stream.Collectors;


/**
 * 系统管理用户认证信息
 *
 * @author <a href="mailto:xianrui0365@163.com">haoxr</a>
 * @date 2021/9/27
 */
@Data
@JsonTypeInfo(use = JsonTypeInfo.Id.CLASS)
@JsonIgnoreProperties({"accountNonExpired", "accountNonLocked", "credentialsNonExpired", "enabled"})
public class SysUserDetails implements UserDetails {

    public SysUserDetails(){

    }

    /**
     * 扩展字段：用户ID
     */
    private Long userId;


    /**
     * 扩展字段：部门ID
     */
    private Long deptId;

    /**
     * 默认字段
     */
    private String username;
    private String password;
    private Boolean enabled;

    private Collection<? extends GrantedAuthority> authorities;

    /**
     * 系统管理用户
     */
    public SysUserDetails(SysUserDetailsDTO user) {
        this.setUserId(user.getUserId());
        this.setUsername(user.getUsername());
        this.setDeptId(user.getDeptId());
        this.setPassword(PasswordEncoderTypeEnum.BCRYPT.getPrefix() + user.getPassword());
        this.setEnabled(GlobalConstants.STATUS_YES.equals(user.getStatus()));
        if (CollectionUtil.isNotEmpty(user.getRoles())) {
            authorities = user.getRoles().stream().map(SimpleGrantedAuthority::new)
                    .collect(Collectors.toSet());
        }
    }


    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return this.authorities;
    }

    @Override
    public String getPassword() {
        return this.password;
    }

    @Override
    public String getUsername() {
        return this.username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return this.enabled;
    }
}
