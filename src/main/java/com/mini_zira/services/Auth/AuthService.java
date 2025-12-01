package com.mini_zira.services.Auth;

public interface AuthService {
    boolean registerUser(String fullName, String email, String username, String password, String role);
    boolean loginUser(String email, String password);
    boolean generateAccessToken(String refreshToken);
    boolean generateRefreshToken(String email, String password);
    boolean logoutUser(String email);
}
