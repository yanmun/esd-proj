<%-- 
    Document   : editUser
    Created on : 2018年12月3日, 上午02:23:27
    Author     : Tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ict.bean.*, java.util.*, ict.db.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <style type="text/css">
            <jsp:include page="css/style.css" />
        </style>
    </head>
    <body>
        <div class="container">
            <jsp:useBean id="u" scope="request" class="ict.bean.UserBean" />
            <%
                String name = u.getUsername();
                String pd = u.getPassword();
                String tel = u.getTel();
                String email = u.getEmail();
                String fname = u.getFname();
                String lname = u.getLname();
            %>
            <jsp:include page="header.jsp" />
            <jsp:include page="sidebar.jsp" />
            <div class="content">
                <form method="post" action="handleEdit">
                    <table border="0">
                        <input type="hidden" name="action"  value="edit">
                        <tr>
                            <td><p align="left">Username: </p></td>
                            <td><p><%=name%></p></td>
                            <input type="hidden" name="username"  value="<%=name%>">
                        </tr>
                        <tr>
                            <td><p align="left">Password: </p></td>
                            <td><p><input type="text" name="password" maxlength="25" size="15" value="<%=pd%>"></p></td>
                        </tr>
                        <tr>
                            <td><p align="left">FirstName: </p></td>
                            <td><p><input type="text" name="fname" maxlength="15" size="15" value="<%=fname%>"></p></td>
                        </tr>
                        <tr>
                            <td><p align="left">LastName: </p></td>
                            <td><p><input type="text" name="lname" maxlength="15" size="15" value="<%=lname%>"></p></td>
                        </tr>
                        <tr>
                            <td><p align="left">Tel: </p></td>
                            <td><p><input type="text" name="tel" maxlength="8" size="15" value="<%=tel%>"></p></td>
                        </tr>
                        <tr>
                            <td><p align="left">Email: </p></td>
                            <td><p><input type="email" name="email" maxlength="40" size="15" value="<%=email%>"></p></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><p><input type="submit" value="Change" style="width: 100%"></p></td>
                        </tr> 
                    </table>
                </form>
            </div>
            <jsp:include page = "footer.jsp" />
        </div>
    </body>
</html>
