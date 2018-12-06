/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.db.AccountDB;
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
@WebServlet(name = "RegisterController", urlPatterns = {"/RegisterController"})
public class RegisterController extends HttpServlet {

    private AccountDB db;
    private PrintWriter out;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        db = new AccountDB();
        String action = request.getParameter("action");
        if ("userRegister".equals(action)) {
            String username = request.getParameter("username");
            String type = request.getParameter("userType");
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
            } else if ("0001".equals(type)) {
                String fname = request.getParameter("fname");
                String lname = request.getParameter("lname");
                String password = request.getParameter("password");
                String tel = request.getParameter("tel");
                String email = request.getParameter("email");
                db = new AccountDB(fname, lname, username, password, tel, email, type);
                db.addRecord();
                request.setAttribute("msg", "Please Login with your new account.  <a href=\"login.jsp\">Login Page</a>"); // redirect the result to the listCustomers.jsp
                RequestDispatcher rd;
                rd = getServletContext().getRequestDispatcher("/index.jsp");
                rd.forward(request, response);
            } else if ("0002".equals(type)) {
                
                String fname = request.getParameter("fname");
                String lname = request.getParameter("lname");
                String password = request.getParameter("password");
                String tel = request.getParameter("tel");
                String email = request.getParameter("email");
                db = new AccountDB(fname, lname, username, password, tel, email, type);
                db.addRecord();
                HttpSession session = request.getSession(true);
                session.setAttribute("username", username);
                request.setAttribute("username", username); // redirect the result to the listCustomers.jsp
                RequestDispatcher rd;
                rd = getServletContext().getRequestDispatcher("/restRegister.jsp");
                rd.forward(request, response);
            }
        } else if ("restRegister".equals(action)) {
            
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
