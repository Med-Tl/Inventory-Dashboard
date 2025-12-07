package com.example.utils;

import org.mindrot.jbcrypt.BCrypt;

public class GenerateBCrypt {
    public static void main(String[] args) {
        String password = "admin123"; // your desired password
        String hash = BCrypt.hashpw(password, BCrypt.gensalt());
        System.out.println(hash);
    }
}
