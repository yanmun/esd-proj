/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

    public AccountTypeDB() {
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
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return isSuccess;
    }
    
    public String getType(String id) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        String type = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT accountType FROM ACCOUNTTYPEDB WHERE accountTypeID=?";
            ResultSet re = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, id);
            re = pStmnt.executeQuery();
            while (re.next()) {
                type = re.getString(1);
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
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return type;
    }
}
