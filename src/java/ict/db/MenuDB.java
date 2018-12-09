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

/**
 *
 * @author pearh
 */
public class MenuDB extends DB {

    private String id;
    private String path;
    private String restID;
    private String status;
    private String type;
    private String menu_desc;

    public MenuDB(String id, String path, String restID, String status, 
            String type, String menu_desc) {
        this.id = id;
        this.path = path;
        this.restID = restID;
        this.status = status;
        this.type = type;
        this.menu_desc = menu_desc;
    }
    
    public MenuDB(){
        
    }

    @Override
    public boolean addRecord() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT INTO menu VALUES (?,?,?,?,?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, id);
            pStmnt.setString(2, path);
            pStmnt.setString(3, restID);
            pStmnt.setString(4, status);
            pStmnt.setString(5, type);
            pStmnt.setString(6, menu_desc);
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
    
    public String add(){
         Connection cnnct = null;
        PreparedStatement pStmnt = null;
        String msg ="";
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT INTO menu VALUES (?,?,?,?,?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, id);
            pStmnt.setString(2, path);
            pStmnt.setString(3, restID);
            pStmnt.setString(4, status);
            pStmnt.setString(5, type);
            pStmnt.setString(6, menu_desc);
            int rowCount = pStmnt.executeUpdate();
            if (rowCount >= 1) {
                msg = "yes";
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                msg+=ex.toString();
               ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return msg;
    }
    
    public boolean findExistID(String id){
       
       Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isFound = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM menu WHERE menuid=?";
            ResultSet re = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, id);
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
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return isFound;
    }
    
    public boolean queryByRestID(String id){
       
       Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isFound = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM menu WHERE restID=?";
            ResultSet re = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, id);
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
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return isFound;
    }
    

}
