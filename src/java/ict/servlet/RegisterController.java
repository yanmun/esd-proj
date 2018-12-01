/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.db.AccountDB;
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
@WebServlet(name = "RegisterController", urlPatterns = {"/RegisterController"})
public class RegisterController extends HttpServlet {

    private AccountDB db;
    private PrintWriter out;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet RegisterController</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//        String fname = request.getParameter("fname");
//        String lname = request.getParameter("lname");
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//        String tel = request.getParameter("tel");
//        String email = request.getParameter("email");
//        String type = request.getParameter("userType");
//        db.findExistID(username);
//        db = new AccountDB(fname, lname, username, password, tel, email, type);
//        db.addRecord();

        db = new AccountDB();
        String username = request.getParameter("username");
        boolean alreadyExist = db.findExistID(username);
        if (alreadyExist) {
            out = response.getWriter();
            response.setContentType("text/html;charset=UTF-8");
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>The username is already used, please enter other username.</h1>");
            out.println("<a href='register.jsp'>Enter again</a>");
            out.println("</body>");
            out.println("</html>");
        } else {
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String password = request.getParameter("password");
            String tel = request.getParameter("tel");
            String email = request.getParameter("email");
            String type = request.getParameter("userType");
            db = new AccountDB(fname, lname, username, password, tel, email, type);
            db.addRecord();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
//            if(accountDb.findExistID())
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
