package com.youlai.gateway.filter;

import cn.hutool.json.JSONUtil;
import org.springframework.cloud.gateway.filter.GatewayFilter;
import org.springframework.cloud.gateway.filter.factory.AbstractGatewayFilterFactory;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;

import java.util.Map;

/**
 * @see org.springframework.cloud.gateway.filter.factory.TokenRelayGatewayFilterFactory
 */
@Component
public class UserInfoRelayGatewayFilterFactory extends AbstractGatewayFilterFactory<Object> {

    private final static String USER_INFO_HEADER = "X-User-Info";

    public UserInfoRelayGatewayFilterFactory() {
        super(Object.class);
    }

    public GatewayFilter apply() {
        return apply((Object) null);
    }

    @Override
    public GatewayFilter apply(Object config) {
        return (exchange, chain) -> exchange.getPrincipal()
                // .log("token-relay-filter")
                .filter(principal -> principal instanceof OAuth2AuthenticationToken)
                .cast(OAuth2AuthenticationToken.class)
                //.flatMap(authentication -> authorizedClient(exchange, authentication))
                .map(OAuth2AuthenticationToken::getPrincipal)
                .map(oAuth2User -> withUserInfoHeader(exchange, oAuth2User))
                .defaultIfEmpty(exchange)
                .flatMap(chain::filter);
    }

    private ServerWebExchange withUserInfoHeader(ServerWebExchange exchange, OAuth2User oAuth2User) {
        //String userName = oAuth2User.getName();
        Map<String, Object> userAttrs = oAuth2User.getAttributes();
        if (oAuth2User instanceof OidcUser) {
            userAttrs = ((OidcUser) oAuth2User).getUserInfo().getClaims();
        }
        String userAttrsJson = JSONUtil.toJsonStr(userAttrs);
        return exchange.mutate()
                .request(r -> r.headers(headers -> headers.add(USER_INFO_HEADER, userAttrsJson)))
                .build();
    }

}
