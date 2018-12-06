/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import ict.bean.RestaurantBean;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Tung
 */
public class RestaurantDB extends DB {
    private String rname;
    private String hr;
    private String district;
    private String address;
    private String rtype;
    private String rtel;
    private String remail;
    private String restID;
    private String pic_path;
    private String desc;
    private int views;
       
    

    public RestaurantDB(String rname, String hr, String district, String address, 
            String rtype, String rtel, String remail, String pic_path, String desc) {
        super();
        this.rname = rname;
        this.hr = hr;
        this.district = district;
        this.address = address;
        this.rtype = rtype;
        this.rtel = rtel;
        this.remail = remail;
        this.views = 0;
        
        
          

    }

    public RestaurantDB() {

    }
    
    public boolean addRecord() {
        return false;
    }

//    public boolean addRecord() {
//        Connection cnnct = null;
//        PreparedStatement pStmnt = null;
//        boolean isSuccess = false;
//        try {
//            cnnct = getConnection();
//            String preQueryStatement = "INSERT INTO restaurant VALUES (?,?,?,?,?,?,?)";
//            pStmnt = cnnct.prepareStatement(preQueryStatement);
//            pStmnt.setString(1, rname);
//            pStmnt.setString(2, hr);
//            pStmnt.setString(3, district);
//            pStmnt.setString(4, email);
//            pStmnt.setString(5, fname);
//            pStmnt.setString(6, lname);
//            pStmnt.setString(7, type);
//            int rowCount = pStmnt.executeUpdate();
//            if (rowCount >= 1) {
//                isSuccess = true;
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
//        return isSuccess;
//    }

    public boolean findExistID(String username) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isFound = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM account WHERE username=?";
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
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return isFound;
    }
    public boolean isValidUser(String username, String pd) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isFound = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM account WHERE username=? and password=?";
            ResultSet re = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, username);
            pStmnt.setString(2, pd);
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
    
    public ArrayList queryRest() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        ArrayList<RestaurantBean> restaurants = new ArrayList();
        RestaurantBean rb = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM RESTAURANT";
            ResultSet re = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            re = pStmnt.executeQuery();
            while (re.next()) {
                rb = new RestaurantBean();
                rb.setRestID(re.getString(1));
                rb.setRestName(re.getString(2));
                rb.setRestTypeID(re.getString(3));
                rb.setRestTel(re.getString(4));
                rb.setRestEmail(re.getString(5));
                rb.setDistrict(re.getString(6));
                rb.setAddress(re.getString(7));
                rb.setOwnerID(re.getString(8));
                rb.setStatus(re.getString(9));
                rb.setRest_pic(re.getString(10));
                rb.setRest_desc(re.getString(11));
                rb.setOpen_hrs(re.getString(12));
                rb.setNum_view(re.getString(13));
                restaurants.add(rb);
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
        return restaurants;
    }
}
