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
        String url = "jdbc:mysql://localhost:3306/ITP4511_DB";
        String username = "root";
        String password = "";
        AccountDB custDb = new AccountDB("ko", "Chan", "hll87878", "9324923", "23989222", "hlllily@yahoo.com.hk", "0001");
        boolean isAdded = custDb.addRecord();
        if (isAdded) {
            System.out.println("Peter is added");
        } else {
            System.out.println("Added failed");
        }
    
    }

}
