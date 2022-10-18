package com.youlai.auth.oauth2.customizer.handler;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import com.youlai.auth.oauth2.customizer.JwtCustomizerHandler;
import com.youlai.auth.userdetails.SysUserDetails;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.core.endpoint.OAuth2ParameterNames;
import org.springframework.security.oauth2.jwt.JwtClaimsSet;
import org.springframework.security.oauth2.server.authorization.token.JwtEncodingContext;

public class UsernamePasswordAuthenticationTokenJwtCustomizerHandler extends AbstractJwtCustomizerHandler {

	public UsernamePasswordAuthenticationTokenJwtCustomizerHandler(JwtCustomizerHandler jwtCustomizerHandler) {
		super(jwtCustomizerHandler);
	}

	@Override
	protected void customizeJwt(JwtEncodingContext jwtEncodingContext) {

		Authentication authentication = jwtEncodingContext.getPrincipal();
		SysUserDetails userDetails = (SysUserDetails)authentication.getPrincipal();
		Set<String> authorities = userDetails.getAuthorities().stream()
				.map(GrantedAuthority::getAuthority)
				.collect(Collectors.toSet());

		Map<String, Object> userAttributes = new HashMap<>();
		userAttributes.put("userId", userDetails.getUserId());
		userAttributes.put("deptId", userDetails.getDeptId());

		JwtClaimsSet.Builder jwtClaimSetBuilder = jwtEncodingContext.getClaims();

		jwtClaimSetBuilder.claim(OAuth2ParameterNames.SCOPE, authorities);

		jwtClaimSetBuilder.claims(claims ->
				{
					claims.remove("nbf");
					claims.remove("iat");
					userAttributes.entrySet().stream()
							.forEach(entry -> claims.put(entry.getKey(), entry.getValue()));
				}
		);
	}

	@Override
	protected boolean supportCustomizeContext(Authentication authentication) {
		return authentication != null && authentication instanceof UsernamePasswordAuthenticationToken;
	}

}
