package com.youlai.auth.oauth2.customizer.handler;

import com.youlai.auth.oauth2.customizer.JwtCustomizerHandler;
import org.springframework.security.oauth2.server.authorization.token.JwtEncodingContext;


public class DefaultJwtCustomizerHandler implements JwtCustomizerHandler {

	@Override
	public void customize(JwtEncodingContext jwtEncodingContext) {
		// does not modify anything in context

	}

}
