package com.mini_zira.services.Auth;

import com.mini_zira.dao.users.UserDaoImpl;
import com.mini_zira.db.HibernateConfig;
import com.mini_zira.entities.Users;
import com.mini_zira.utility.Auth.Password;

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
    public boolean loginUser(String email, String password) {
        Users user = userDao.getUserById();
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
