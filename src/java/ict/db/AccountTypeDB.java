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
public class AccountTypeDB extends DB{
    
    
    public void createTable(){
         Statement stmnt = null;
        Connection cnnt = null;
         try {
            cnnt = getConnection();
            stmnt = cnnt.createStatement();
            String sql
                    = "CREATE TABLE `accounttype` (\n" +
"  `accountTypeID` char(4) NOT NULL,\n" +
"  `accountType` varchar(20) NOT NULL\n" +
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
