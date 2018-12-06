/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.db.RestaurantDB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author pearh
 */
@WebServlet(name = "RestaurantRegisterController", urlPatterns = {"/RestaurantRegisterController"})
public class RestaurantRegisterController extends HttpServlet {

    private RestaurantDB db;
 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        String state = request.getParameter("state");
        String [] rname = request.getParameterValues("rname");
        String [] open_time = request.getParameterValues("open_time");
        String [] close_time = request.getParameterValues("close_time");
        String [] start_day = request.getParameterValues("start_day");
        String [] end_day = request.getParameterValues("end_day");
        String [] district = request.getParameterValues("district");
        String [] address =  request.getParameterValues("address");
        String [] rtel = request.getParameterValues("rtel");
        String [] remail = request.getParameterValues("remail");
        String [] r_desc = request.getParameterValues("r_desc");
        String [] r_photo = request.getParameterValues("r_photo");
                  
//        db= RestaurantDB();
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
