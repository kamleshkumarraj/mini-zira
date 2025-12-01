package com.mini_zira.service.users;

import com.mini_zira.entities.Users;

import java.util.List;

public interface UserService {
    Users getProfile(Long id);
    void updateProfile(Users users);
    void deleteProfile(Long id);

}
