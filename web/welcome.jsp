<%-- 
    Document   : welcome
    Created on : 2018年12月2日, 上午03:08:16
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
        <jsp:useBean id="userInfo" class="ict.bean.UserInfo" scope="session"/>
        <b>Hello, <jsp:getProperty name="userInfo" property="username" /></b>
    </body>
</html>
