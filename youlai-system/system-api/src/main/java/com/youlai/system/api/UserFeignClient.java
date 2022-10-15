package com.youlai.system.api;

import com.youlai.system.dto.SysUserDetailsDTO;
import com.youlai.common.result.Result;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(value = "youlai-system")
public interface UserFeignClient {

    /**
     * 获取用户认证凭证
     *
     * @param username
     * @return
     */
    @GetMapping("/api/v1/users/username/{username}")
    Result<SysUserDetailsDTO> getUserByUsername(@PathVariable String username);
}
