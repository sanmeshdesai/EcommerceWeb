/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ecom.helper;

/**
 *
 * @author sanmesh
 */
public class Helper {
    
    public static String getWords(String desc) {
        String[] str = desc.split(" ");
        if(str.length > 10) {
            String res ="";
            for(int i = 0; i < 10; i++) {
                res = res + str[i]+" ";
            }
            return res +" ...";
        } else {
            return desc +" ...";
        }
    }
    
}
