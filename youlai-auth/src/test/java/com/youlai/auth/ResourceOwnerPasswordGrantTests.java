package com.youlai.auth;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.HttpHeaders;
import org.springframework.security.oauth2.core.endpoint.OAuth2ParameterNames;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClient;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClientRepository;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/**
 * @author haoxr
 * @since 2023/5/23
 */

@SpringBootTest
@Slf4j
@AutoConfigureMockMvc
public class ResourceOwnerPasswordGrantTests {

    @Autowired
    private RegisteredClientRepository registeredClientRepository;

    @Autowired
    private MockMvc mvc;

    /**
     * @link https://github.com/spring-projects/spring-authorization-server/pull/1105/commits/867f918a8832afb82596c85618be697b386068d5#diff-f380d840914e2a5f8e797578f391a3e9892942d88da87a769c899e977af384fc
     *
     * @throws Exception
     */
    @Test
    void testAuthentication() throws Exception {
        RegisteredClient registeredClient = registeredClientRepository.findByClientId("messaging-client");

        HttpHeaders headers = new HttpHeaders();
        headers.setBasicAuth(registeredClient.getClientId(),
                "secret");

        // @formatter:off
        this.mvc.perform(post("/oauth2/token")
                        .param(OAuth2ParameterNames.GRANT_TYPE, "password")
                        .param(OAuth2ParameterNames.USERNAME, "admin")
                        .param(OAuth2ParameterNames.PASSWORD, "123456")
                        .headers(headers))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.access_token").isNotEmpty());
        // @formatter:on

    }

}
