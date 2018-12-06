/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.UserBean;
import ict.db.RestaurantDB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
        HttpSession session = request.getSession(true);
        String action = request.getParameter("action");
        String state = request.getParameter("state");
        String[] rname = request.getParameterValues("rname");
        String[] open_time = request.getParameterValues("open_time");
        String[] close_time = request.getParameterValues("close_time");
        String[] start_day = request.getParameterValues("start_day");
        String[] end_day = request.getParameterValues("end_day");
        String[] district = request.getParameterValues("district");
        String[] address = request.getParameterValues("address");
        String[] rtype = request.getParameterValues("rtype");
        String[] rtel = request.getParameterValues("rtel");
        String[] remail = request.getParameterValues("remail");
        UserBean ub = (UserBean) session.getAttribute("userInfo");

        String[] r_desc = request.getParameterValues("r_desc");
        String[] r_photo = request.getParameterValues("r_photo");
        for (int i = 0; i < rname.length; i++) {
            db = new RestaurantDB(rname[i], getOpenHour(open_time[i], close_time[i], start_day[i], end_day[i]), district[i],
                    address[i], rtype[i], rtel[i], remail[i], r_photo[i], r_desc[i]);

        }
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

    private String getOpenHour(String opentime, String closetime, String start_day, String end_day) {
        return opentime + " - " + closetime + " (" + start_day + " to " + end_day + ")";
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
