package com.youlai.gateway.resolver;

import cn.hutool.core.collection.CollectionUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.security.oauth2.client.registration.ReactiveClientRegistrationRepository;
import org.springframework.security.oauth2.client.web.server.DefaultServerOAuth2AuthorizationRequestResolver;
import org.springframework.security.oauth2.core.endpoint.OAuth2AuthorizationRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.Optional;

@Component
@Slf4j
public class SveRequestServerOAuth2AuthorizationRequestResolver extends DefaultServerOAuth2AuthorizationRequestResolver {

    public SveRequestServerOAuth2AuthorizationRequestResolver(ReactiveClientRegistrationRepository clientRegistrationRepository) {
        super(clientRegistrationRepository);
    }

    @Override
    public Mono<OAuth2AuthorizationRequest> resolve(ServerWebExchange exchange) {

        Mono<OAuth2AuthorizationRequest> resolve = super.resolve(exchange)
                .doOnNext(oAuth2AuthorizationRequest -> {
                    Optional.ofNullable(exchange.getRequest())
                            .map(ServerHttpRequest::getQueryParams)
                            .map(queryParams -> queryParams.get("redirect_uri"))
                            .filter(redirectUris -> CollectionUtil.isNotEmpty(redirectUris))
                            .map(redirectUris -> redirectUris.get(0))
                            .ifPresent(redirectUri -> {
                                exchange.getSession().subscribe(webSession -> {
                                    webSession.getAttributes().put("SPRING_SECURITY_SAVED_REQUEST", redirectUri);
                                    log.info("SCG OAuth2 authorization endpoint queryParam redirect_uri added to WebSession,{}", redirectUri);
                                });
                            });
                });
        return resolve;
    }
}
