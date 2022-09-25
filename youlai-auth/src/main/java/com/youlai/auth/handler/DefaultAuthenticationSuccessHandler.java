package com.youlai.auth.handler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.youlai.auth.ext.captcha.CaptchaAuthenticationToken;
import com.youlai.auth.jackson2.CaptchaAuthenticationTokenMixin;
import com.youlai.common.result.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Slf4j
public class DefaultAuthenticationSuccessHandler implements AuthenticationSuccessHandler {


    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {

        if (response.isCommitted()) {
            log.info("Response has already been committed");
            return;
        }
        response.setStatus(HttpServletResponse.SC_OK);
        response.setCharacterEncoding("utf-8");
        response.setContentType(MediaType.APPLICATION_JSON_VALUE);

        ObjectMapper objectMapper = new ObjectMapper()  .registerModule(new JavaTimeModule());
        // You will need to write the Mixin for your class so Jackson can marshall it.
        objectMapper.addMixIn(CaptchaAuthenticationToken.class, CaptchaAuthenticationTokenMixin.class);

       // UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        // TODO
        String resBody = objectMapper.writeValueAsString(Result.success("bearer token"));
        PrintWriter printWriter = response.getWriter();
        printWriter.print(resBody);
        printWriter.flush();
        printWriter.close();


    }
}
