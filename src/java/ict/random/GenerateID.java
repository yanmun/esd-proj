/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.random;

import java.util.Random;

/**
 *
 * @author pearh
 */
public class GenerateID {
    
    public static String genSixDigitID(){
        Random rand = new Random();
        
        int x = rand.nextInt(10); 
        return ""+x;
    }
}
