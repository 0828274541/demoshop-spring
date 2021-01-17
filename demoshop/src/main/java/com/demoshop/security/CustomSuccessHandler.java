package com.demoshop.security;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.demoshop.util.SecurityUtils;

@Component
public class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException {
		HttpSession session = request.getSession();
		session.setAttribute("username", SecurityUtils.getPrincipal().getUsername());
		String targetUrl = determineTargetUrl(authentication,request);
		if (response.isCommitted()) {
			return;
		}
		redirectStrategy.sendRedirect(request, response, targetUrl);
	}

	public RedirectStrategy getRedirectStrategy() {
		return redirectStrategy;
	}
	
	public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
		this.redirectStrategy = redirectStrategy;
	}
	
	private String determineTargetUrl(Authentication authentication, HttpServletRequest request) {
		String url = "";
		HttpSession session = request.getSession();
		if(session.getAttribute("productId")!=null) {
			return url ="/chi-tiet?id="+session.getAttribute("productId");
		}
		/*
		 * List<String> roles = SecurityUtils.getAuthorities(); if (isAdmin(roles)) {
		 * url = "/quan-tri/trang-chu"; } else if (isUser(roles)) { url =
		 * "/quan-tri/tai-khoan/list"; }
		 */
		
		return url ="/trang-chu";
	}
	
	private boolean isAdmin(List<String> roles) {
		if (roles.contains("ROLE_ADMIN")) {
			return true;
		}
		return false;
	}
	
	private boolean isUser(List<String> roles) {
		if (roles.contains("ROLE_USER")) {
			return true;
		}
		return false;
	}
}
