/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import ict.bean.MenuBean;
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

    public MenuDB() {

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

    public String add() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        String msg = "";
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
                msg += ex.toString();
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

    public boolean findExistID(String id) {

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

    public ArrayList<MenuBean> queryByRestID(String id) {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isFound = false;
        ArrayList<MenuBean> menus = new ArrayList();
        MenuBean rb = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM menu WHERE restID=?";
            ResultSet re = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, id);
            re = pStmnt.executeQuery();
            while (re.next()) {
                rb = new MenuBean();
                rb.setID(re.getString(1));
                rb.setPath(re.getString(2));
                rb.setRestID(re.getString(3));
                rb.setStatus(re.getString(4));
                rb.setStatus(re.getString(5));
               rb.setType(re.getString(6));
//                rb.setOpen_hrs(re.getString(12));
//                rb.setNum_view(re.getString(13));
                menus.add(rb);
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
        return menus;
    }
    
    
    public String deleteRestaurantInfo(String id) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        String msg ="";
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            RestaurantDB db = new RestaurantDB();

            String preQueryStatement = "delete from menu WHERE menuid=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, id);
         
            int rowCount = pStmnt.executeUpdate();
            if (rowCount >= 1) {
                isSuccess = true;
                msg="Yes";
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
                msg+= ex.toString();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return msg;
    }

}
