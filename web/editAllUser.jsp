<%-- 
    Document   : adminHome
    Created on : 2018年12月4日, 上午12:17:04
    Author     : Tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ict.bean.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All User</title>
        <style type="text/css">
            <jsp:include page="css/style.css" />
        </style>
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp" />
            <jsp:include page="sidebar.jsp" />
            <div class="content">
                <% ArrayList<UserBean> users = (ArrayList<UserBean>) request.getAttribute("user");
                    out.println("<h1>All User</h1>");
                    out.println("<table border='1'>");
                    out.println("<tr>");
                    out.println("<th>username</th><th>password</th><th>tel</th><th>email</th><th>first name</th><th>last name</th>");
                    out.println("</tr>");   // loop through the customer array to display each customer record  
                    for (int i = 0; i < users.size(); i++) {
                        UserBean u = users.get(i);
                        out.println("<tr>");
                        out.println("<td>" + u.getUsername() + "</td>");
                        out.println("<td>" + u.getPassword() + "</td>");
                        out.println("<td>" + u.getTel() + "</td>");
                        out.println("<td>" + u.getEmail() + "</td>");
                        out.println("<td>" + u.getFname() + "</td>");
                        out.println("<td>" + u.getLname() + "</td>");
                        out.println("<td><a href=\"handleCustomer?action=getEditCustomer&username=" + u.getUsername() + "\">Edit</a></td>");
                        out.println("<td><a href=\"handleCustomer?action=delete&username=" + u.getUsername() + "\">Delete</a></td>");
                        out.println("</tr>");
                    }
                    out.println("</table>");
                %>
            </div>
            <jsp:include page = "footer.jsp" />
        </div>
    </body>
</html>
