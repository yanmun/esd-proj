/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
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
         try {
            cnnt = getConnection();
            stmnt = cnnt.createStatement();
            String sql
                    = "CREATE TABLE if not exist `account` (\n" +
"  `username` varchar(15) NOT NULL,\n" +
"  `password` varchar(25) NOT NULL,\n" +
"  `tel` char(8) NOT NULL,\n" +
"  `email` varchar(40) NOT NULL,\n" +
"  `firstName` varchar(15) NOT NULL,\n" +
"  `lastName` varchar(15) NOT NULL,\n" +
"  `accountTypeID` char(4) NOT NULL\n" +
") ENGINE=InnoDB DEFAULT CHARSET=latin1;";
            stmnt.execute(sql);
            stmnt.close();
            cnnt.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        
    }
}
