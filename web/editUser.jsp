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
                String id = request.getParameter("id");
                AccountTypeDB db = new AccountTypeDB();
                String role = db.getType(id);
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
                        <%
                            if ("System Administrator".equals(id)) {
                                out.println("<tr>");
                                out.println("<td><p align='left'>Role: </p></td>");
                                out.println("<td><p><input type='radio' value='0001' name='userType'>Normal User</p></td>");
                                out.println("<td><p><input type='radio' value='0002' name='userType'>Restaurant Operator</p></td>");
                                out.println("<td><p><input type='radio' value='0003' name='userType'>System Administrator</p></td>");
                                out.println("</tr>");
                            }
                        %>
                        <tr>
                            <td></td>
                            <td><p><input type="submit" value="Edit" style="width: 100%"></p></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><p><input type="button" value="Back" style="width: 100%" onclick="javascript:window.location.href = 'welcome.jsp'"></p></td>
                        </tr> 
                    </table>
                </form>
            </div>
            <jsp:include page = "footer.jsp" />
        </div>
    </body>
</html>
