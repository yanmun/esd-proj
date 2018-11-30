<%-- 
    Document   : login
    Created on : 2018年11月30日, 下午01:44:18
    Author     : pearh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <style type="text/css">
            <jsp:include page="css/style.css" />
        </style>
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp" />
            <jsp:include page="sidebar.jsp" />
            <div class="content">
                <h1>Login form</h1>
                <form action="LoginController" method="post">
                    <table border="0">
                        <tr>
                            <td><p align="left">Username: </p></td>
                            <td><p><input type="text" name="username" ></p></td>
                        </tr>
                        <tr>
                            <td><p align="left">Password: </p></td>
                            <td><p><input type="password" name="password" ></p></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><p><input type="submit" value="Login" style="width: 100%"></p></td>
                        </tr>                   
                    </table>
                    <a href="" style="margin: 20px;">Forget Password?</a>
                </form>
            </div>
            <jsp:include page="footer.jsp" />
        </div>
    </body>
</html>
