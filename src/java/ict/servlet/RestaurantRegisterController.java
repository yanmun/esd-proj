/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.UserBean;
import ict.bean.UserInfo;
import ict.db.MenuDB;
import ict.db.RestaurantDB;
import ict.random.GenerateID;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
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
    private PrintWriter out;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        out = response.getWriter();
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
        String ownerID="";
        if (session.getAttribute("username") != null) {
            ownerID = (String) session.getAttribute("username");
        }
        if(session.getAttribute("userInfo") != null) {
             ownerID = (String) (((UserInfo) session.getAttribute("userInfo")).getUsername());
        }

        String[] r_desc = request.getParameterValues("r_desc");
        String[] r_photo = request.getParameterValues("r_photo");
        for (int i = 0; i < rname.length; i++) {
            String id = "";
            boolean isRepeat = true;
            while (isRepeat) {
                id = GenerateID.genSixDigitID();
                if (new RestaurantDB().findExistID(id)) {
                    isRepeat = true;
                } else {
                    isRepeat = false;
                }
            }
            db = new RestaurantDB(rname[i], getOpenHour(open_time[i], close_time[i], start_day[i], end_day[i]), district[i],
                    address[i], rtype[i], rtel[i], remail[i], "./image/Restaurant/" + r_photo[i], r_desc[i], ownerID, state,
                    id);
            if (db.addRecord()) {
                session = request.getSession(false);
                RequestDispatcher rd;
                if (session.getAttribute("username") != null) {
                    session.removeAttribute("username");
                    session.invalidate();
                    request.setAttribute("msg", "Success registration! Please Login with your new account.  <a href=\"login.jsp\">Login Page</a>");
                    rd = getServletContext().getRequestDispatcher("/index.jsp");
                    rd.forward(request, response);

                } else {

                    request.setAttribute("msg", "Success registration! ");
                    rd = getServletContext().getRequestDispatcher("/index.jsp");
                    rd.forward(request, response);
                }

            } else {
                out.println("hsf");
            }
//                out.println(db.add());
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
