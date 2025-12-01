package com.mini_zira.services.users;

import com.mini_zira.entities.Users;

public interface UserService {
    Users getProfile(Long id);
    void updateProfile(Users users);
    void deleteProfile(Long id);

}
