package com.video_web.interceptor;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginInterceptor implements Filter{
    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
                         FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        String currentURL = request.getRequestURI();
        String ctxPath = request.getContextPath();
        System.out.println("12"+currentURL);
        System.out.println("12"+ctxPath);
        //除掉项目名称时访问页面当前路径
        String targetURL = currentURL.substring(ctxPath.length());
        System.out.println("12"+targetURL);
        HttpSession session = request.getSession(false);
        //对当前页面进行判断，如果当前页面不为登录页面
        if("/jsp/userinfo.jsp".equals(targetURL)){
            request.getRequestDispatcher("/jsp/main.jsp").forward(request,response);

        }else{
            //这里表示如果当前页面是登陆页面，跳转到登陆页面
            /*response.sendRedirect();*/
            filterChain.doFilter(request, response);
        }
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
    }

}