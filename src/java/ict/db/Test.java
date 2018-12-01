/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

/**
 *
 * @author pearh
 */
public class Test {
 

    public static void main(String[] arg) {
        AccountDB db = new AccountDB();
        boolean a = db.findExistID("0");
        if (a) {
            System.out.println("Find");
        } else {
            System.out.println("failed");
        }
    
    }

}
