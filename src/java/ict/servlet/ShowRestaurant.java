/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.RestaurantBean;
import ict.bean.CommentBean;
import ict.db.CommentDB;
import ict.db.RestaurantDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tung
 */
@WebServlet(urlPatterns = {"/showRestaurant"})
public class ShowRestaurant extends HttpServlet {

    private RestaurantDB db;
    private CommentDB cdb;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("list".equalsIgnoreCase(action)) {            // call the query db to get retrieve for all customer  
            db = new RestaurantDB();
            ArrayList<RestaurantBean> restaurants = db.queryRest(); // set the result into the attribute
            request.setAttribute("restaurants", restaurants); // redirect the result to the listCustomers.jsp
            RequestDispatcher rd;
            rd = getServletContext().getRequestDispatcher("/listRest.jsp");
            rd.forward(request, response);
        } else if ("show".equalsIgnoreCase(action)) {
            String restName = request.getParameter("restName");
            String restID = request.getParameter("restID");
            if (restName != null) {
                db = new RestaurantDB();
                RestaurantBean restaurant = db.queryRestByID(restName);
                request.setAttribute("restaurant", restaurant);
                cdb = new CommentDB();
                ArrayList<CommentBean> comments = cdb.queryComment(restID); // set the result into the attribute
                request.setAttribute("comments", comments); // redirect the result to the listCustomers.jsp
                
                RequestDispatcher rd;
                rd = getServletContext().getRequestDispatcher("/showRestDetail.jsp");
                rd.forward(request, response);
            }
        } else if ("search".equalsIgnoreCase(action)) {
            String restName = request.getParameter("restName");
            if (restName != null) {
                ArrayList<RestaurantBean> restaurants = db.queryRestByName(restName);
                request.setAttribute("restaurants", restaurants); // redirect the result to the listCustomers.jsp

                RequestDispatcher rd;
                rd = getServletContext().getRequestDispatcher("/listRest.jsp");
                rd.forward(request, response);
            }
        } else if ("addComment".equalsIgnoreCase(action)) {
            String restID = request.getParameter("restID");
            String username = request.getParameter("username");
            String restName = request.getParameter("restName");
            String comment = request.getParameter("comment");
            String comment_date = request.getParameter("comment_date");
            String comment_time = request.getParameter("comment_time");
            if (comment != null) {
                cdb = new CommentDB(restID, username, comment, comment_date, comment_time);
                cdb.addRecord();
//                response.sendRedirect("showRestaurant?action=show&restName=" + username + "&restID=" + restID);
                response.sendRedirect("showRestaurant?action=show&restName=" + restName + "&restID=" + restID);
//                response.sendRedirect("welcome.jsp");
            }
        }
    }
}
