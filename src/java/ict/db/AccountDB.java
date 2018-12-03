/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import ict.bean.UserBean;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author pearh
 */
public class AccountDB extends DB {

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

    public AccountDB() {

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
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return isSuccess;
    }

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

    public UserBean queryUserByID(String username) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;

        UserBean ub = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM account WHERE username=?";
            ResultSet re = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, username);
            re = pStmnt.executeQuery();
            if (re.next()) {
                ub = new UserBean();
                ub.setUsername(re.getString(1));
                ub.setPassword(re.getString(2));
                ub.setTel(re.getString(3));
                ub.setEmail(re.getString(4));
                ub.setFname(re.getString(5));
                ub.setLname(re.getString(6));
                ub.setType(re.getString(7));
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
        return ub;
    }

    public ArrayList queryCustByName(String name) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        ArrayList<UserBean> users = new ArrayList();
        UserBean ub = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM ACCOUNT WHERE USERNAME=?";
            ResultSet re = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, name);
            re = pStmnt.executeQuery();
            while (re.next()) {
                ub = new UserBean();
                ub.setUsername(re.getString(1));
                ub.setPassword(re.getString(2));
                ub.setTel(re.getString(3));
                ub.setEmail(re.getString(4));
                ub.setFname(re.getString(5));
                ub.setLname(re.getString(6));
                ub.setType(re.getString(7));
                users.add(ub);
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
        return users;
    }

    public boolean delRecord(String username) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "DELETE FROM ACCOUNT WHERE USERNAME=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, username);
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

    public boolean editRecord(UserBean ub) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "UPDATE ACCOUNT SET password=?,tel=?,email=?,firstName=?,lastName=?  WHERE username=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, ub.getPassword());
            pStmnt.setString(2, ub.getTel());
            pStmnt.setString(3, ub.getEmail());
            pStmnt.setString(4, ub.getFname());
            pStmnt.setString(5, ub.getLname());
            pStmnt.setString(6, ub.getUsername());
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

    public ArrayList queryCust() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        ArrayList<UserBean> users = new ArrayList();
        UserBean ub = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM ACCOUNT WHERE accountTypeID!='0003'";
            ResultSet re = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            re = pStmnt.executeQuery();
            while (re.next()) {
                ub = new UserBean();
                ub.setUsername(re.getString(1));
                ub.setPassword(re.getString(2));
                ub.setTel(re.getString(3));
                ub.setEmail(re.getString(4));
                ub.setFname(re.getString(5));
                ub.setLname(re.getString(6));
                ub.setType(re.getString(7));
                users.add(ub);
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
        return users;
    }

    public ArrayList getAllID() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
     //   ArrayList<UserBean> users = new ArrayList();
        ArrayList <String> user_ids = new ArrayList();
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT username FROM ACCOUNT";
            ResultSet re = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            re = pStmnt.executeQuery();
            while (re.next()) {
//                ub = new UserBean();
                user_ids.add(re.getString(1));
             
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
        return user_ids;
    }
}
