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
public class AccountDB extends DB{
    
    private String fname;
    private String lname;
    private String username;
    private String password;
    private String tel;
    private String email; 
    private String type;
    
    public AccountDB(String fname, String lname, String username, String password, String tel, String email, String type) {
        super();
        this.fname = fname;
        this.lname = lname;
        this.username = username;
        this.password = password;
        this.tel = tel;
        this.email = email;
        this.type = type;        
        
    }
    
    public AccountDB(){
   
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
    
    public boolean addRecord() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT INTO account VALUES (?,?,?,?,?,?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, username);
            pStmnt.setString(2, password);
            pStmnt.setString(3, tel);
            pStmnt.setString(4, email);
            pStmnt.setString(5, fname);
            pStmnt.setString(6, lname);
            pStmnt.setString(7, type);
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
    
    
    public boolean findExistID(String username){
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isFound = false;
                try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM account WHERE CUSTID=?";
            ResultSet re = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, username);
            re = pStmnt.executeQuery();
            if (re.next()) {
                isFound = true;
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
        
        return isFound;
        
    }
    
    //    public CustomerBean queryCustByID(String id) {
//        Connection cnnct = null;
//        PreparedStatement pStmnt = null;
//
//        CustomerBean cb = null;
//        try {
//            cnnct = getConnection();
//            String preQueryStatement = "SELECT * FROM CUSTOMER WHERE CUSTID=?";
//            ResultSet re = null;
//            pStmnt = cnnct.prepareStatement(preQueryStatement);
//            pStmnt.setString(1, id);
//            re = pStmnt.executeQuery();
//            if (re.next()) {
//                cb = new CustomerBean();
//                cb.setId(re.getString(1));
//                cb.setName(re.getString(2));
//                cb.setTel(re.getString(3));
//                cb.setAge(re.getInt(4));
//            }
//            pStmnt.close();
//            cnnct.close();
//        } catch (SQLException ex) {
//            while (ex != null) {
//                ex.printStackTrace();
//                ex = ex.getNextException();
//            }
//        } catch (IOException ex) {
//            ex.printStackTrace();
//        } catch (ClassNotFoundException ex) {
//            ex.printStackTrace();
//        }
//        return cb;
//    }
}
