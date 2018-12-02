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
                <form name="logoutForm" method="post" action="LoginController">
                    <input type="hidden" name="action" value="logout">
                    <input type="submit" value="Logout" name="logoutButton">
                </form>
            </div>
            <jsp:include page="footer.jsp" />
        </div>
    </body>
</html>
