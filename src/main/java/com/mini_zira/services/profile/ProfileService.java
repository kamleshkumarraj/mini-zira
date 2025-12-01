package com.mini_zira.services.profile;

import com.mini_zira.entities.Users;

public interface ProfileService {
    Users getProfile(String email);
}
