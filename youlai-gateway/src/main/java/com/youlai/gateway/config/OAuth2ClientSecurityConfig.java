package com.youlai.gateway.config;

import cn.hutool.core.convert.Convert;
import com.youlai.gateway.resolver.SveRequestServerOAuth2AuthorizationRequestResolver;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.reactive.EnableWebFluxSecurity;
import org.springframework.security.config.web.server.ServerHttpSecurity;
import org.springframework.security.oauth2.client.registration.ReactiveClientRegistrationRepository;
import org.springframework.security.oauth2.client.web.server.ServerOAuth2AuthorizationRequestResolver;
import org.springframework.security.web.server.DelegatingServerAuthenticationEntryPoint;
import org.springframework.security.web.server.SecurityWebFilterChain;
import org.springframework.security.web.server.ServerAuthenticationEntryPoint;
import org.springframework.security.web.server.authentication.HttpStatusServerEntryPoint;
import org.springframework.security.web.server.authentication.RedirectServerAuthenticationEntryPoint;
import org.springframework.security.web.server.authentication.ServerAuthenticationEntryPointFailureHandler;
import org.springframework.security.web.server.util.matcher.MediaTypeServerWebExchangeMatcher;
import org.springframework.security.web.server.util.matcher.ServerWebExchangeMatcher;
import org.springframework.util.StringUtils;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;


/**
 * Security 安全配置
 *
 * @author haoxr
 * @date 2022/8/28
 */
@ConfigurationProperties(prefix = "security")
@EnableWebFluxSecurity
@Slf4j
public class OAuth2ClientSecurityConfig {

    @Setter
    private List<String> ignoreUrls;


    @Bean
    public SecurityWebFilterChain springSecurityFilterChain(ServerHttpSecurity http
                                                            ,
                                                            ServerOAuth2AuthorizationRequestResolver serverOAuth2AuthorizationRequestResolver
    ) {
        if (ignoreUrls == null) {
            log.error("failed to read ignoreUrls configuration,please check your nacos connection or configuration!");
        }

        http
                // 请求鉴权配置
                .authorizeExchange(authorizeExchangeSpec ->
                        authorizeExchangeSpec
                                .pathMatchers(Convert.toStrArray(ignoreUrls)).permitAll()
                                .anyExchange().authenticated()
                )
                // 允许iframe调用
                .headers().frameOptions().disable()
                .and()
                // 禁用csrf token安全校验
                .csrf().disable()
                // 异常处理
                .exceptionHandling()
                .authenticationEntryPoint(authenticationEntryPoint()) // 未认证响应处理
                .and()
                .oauth2Login(oAuth2LoginSpec ->
                        oAuth2LoginSpec
                                .authenticationFailureHandler(new ServerAuthenticationEntryPointFailureHandler(authenticationEntryPoint()))
                                .authorizationRequestResolver(serverOAuth2AuthorizationRequestResolver)
                )
                .oauth2Client(Customizer.withDefaults());
        return http.build();
    }

    /**
     * 未认证响应处理
     */
    @Bean
    ServerAuthenticationEntryPoint authenticationEntryPoint() {
        MediaTypeServerWebExchangeMatcher applicationJsonMatcher = new MediaTypeServerWebExchangeMatcher(MediaType.APPLICATION_JSON);
        applicationJsonMatcher.setIgnoredMediaTypes(Stream.of(MediaType.ALL).collect(Collectors.toSet()));

        List<DelegatingServerAuthenticationEntryPoint.DelegateEntry> delegateEntryList = Arrays.asList(
                //请求头accept为application/json -> 返回401
                new DelegatingServerAuthenticationEntryPoint.DelegateEntry(
                        applicationJsonMatcher,
                        new HttpStatusServerEntryPoint(HttpStatus.UNAUTHORIZED)),
                //请求头X-Requested-With为XMLHttpRequest -> 返回401
                new DelegatingServerAuthenticationEntryPoint.DelegateEntry(new ServerWebExchangeMatcher() {
                    @Override
                    public Mono<MatchResult> matches(ServerWebExchange exchange) {
                        String xRequestedWith = exchange.getRequest().getHeaders().getFirst("X-Requested-With");
                        Boolean match = StringUtils.hasText(xRequestedWith) && xRequestedWith.equals("XMLHttpRequest");
                        return match ? MatchResult.match() : MatchResult.notMatch();
                    }
                }, new HttpStatusServerEntryPoint(HttpStatus.UNAUTHORIZED)),
                //跨域OPTIONS请求返回200（解决浏览器报错）
                new DelegatingServerAuthenticationEntryPoint.DelegateEntry(new ServerWebExchangeMatcher() {
                    @Override
                    public Mono<MatchResult> matches(ServerWebExchange exchange) {
                        HttpMethod method = exchange.getRequest().getMethod();
                        Boolean match = HttpMethod.OPTIONS.equals(method);
                        return match ? MatchResult.match() : MatchResult.notMatch();
                    }
                }, new HttpStatusServerEntryPoint(HttpStatus.OK))
        );

        DelegatingServerAuthenticationEntryPoint nonAjaxLoginEntryPoint = new DelegatingServerAuthenticationEntryPoint(delegateEntryList);
        // 默认登录入口即为OAuth2重定向登录端点
        nonAjaxLoginEntryPoint.setDefaultEntryPoint(new RedirectServerAuthenticationEntryPoint("/oauth2/authorization/gateway-client-authorization-code"));
        return nonAjaxLoginEntryPoint;
    }


    /**
     * OAuth2 Client Authorization Endpoint /oauth2/authoriztion/{clientRegId} <br/>
     * 请求解析器扩展实现 - 支持提取query参数redirect_uri，用作后续OAuth2认证完成后SCG重定向到该指定redirect_uri。<br/>
     * 适用场景：SPA -> SCG -> SCG返回401 -> SPA重定向到/oauth2/authorization/{clientRegId}?redirect_uri=http://spa -> SCG完成OAuth2认证后再重定向回http://spa
     */
    @Bean
    @Primary
    public ServerOAuth2AuthorizationRequestResolver saveRequestServerOAuth2AuthorizationRequestResolver(ReactiveClientRegistrationRepository clientRegistrationRepository) {
        return new SveRequestServerOAuth2AuthorizationRequestResolver(clientRegistrationRepository);
    }



}