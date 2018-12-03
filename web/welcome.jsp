<%-- 
    Document   : welcome
    Created on : 2018年12月2日, 上午03:08:16
    Author     : Tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ict.bean.*, java.util.*, ict.db.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
        <style type="text/css">
            <jsp:include page="css/style.css" />
        </style>
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp" />
            <jsp:include page="sidebar.jsp" />
            <div class="content">
                <jsp:useBean id="userInfo" class="ict.bean.UserInfo" scope="session"/>
                <b>Hello, <jsp:getProperty name="userInfo" property="username" /></b>
                <%
                    String name = userInfo.getUsername();
                    AccountDB db = new AccountDB();
                    UserBean u = db.queryUserByID(name);
                    
                    out.println("<h1>Customers</h1>");
                    out.println("<table border='1'>");
                    out.println("<tr>");
                    out.println("<th>username</th><th>password</th><th>tel</th><th>email</th><th>first name</th><th>last name</th>");
                    out.println("</tr>");   // loop through the customer array to display each customer record  
                        out.println("<tr>");
                        out.println("<td>" + u.getUsername() + "</td>");
                        out.println("<td>" + u.getPassword() + "</td>");
                        out.println("<td>" + u.getTel() + "</td>");
                        out.println("<td>" + u.getEmail() + "</td>");
                        out.println("<td>" + u.getFname() + "</td>");
                        out.println("<td>" + u.getLname() + "</td>");
                        out.println("<td><a href=\"handleEdit?action=getEditCustomer&username=" + u.getUsername() + "\">Edit</a></td>");
                        out.println("</tr>");
                        out.println("</table>");
                %>
            </div>
            <jsp:include page = "footer.jsp" />
        </div>
    </body>
</html>
