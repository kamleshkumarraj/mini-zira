package com.mini_zira.filters.auth;

import com.auth0.jwt.interfaces.DecodedJWT;
import com.mini_zira.entities.Users;
import com.mini_zira.services.profile.ProfileServiceImpl;
import com.mini_zira.utility.Auth.JWTUtils;
import com.mini_zira.utility.Cookie.CookieUtils;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter(urlPatterns = {
        "/app/profile"
})
public class IsLoggedIn implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        // first we get token.
        System.out.println("authorization filter running...");
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        String token = CookieUtils.getCookie(req, "token");

        if(token == null || token.isEmpty()){
            req.getSession().setAttribute("message", "please login to access this resource !");
            resp.sendRedirect(req.getContextPath() + "/auth/login");
            return;
        }

        DecodedJWT jwt = JWTUtils.verifyToken(token);
        if(jwt == null){
            req.getSession().setAttribute("login-message", "please login to access this resource !");
            resp.sendRedirect(req.getContextPath() + "/auth/login");
            return;
        }

        request.setAttribute("email", jwt.getClaim("email").asString());
        chain.doFilter(request, response);

    }
}
