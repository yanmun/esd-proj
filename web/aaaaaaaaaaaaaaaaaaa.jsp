<%-- 
    Document   : aaaaaaaaaaaaaaaaaaa
    Created on : 2018年12月5日, 上午12:42:14
    Author     : Tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                            if ("System Administrator".equals(id)) {
                                out.println("<tr>");
                                out.println("<td><p align='left'>Role: </p></td>");
                                out.println("<td><p><input type='radio' value='0001' name='userType' isChecked(type,'0001')>Normal User</p></td>");
                                out.println("<td><p><input type='radio' value='0002' name='userType' isChecked(type,'0002')>Restaurant Operator</p></td>");
                                out.println("<td><p><input type='radio' value='0003' name='userType' isChecked(type,'0003')>System Administrator</p></td>");
                                out.println("</tr>");
                            } else {
                        %>
    </body>
</html>
