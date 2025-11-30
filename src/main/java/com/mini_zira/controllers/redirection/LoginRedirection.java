package com.mini_zira.controllers.redirection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "login-redirect", value = "/auth/login")
public class LoginRedirection extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doGet(req, resp);

        RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/pages/login.jsp");
        rd.forward(req,resp);
    }
}
