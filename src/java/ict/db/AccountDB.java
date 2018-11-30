/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import java.sql.Connection;
import java.sql.Statement;

/**
 *
 * @author pearh
 */
public class AccountDB extends DB{
    
    public AccountDB(String url, String username, String password) {
        super(url, username, password);
    }
    
    public void createTable(){
         Statement stmnt = null;
        Connection cnnt = null;
        
        
    }
}
