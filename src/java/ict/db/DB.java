/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author pearh
 */
public abstract class DB {
    
      String url;
     String username ;
    String password;
    
    public DB(){
        url =  "jdbc:mysql://localhost:3306/cms";
        username = "root";
        password= "";
            
    }
    
     public Connection getConnection() throws SQLException, IOException, ClassNotFoundException {
        Class.forName( "com.mysql.jdbc.Driver");
        return DriverManager.getConnection(url, username, password);
    }    
    
    public abstract boolean addRecord();
    
   
    
}
