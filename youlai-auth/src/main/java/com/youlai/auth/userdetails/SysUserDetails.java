package com.youlai.auth.userdetails;

import cn.hutool.core.collection.CollectionUtil;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.youlai.common.constant.GlobalConstants;
import com.youlai.common.enums.PasswordEncoderTypeEnum;
import com.youlai.system.dto.UserAuthInfo;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serializable;
import java.util.Collection;
import java.util.stream.Collectors;


/**
 * 系统管理用户认证信息
 *
 * @author haoxr
 * @date 2022/10/16
 */
@Data
@JsonTypeInfo(use = JsonTypeInfo.Id.CLASS)
public class SysUserDetails implements UserDetails, Serializable {

    /**
     * 系统管理用户
     */
    public SysUserDetails(UserAuthInfo user) {
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

    @Getter
    @Setter
    private Long userId;

    @Getter
    @Setter
    private Long deptId;
    private String username;
    private String password;
    private Boolean enabled;

    private Collection<? extends GrantedAuthority> authorities;

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
