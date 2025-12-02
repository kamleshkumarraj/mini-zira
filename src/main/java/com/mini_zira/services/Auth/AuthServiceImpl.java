package com.mini_zira.services.Auth;

import com.mini_zira.dao.users.UserDaoImpl;
import com.mini_zira.db.HibernateConfig;
import com.mini_zira.entities.Users;
import com.mini_zira.utility.Auth.JWTUtils;
import com.mini_zira.utility.Auth.Password;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AuthServiceImpl implements  AuthService{
    private UserDaoImpl userDao = new UserDaoImpl(HibernateConfig.getSessionFactory());
    @Override
    public boolean registerUser(String fullName, String email, String username, String password, String role) {
//        UserDaoImpl userDao = new UserDaoImpl(HibernateConfig.getSessionFactory());
        // now we write code for hashing the password.
        password = Password.HashPassword(password);
        boolean res = userDao.saveUser(fullName, email, username, password, role);
        return res;
    }

    @Override
    public boolean loginUser(HttpServletRequest req, HttpServletResponse res) {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        Users user = userDao.getUserByEmail(email);

        if(user==null){
            return false;
        }
        if(!Password.comparePassword(password, user.getPasswordHash())){
            return false;
        }

        if(!user.getRole().equals(role)){
            return false;
        }

        String token = JWTUtils.generateToken(user.getId(), user.getEmail());
        Cookie cookie = new Cookie("token", token);
        cookie.setPath("/");
        cookie.setMaxAge(60*60*10);
        cookie.setHttpOnly(true);
        cookie.setSecure(true);

        res.addCookie(cookie);

        return  true;
    }

    @Override
    public boolean generateAccessToken(String refreshToken) {
        return false;
    }

    @Override
    public boolean generateRefreshToken(String email, String password) {
        return false;
    }

    @Override
    public boolean logoutUser(String email) {
        return false;
    }
}
