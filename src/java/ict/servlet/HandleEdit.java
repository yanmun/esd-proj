/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.UserBean;
import ict.db.AccountDB;
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
@WebServlet(urlPatterns = {"/handleEdit"})
public class HandleEdit extends HttpServlet {

    private AccountDB db;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("getEditCustomer".equalsIgnoreCase(action)) {
            String username = request.getParameter("username");
            if (username != null) {
                db = new AccountDB();
                UserBean user = db.queryUserByID(username);
                request.setAttribute("u", user);
                RequestDispatcher rd;
                rd = getServletContext().getRequestDispatcher("/editUser.jsp");
                rd.forward(request, response);
            } else if ("edit".equalsIgnoreCase(action)) {
                username = request.getParameter("username");
                String pd = request.getParameter("password");
                String tel = request.getParameter("tel");
                String email = request.getParameter("email");
                String fname = request.getParameter("fname");
                String lname = request.getParameter("lname");
                UserBean user = new UserBean();
                user.setUsername(username);
                user.setPassword(pd);
                user.setTel(tel);
                user.setEmail(email);
                user.setFname(fname);
                user.setLname(lname);
                if (username != null) {
                    db = new AccountDB();
                    db.editRecord(user);
                    response.sendRedirect("welcome.jsp");
                }
            }
        }
    }
}
