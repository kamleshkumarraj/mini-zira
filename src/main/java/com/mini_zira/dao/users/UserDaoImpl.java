package com.mini_zira.dao.users;

import com.mini_zira.entities.Users;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class UserDaoImpl implements  UserDao{
    private SessionFactory sessionFactory;

    public UserDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public boolean saveUser(String fullName, String email, String username, String password, String role) {
        try{
            Session session = sessionFactory.openSession();
            Transaction tx = session.beginTransaction();
            Users user = new Users();
            user.setFullName(fullName);
            user.setEmail(email);
            user.setUsername(username);
            user.setPasswordHash(password);
            user.setRole(role);

            session.save(user);
            tx.commit();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean updateUser(Long id, String fullName, String email, String username, String password, String role) {
        return false;
    }

    @Override
    public boolean deleteUser(Long id) {
        return false;
    }

    @Override
    public Users getUserById(Long id) {
        return null;
    }
}
