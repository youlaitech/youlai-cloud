package com.youlai.auth.userdetails;

import com.youlai.common.result.Result;
import com.youlai.common.result.ResultCode;
import com.youlai.system.api.UserFeignClient;
import com.youlai.system.dto.SysUserDetailsDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service("sysUserDetailService")
@RequiredArgsConstructor
@Slf4j
public class SysUserDetailServiceImpl implements UserDetailsService {

    private final UserFeignClient userFeignClient;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        SysUserDetails userDetails = null;
        Result<SysUserDetailsDTO> result = null;
        try {

            result = userFeignClient.getUserByUsername(username);
        } catch (Exception e) {
            log.info(e.getMessage());
            e.printStackTrace();
        }
        if (Result.isSuccess(result)) {
            SysUserDetailsDTO user = result.getData();
            if (null != user) {
                userDetails = new SysUserDetails(user);
            }
        }
        if (userDetails == null) {
            throw new UsernameNotFoundException(ResultCode.USER_NOT_EXIST.getMsg());
        } else if (!userDetails.isEnabled()) {
            throw new DisabledException("该账户已被禁用!");
        } else if (!userDetails.isAccountNonLocked()) {
            throw new LockedException("该账号已被锁定!");
        } else if (!userDetails.isAccountNonExpired()) {
            throw new AccountExpiredException("该账号已过期!");
        }
        return userDetails;
    }

}
