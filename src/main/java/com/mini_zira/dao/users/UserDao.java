package com.mini_zira.dao.users;


import com.mini_zira.entities.Users;

public interface UserDao {
    boolean saveUser(String fullName, String email, String username, String password, String role);
    boolean updateUser(Long id, String fullName, String email, String username, String password, String role);
    boolean deleteUser(Long id);
    Users getUserById(Long id);

}
