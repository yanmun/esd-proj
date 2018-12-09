/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import ict.bean.RestaurantBean;
import ict.random.GenerateID;
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
    private String ownid;
    private String state;
    private String open_time;
    private String closeTime;
    private String start_day;
    private String end_day;

    public RestaurantDB(String rname, String district, String address,
            String rtype, String rtel, String remail, String pic_path, String desc, String ownid, String state,
            String restID, String open_time, String closeTime, String start_day, String end_day) {
        super();
        this.rname = rname;
        this.hr = hr;
        this.district = district;
        this.address = address;
        this.rtype = rtype;
        this.rtel = rtel;
        this.remail = remail;
        this.views = 0;
        this.ownid = ownid;
        this.state = state;
        this.pic_path = pic_path;
        this.desc = desc;
        this.restID = restID;
        this.open_time = open_time;
        this.closeTime = closeTime;
        this.start_day = start_day;
        this.end_day = end_day;

    }

    public RestaurantDB() {

    }

    public boolean addRecord() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT INTO restaurant VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, restID);
            pStmnt.setString(2, rname);
            pStmnt.setString(3, rtype);
            pStmnt.setString(4, rtel);
            pStmnt.setString(5, remail);
            pStmnt.setString(6, district);
            pStmnt.setString(7, address);
            pStmnt.setString(8, ownid);
            pStmnt.setString(9, state);
            pStmnt.setString(10, pic_path);
            pStmnt.setString(11, desc);
            pStmnt.setString(12, open_time);
            pStmnt.setString(13, closeTime);
            pStmnt.setString(14, start_day);
            pStmnt.setString(15, end_day);
            pStmnt.setInt(16, views);
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

//    public String add(){
//         Connection cnnct = null;
//        PreparedStatement pStmnt = null;
//        String msg ="";
//        try {
//            cnnct = getConnection();
//            String preQueryStatement = "INSERT INTO restaurant VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
//            pStmnt = cnnct.prepareStatement(preQueryStatement);
//            pStmnt.setString(1, GenerateID.genSixDigitID());
//            pStmnt.setString(2, rname);
//            pStmnt.setString(3, rtype);
//            pStmnt.setString(4, rtel);
//            pStmnt.setString(5, remail);
//            pStmnt.setString(6, district);
//            pStmnt.setString(7, address);
//            pStmnt.setString(8, ownid);
//            pStmnt.setString(9, state);
//            pStmnt.setString(10, pic_path);
//            pStmnt.setString(11, desc);
//            pStmnt.setString(12, hr);
//            pStmnt.setInt(13, views);
//            int rowCount = pStmnt.executeUpdate();
//            if (rowCount >= 1) {
//                msg = "yes";
//            }
//            pStmnt.close();
//            cnnct.close();
//        } catch (SQLException ex) {
//            while (ex != null) {
//                msg+=ex.toString();
//               ex.printStackTrace();
//                ex = ex.getNextException();
//            }
//        } catch (IOException ex) {
//            ex.printStackTrace();
//        } catch (ClassNotFoundException ex) {
//            ex.printStackTrace();
//        }
//        return msg;
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

