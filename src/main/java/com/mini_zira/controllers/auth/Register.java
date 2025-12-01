package com.mini_zira.controllers.auth;

import com.mini_zira.service.Auth.AuthServiceImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "register-controller", value = "/register")
public class Register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doPost(req, resp);
        System.out.println("register routing running...");

        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        String role = req.getParameter("role");

        System.out.println("fullName: " + fullName);
        RequestDispatcher rd = req.getRequestDispatcher("WEB-INF/views/pages/register.jsp");

        if(password.equals(confirmPassword)) {
            AuthServiceImpl auth = new AuthServiceImpl();
            boolean res = auth.registerUser(fullName, email, username, password, role);
            if(res == true){
                req.setAttribute("message", "Register Successfully");
                rd.include(req, resp);
            }else{
                req.setAttribute("message", "Register Failed");
                rd.include(req, resp);
            }
        }else{
            req.setAttribute("error", "Passwords do not match");
            rd.include(req, resp);
        }
    }

}
