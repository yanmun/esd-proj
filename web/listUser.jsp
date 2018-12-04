<%-- 
    Document   : adminHome
    Created on : 2018年12月4日, 上午12:17:04
    Author     : Tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ict.bean.*, java.util.*, ict.db.AccountTypeDB" %>
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
                <h1>All User</h1>
                <form method="post" action="handleEdit">
                    <input type="hidden" name="action" value="search">
                    Search user<br><input type="text" name="username">
                    <input type="submit" value="search">
                </form>
                <br>
                <%
                    ArrayList<UserBean> users = (ArrayList<UserBean>) request.getAttribute("users");
                    out.println("<table border='1'>");
                    out.println("<tr>");
                    out.println("<th>username</th><th>password</th><th>tel</th><th>email</th><th>first name</th><th>last name</th><th>role</th>");
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
                        String id = u.getType();
                        AccountTypeDB db = new AccountTypeDB();
                        String userType = db.getType(id);
                        out.println("<td>" + userType + "</td>");
                %>
                <jsp:useBean id="userInfo" class="ict.bean.UserInfo" scope="session"/>
                <%
                        out.println("<td><a href=\"handleEdit?action=getEditCustomer&username=" + u.getUsername() + "&id=" + userInfo.getType() + "\">Edit</a></td>");
                        out.println("<td><a href=\"handleEdit?action=delete&username=" + u.getUsername() + "\">Delete</a></td>");
                        out.println("</tr>");
                    }
                    out.println("</table>");
                %>
                <br>
                <form method="post" action="handleEdit">
                    <input type="hidden" name="action" value="create">                    
                    <input type="submit" value="Create new user">
                </form>
            </div>
            <jsp:include page = "footer.jsp" />
        </div>
    </body>
</html>
