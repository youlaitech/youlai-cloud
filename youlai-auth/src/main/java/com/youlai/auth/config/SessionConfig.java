package com.youlai.auth.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.youlai.auth.captcha.CaptchaAuthenticationToken;
import com.youlai.auth.jackson2.CaptchaAuthenticationTokenMixin;
import org.springframework.beans.factory.BeanClassLoaderAware;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.security.jackson2.CoreJackson2Module;
import org.springframework.security.jackson2.SecurityJackson2Modules;
import org.springframework.security.oauth2.server.authorization.jackson2.OAuth2AuthorizationServerJackson2Module;

@Configuration
public class SessionConfig implements BeanClassLoaderAware {

    private ClassLoader classLoader;

    @Override
    public void setBeanClassLoader(ClassLoader classLoader) {
        this.classLoader = classLoader;
    }

    @Bean
    public RedisSerializer<Object> springSessionDefaultRedisSerializer() {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.registerModules(SecurityJackson2Modules.getModules(this.classLoader));
        objectMapper.registerModules(new CoreJackson2Module());
        objectMapper.registerModules(new OAuth2AuthorizationServerJackson2Module());

        objectMapper.addMixIn(CaptchaAuthenticationToken.class, CaptchaAuthenticationTokenMixin.class);
        return new GenericJackson2JsonRedisSerializer(objectMapper);
    }

}
