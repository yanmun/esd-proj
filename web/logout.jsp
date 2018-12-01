<%-- 
    Document   : logout
    Created on : 2018年12月2日, 上午03:33:03
    Author     : Tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
            function fnSubmit()
            {
                document.forms["logoutForm"].submit();
            }
        </script>

    </head>
    <body>
        <form name="logoutForm" method="post" action="LoginController">
            <jsp:useBean id="userInfo" class="ict.bean.UserInfo" scope="session"/>
            <form method="post" action="main">
                <input type="hidden" name="action" value="logout">
                <input type="submit" value="Logout" name="logoutButton">
            </form>
        </form>
    </body>
</html>
