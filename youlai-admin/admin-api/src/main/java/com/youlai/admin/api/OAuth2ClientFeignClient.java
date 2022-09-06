package com.youlai.admin.api;

import com.youlai.admin.dto.OAuth2ClientDTO;
import com.youlai.common.result.Result;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(value = "youlai-admin", contextId = "oauth2Client")
public interface OAuth2ClientFeignClient {

    /**
     * 获取OAuth2客户端认证凭证
     *
     * @param clientId
     * @return
     */
    @GetMapping("/api/v1/oauth2clients/{clientId}/credentials")
    Result<OAuth2ClientDTO> getOAuth2ClientCredentials(@PathVariable String clientId);
}
