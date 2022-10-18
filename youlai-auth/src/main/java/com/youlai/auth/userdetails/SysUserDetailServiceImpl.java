package com.youlai.auth.userdetails;

import com.youlai.common.result.ResultCode;
import com.youlai.system.dto.UserAuthInfo;
import com.youlai.system.api.UserFeignClient;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class SysUserDetailServiceImpl implements UserDetailsService {

    private final UserFeignClient userFeignClient;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserAuthInfo userAuthInfo = userFeignClient.getUserByUsername(username).getData();
        if (userAuthInfo == null) {
            throw new UsernameNotFoundException(ResultCode.USER_NOT_EXIST.getMsg());
        }
        SysUserDetails userDetails = new SysUserDetails(userAuthInfo);
        if (!userDetails.isEnabled()) {
            throw new DisabledException("该账户已被禁用!");
        } else if (!userDetails.isAccountNonLocked()) {
            throw new LockedException("该账号已被锁定!");
        } else if (!userDetails.isAccountNonExpired()) {
            throw new AccountExpiredException("该账号已过期!");
        }
        return userDetails;
    }

}
