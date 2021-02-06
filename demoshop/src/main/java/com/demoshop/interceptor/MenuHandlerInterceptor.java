package com.demoshop.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.demoshop.service.ICategoryService;
import com.demoshop.util.SecurityUtils;

public class MenuHandlerInterceptor implements HandlerInterceptor {

	@Autowired
	private ICategoryService categoryService;


	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		request.setAttribute("sidebar", categoryService.loadSidebar());
		
		List<String> authorize = SecurityUtils.getAuthorities();
		for (String item : authorize) {
			if(item.equals("ROLE_ADMIN"))
			request.setAttribute("authorize", "ROLE_ADMIN");
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
