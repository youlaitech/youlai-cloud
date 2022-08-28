package com.youlai.gateway.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.annotation.RegisteredOAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.web.reactive.function.client.ServerOAuth2AuthorizedClientExchangeFilterFunction;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;


/**
 * 消息测试控制器
 *
 * @author haoxr
 * @date 2022/8/28
 */
@RestController
@RequiredArgsConstructor
public class MessageController {
	private final WebClient webClient;

	@Value("${messages.base-uri}")
	private  String messagesBaseUri;

	@GetMapping("/")
	public Mono<String> messages(@RegisteredOAuth2AuthorizedClient("messaging-client-authorization-code") OAuth2AuthorizedClient authorizedClient) {
		Mono<String> stringMono = this.webClient
				.get()
				.uri(messagesBaseUri)
				.attributes(ServerOAuth2AuthorizedClientExchangeFilterFunction.oauth2AuthorizedClient(authorizedClient))
				.retrieve()
				.bodyToMono(String.class);
		return stringMono;
	}
}
