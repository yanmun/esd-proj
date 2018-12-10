/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import ict.bean.KeywordBean;
import ict.bean.RestaurantBean;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author pearh
 */
public class KeywordDB extends DB{

    private String time;
    private String keyword;
    private int count; 
    
    
    public KeywordDB(String keyword){
        this.time = ""+System.currentTimeMillis();
        this.keyword = keyword;
        count = 1;
    }
    
    public KeywordDB(){
        
    }
    @Override
    public boolean addRecord() {
        
      
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT INTO search_history VALUES (?,?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, time);
            pStmnt.setString(2, keyword);
            pStmnt.setInt(3, count);
         
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
    
    public boolean queryByKeyword(String kw){
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isFound = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM search_history WHERE keyword=?";
            ResultSet re = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, kw);
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
    
    public boolean updateView() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        int c = getCount()+1;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            RestaurantDB db = new RestaurantDB();
         
            String preQueryStatement = "UPDATE search_history SET count=?, time=?  WHERE keyword=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(2, time);
            pStmnt.setInt(1, c);
            pStmnt.setString(3, keyword);
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
    
   
    
     public int getCount() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        int like = 2;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT count FROM search_history WHERE keyword=?";
            ResultSet re = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, keyword);
            re = pStmnt.executeQuery();
            while (re.next()) {
                like = Integer.parseInt(re.getString(1));
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
        return like;
    }
    
     
    public boolean queryAllRecord(){
          Connection cnnct = null;
        PreparedStatement pStmnt = null;
         boolean success = false;
        
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM search_history;";
            ResultSet re = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
          
            re = pStmnt.executeQuery();
            if (re.next()) {
                success = true;
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
        return success;
     }
    
     public ArrayList<KeywordBean> queryByOrderedKw() {
       ArrayList<KeywordBean> kw = new ArrayList();
        Connection cnnct = null;
        PreparedStatement pStmnt = null;

        KeywordBean rb = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM search_history order by count desc";
            ResultSet re = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
//            pStmnt.setString(1, username);
            re = pStmnt.executeQuery();
            while (re.next()) {
                rb = new KeywordBean();
                rb.setTime(re.getString(1));
                rb.setKeyword(re.getString(2));
                rb.setCount(Integer.parseInt(re.getString(3)));
                kw.add(rb);
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
        return kw;
    }
    
}
