package com.mini_zira.services.Auth;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface AuthService {
    boolean registerUser(String fullName, String email, String username, String password, String role);
    boolean loginUser(HttpServletRequest request, HttpServletResponse response);
    boolean generateAccessToken(String refreshToken);
    boolean generateRefreshToken(String email, String password);
    boolean logoutUser(String email);
}
