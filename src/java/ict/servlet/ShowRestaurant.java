/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.RestaurantBean;
import ict.bean.UserBean;
import ict.db.AccountDB;
import ict.db.RestaurantDB;
import java.io.IOException;
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
        }
    }
    
}
