package com.mini_zira.services.profile;

import com.mini_zira.dao.users.UserDaoImpl;
import com.mini_zira.db.HibernateConfig;
import com.mini_zira.entities.Users;

public class ProfileServiceImpl implements ProfileService{
    UserDaoImpl userDao = new UserDaoImpl(HibernateConfig.getSessionFactory());
    @Override
    public Users getProfile(String email) {
        Users user = userDao.getUserByEmail(email);
        return user;
    }
}
