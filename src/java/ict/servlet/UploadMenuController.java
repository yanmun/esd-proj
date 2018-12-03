/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.db.MenuDB;
import ict.random.GenerateID;
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
@WebServlet(name = "UploadMenuController", urlPatterns = {"/UploadMenuController"})
public class UploadMenuController extends HttpServlet {

    private MenuDB db;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UploadMenuController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UploadMenuController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        PrintWriter out = response.getWriter();
        String[] pics = request.getParameterValues("menu_photo");
        String status = request.getParameter("status");
        String restID = "700001";
        for (int i = 0; i < pics.length; i++) {
            String path = "./image/" + pics[i];
            String id = "";
            boolean isRepeat = true;
            while(isRepeat){
                id = GenerateID.genSixDigitID();
                if(new MenuDB().findExistID(id)){
                    isRepeat = true;
                }else{
                    isRepeat= false;
                }
            }
            
            db = new MenuDB(id, path, restID, status);
            if (db.addRecord()) {
                out.println("yes");
            } else {
                out.println(path);

            }

        }

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
