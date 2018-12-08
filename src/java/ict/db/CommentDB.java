/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import ict.bean.CommentBean;
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
public class CommentDB extends DB {

    private String restID;
    private String username;
    private String comment;
    private String comment_date;
    private String comment_time;

    public CommentDB() {
    }

    public CommentDB(String restID, String username, String comment, String comment_date, String comment_time) {
        this.restID = restID;
        this.username = username;
        this.comment = comment;
        this.comment_date = comment_date;
        this.comment_time = comment_time;
    }

    public boolean addRecord() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT INTO fav_rest VALUES (?,?,?,?,?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, restID);
            pStmnt.setString(2, username);
            pStmnt.setString(3, null);
            pStmnt.setString(4, comment);
            pStmnt.setString(5, comment_date);
            pStmnt.setString(6, comment_time);
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

    public ArrayList queryComment(String restID) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        ArrayList<CommentBean> comments = new ArrayList();
        CommentBean cb = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM FAV_REST WHERE RESTID=? ORDER BY comment_date, comment_time DESC";
            ResultSet re = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, restID);
            re = pStmnt.executeQuery();
            if (re != null) {
                while (re.next()) {
                    cb = new CommentBean();
                    cb.setRestID(re.getString(1));
                    cb.setUsername(re.getString(2));
                    cb.setComment(re.getString(4));
                    cb.setComment_date(re.getString(5));
                    cb.setComment_time(re.getString(6));
                    comments.add(cb);
                }
            } else {
                cb = new CommentBean();
                cb.setMsg();
                comments.add(cb);
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
        return comments;
    }

}
