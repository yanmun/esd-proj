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
        
        String rand_num = "";
        for(int i=1;i<=6;i++){
            int x = rand.nextInt(10); 
            rand_num +=x;
        }
        
        return rand_num;
    }
    
    
}
