package com.mini_zira.utility.Auth;


import org.mindrot.jbcrypt.BCrypt;

public class Password {

    public static String HashPassword(String password){
        return BCrypt.hashpw(password, BCrypt.gensalt(12));
    }

    public static boolean comparePassword(String password, String hashedPassword){
        return BCrypt.checkpw(password, hashedPassword);
    }
}
