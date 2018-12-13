package com.qyxy.controller;


import org.springframework.web.multipart.MultipartResolver;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 跨域访问过滤器
 * @author ShrekerNil
 */
public class AccessControlAllowOriginFilter implements Filter {
	// 用于创建MultipartHttpServletRequest
	private MultipartResolver multipartResolver = null;

	public void init(FilterConfig filterConfig) throws ServletException {

	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		HttpServletResponse response = (HttpServletResponse) resp;
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
		response.setHeader("Access-Control-Allow-Headers", "Content-Type");
		chain.doFilter(req, resp);
	}

	public void destroy() {

	}
}