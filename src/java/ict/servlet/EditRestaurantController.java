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
@WebServlet(name = "EditRestaurantController", urlPatterns = {"/EditRestaurantController"})
public class EditRestaurantController extends HttpServlet {

    private RestaurantDB db;
    private PrintWriter out;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        String state = request.getParameter("status");
        String rname = request.getParameter("rname");
        String open_time = request.getParameter("open_time");
        String close_time = request.getParameter("close_time");
        String start_day = request.getParameter("start_day");
        String end_day = request.getParameter("end_day");
        String district = request.getParameter("district");
        String address = request.getParameter("address");
        String rtype = request.getParameter("rtype");
        String rtel = request.getParameter("rtel");
        String remail = request.getParameter("remail");
        String restid = request.getParameter("id");
        String r_desc = request.getParameter("r_desc");
        String r_photo;
        if (!request.getParameter("r_photo").equals("")) {
            r_photo = "./image/Restaurant/"+request.getParameter("r_photo");
        } else {
            r_photo = request.getParameter("ori");
        }
        db = new RestaurantDB();

        if(db.updateRestaurantInfo(state, rname, open_time, close_time, start_day, end_day, 
                district, address, rtype, rtel, remail, restid, r_desc, r_photo).equals("yes")){
            
        }
//        out.println(db.updateRestaurantInfo(state, rname, open_time, close_time, start_day, end_day, district, address, rtype, rtel, remail, restid, r_desc, r_photo));

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
