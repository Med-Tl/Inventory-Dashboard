package com.example.utils;

import org.mindrot.jbcrypt.BCrypt;

public class GenerateBCrypt {
    public static void main(String[] args) {
        String password = "medtl11"; // your desired password
        String hash = BCrypt.hashpw(password, BCrypt.gensalt());
        System.out.println(hash);
    }
}
