package com.youlai.admin.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MessageController {


    @GetMapping("/messages")
    public String[] getMessages(String name,  @AuthenticationPrincipal Jwt jwt) {

        if(StringUtils.hasText(name)){
            return new String[] {name,"Message 1", "Message 2", "Message 3"};
        }
        return new String[] {"Message 1", "Message 2", "Message 3",  String.format("Hello %s!",jwt.getSubject())};
    }


}
