/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author pearh
 */
public class AccountTypeDB extends DB {
    private String accountID;
    private String type;
    
    
    public AccountTypeDB(String id, String type){
        this.accountID = id;
        this.type = type;
    }

    public void createTable() {
        Statement stmnt = null;
        Connection cnnt = null;
        try {
            cnnt = getConnection();
            stmnt = cnnt.createStatement();
            String sql
                    = "CREATE TABLE `accounttype` (\n"
                    + "  `accountTypeID` char(4) NOT NULL,\n"
                    + "  `accountType` varchar(20) NOT NULL\n"
                    + ") ENGINE=InnoDB DEFAULT CHARSET=latin1;";
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

    @Override
    public boolean addRecord() {
         Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT INTO accounttype VALUES (?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, accountID);
            pStmnt.setString(2, type);
         
            int rowCount = pStmnt.executeUpdate();
            if (rowCount >= 1) {
                isSuccess = true;
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return isSuccess;
    }
    
   
    
    
  

}
