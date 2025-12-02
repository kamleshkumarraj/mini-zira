package com.mini_zira.controllers.user;

import com.mini_zira.entities.Users;
import com.mini_zira.services.profile.ProfileServiceImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet(name = "profile-controller", value = "/app/profile")
public class Profile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doGet(req, resp);
        System.out.println("profile running...");
        String email = (String) req.getAttribute("email");

        ProfileServiceImpl profileService = new ProfileServiceImpl();
        Users user = profileService.getProfile(email);

        if(user == null){
            req.getSession().setAttribute("login-message", "profile not found !");
            resp.sendRedirect(req.getContextPath() + "/auth/login");
            return;
        }

        RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/pages/profile.jsp");
        req.setAttribute("fullName", user.getFullName());
        req.setAttribute("email", user.getEmail());
        req.setAttribute("username",  user.getUsername());
        req.setAttribute("role", user.getRole());
        rd.forward(req, resp);
    }
}
