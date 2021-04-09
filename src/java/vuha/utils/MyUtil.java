/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuha.utils;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author Admin
 */
public class MyUtil {
    public static String getSHA(String input) throws NoSuchAlgorithmException{
        String result="";
        MessageDigest md= MessageDigest.getInstance("SHA-256");
        byte[] hash=md.digest(input.getBytes(StandardCharsets.UTF_8));
        BigInteger number = new BigInteger(1, hash);
        StringBuilder hexString = new StringBuilder(number.toString(16));
        while (hexString.length() < 32)  
        {  
            hexString.insert(0, '0');  
        }
        result=hexString.toString();
        return result;
    }
}
