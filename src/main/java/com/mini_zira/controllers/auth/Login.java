package com.mini_zira.controllers.auth;

import com.mini_zira.service.Auth.AuthServiceImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "login-controller", value = "/login")
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doPost(req, resp);

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        RequestDispatcher rd = req.getRequestDispatcher("WEB-INF/views/pages/login.jsp");

        if(email.isEmpty() || password.isEmpty() || role.isEmpty()){
            req.setAttribute("error","Please fill all the fields");
            rd.include(req, resp);
            return;
        }

        AuthServiceImpl auth = new AuthServiceImpl();
        boolean res = auth.loginUser(email, password);

        if(res == true){
            req.getSession().setAttribute("login", "login-user");
            resp.sendRedirect((req.getContextPath()+"/home"));
        }else{
            req.setAttribute("error","Get Error during login");
            rd.include(req, resp);
        }
    }
}