//    public boolean isValidUser(String username, String pd) {
//        Connection cnnct = null;
//        PreparedStatement pStmnt = null;
//        boolean isFound = false;
//        try {
//            cnnct = getConnection();
//            String preQueryStatement = "SELECT * FROM account WHERE username=? and password=?";
//            ResultSet re = null;
//            pStmnt = cnnct.prepareStatement(preQueryStatement);
//            pStmnt.setString(1, username);
//            pStmnt.setString(2, pd);
//            re = pStmnt.executeQuery();
//            if (re.next()) {
//                isFound = true;
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
//        return isFound;
//    }
    public ArrayList queryRest() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        ArrayList<RestaurantBean> restaurants = new ArrayList();
        RestaurantBean rb = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM RESTAURANT ORDER BY RESTNAME";
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
//                rb.setOpen_hrs(re.getString(12));
//                rb.setNum_view(re.getString(13));
                rb.setStart_hour(re.getString(12));
                rb.setEnd_hour(re.getString(13));
                rb.setStart_day(re.getString(14));
                rb.setEnd_day(re.getString(15));
                rb.setNum_view(re.getString(16));
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

    public ArrayList queryRestByName(String restName) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        ArrayList<RestaurantBean> restaurants = new ArrayList();
        RestaurantBean rb = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM RESTAURANT WHERE RESTNAME=?";
            ResultSet re = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, restName);
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
//                rb.setOpen_hrs(re.getString(12));
//                rb.setNum_view(re.getString(13));

                rb.setStart_hour(re.getString(12));
                rb.setEnd_hour(re.getString(13));
                rb.setStart_day(re.getString(14));
                rb.setEnd_day(re.getString(15));
                rb.setNum_view(re.getString(16));
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

    public RestaurantBean queryRestByID(String restname) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;

        RestaurantBean rb = null;
        try {
            cnnct = getConnection();
            updateView(restname);
            String preQueryStatement = "SELECT * FROM restaurant WHERE restname=?";
            ResultSet re = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, restname);
            re = pStmnt.executeQuery();
            if (re.next()) {
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
//                rb.setOpen_hrs(re.getString(12));
//                rb.setNum_view(re.getString(13));
                rb.setStart_hour(re.getString(12));
                rb.setEnd_hour(re.getString(13));
                rb.setStart_day(re.getString(14));
                rb.setEnd_day(re.getString(15));
                rb.setNum_view(re.getString(16));
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
        return rb;
    }

    public boolean updateView(String restname) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        int view;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            RestaurantDB db = new RestaurantDB();
            view = db.getView(restname);
            String preQueryStatement = "UPDATE RESTAURANT SET num_view=?  WHERE restname=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, Integer.toString(view + 1));
            pStmnt.setString(2, restname);
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

    public int getView(String restname) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        int view = 0;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT num_view FROM restaurant WHERE restname=?";
            ResultSet re = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, restname);
            re = pStmnt.executeQuery();
            while (re.next()) {
                view = Integer.parseInt(re.getString(1));
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
        return view;
    }

    public ArrayList<RestaurantBean> queryByUsername(String username) {
        ArrayList<RestaurantBean> rests = new ArrayList<RestaurantBean>();
        Connection cnnct = null;
        PreparedStatement pStmnt = null;

        RestaurantBean rb = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM RESTAURANT WHERE ownerID=?";
            ResultSet re = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, username);
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
//                rb.setOpen_hrs(re.getString(12));
//                rb.setNum_view(re.getString(13));
                rb.setStart_hour(re.getString(12));
                rb.setEnd_hour(re.getString(13));
                rb.setStart_day(re.getString(14));
                rb.setEnd_day(re.getString(15));
                rb.setNum_view(re.getString(16));
                rests.add(rb);
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
        return rests;
    }

    public RestaurantBean queryRestByRestID(String restid) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;

        RestaurantBean rb = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM restaurant WHERE restID=?";
            ResultSet re = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, restid);
            re = pStmnt.executeQuery();
            if (re.next()) {
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
//                rb.setOpen_hrs(re.getString(12));
//                rb.setNum_view(re.getString(13));
                rb.setStart_hour(re.getString(12));
                rb.setEnd_hour(re.getString(13));
                rb.setStart_day(re.getString(14));
                rb.setEnd_day(re.getString(15));
                rb.setNum_view(re.getString(16));
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
        return rb;
    }

    public boolean updateLike(String restname) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        int like;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            RestaurantDB db = new RestaurantDB();
            like = db.getLike(restname);
            String preQueryStatement = "UPDATE RESTAURANT SET num_like=?  WHERE restname=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, Integer.toString(like + 1));
            pStmnt.setString(2, restname);
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

    public int getLike(String restname) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        int like = 0;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT num_like FROM restaurant WHERE restname=?";
            ResultSet re = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, restname);
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

}
