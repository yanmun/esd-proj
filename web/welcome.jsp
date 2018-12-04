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
                <p><b>Hello, <jsp:getProperty name="userInfo" property="username" /></b></p>
                <%
                    String name = userInfo.getUsername();
                    AccountDB db = new AccountDB();
                    UserBean u = db.queryUserByID(name);
                    out.println("<hr>");
                    out.println("<p><b>User Profile</b></p>");
                    out.println("<table border='0'>");
                    out.println("<tr>");
                    out.println("<td><p align='left'>Username: </p></td>");
                    out.println("<td><p>" + u.getUsername() + "</p></td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td><p align='left'>Password: </p></td>");
                    out.println("<td><p>" + u.getPassword() + "</p></td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td><p align='left'>Telephone: </p></td>");
                    out.println("<td><p>" + u.getTel() + "</p></td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td><p align='left'>Email: </p></td>");
                    out.println("<td><p>" + u.getEmail() + "</p></td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td><p align='left'>First Name: </p></td>");
                    out.println("<td><p>" + u.getFname() + "</p></td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td><p align='left'>Last Name: </p></td>");
                    out.println("<td><p>" + u.getLname() + "</p></td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    String id = u.getType();
                    AccountTypeDB typedb = new AccountTypeDB();
                    String userType = typedb.getType(id);
                    out.println("<td><p align='left'>Role: </p></td>");
                    out.println("<td><p>" + userType + "</p></td>");
                    out.println("</tr>");
                    out.println("</table>");
                    out.println("<p><a href=\"handleEdit?action=getEditCustomer&username=" + u.getUsername() + "\">Edit</a></p>");
                %>
            </div>
            <jsp:include page = "footer.jsp" />
        </div>
    </body>
</html>
