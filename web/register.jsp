<%-- 
    Document   : register
    Created on : Nov 30, 2018, 3:26:07 PM
    Author     : 170068072
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <style type="text/css">
            <jsp:include page="css/style.css" />
        </style>
    </head>
    <body>
        <div class="container">
         <jsp:include page="header.jsp" />
      <jsp:include page="sidebar.jsp" />
            <div class="content">
                <b>Register</b>
                <form method="post" action="main">
                    <input type="hidden" name="action" value="register">
                    <input type="hidden" name="type" value="user">
                    <table border="0">
                        <tr>
                            <td><p align="right">FirstName: </p></td>
                            <td><p><input type="text" name="fname" maxlength="15" size="15"></p></td>
                        </tr>
                        <tr>
                            <td><p align="right">LastName: </p></td>
                            <td><p><input type="text" name="lname" maxlength="15" size="15"></p></td>
                        </tr>
                        <tr>
                            <td><p align="right">Username: </p></td>
                            <td><p><input type="text" name="username" maxlength="15" size="15"></p></td>
                        </tr>
                        <tr>
                            <td><p align="right">Password: </p></td>
                            <td><p><input type="password" name="password" maxlength="25" size="15"></p></td>
                        </tr>
                        <tr>
                            <td><p align="right">Tel: </p></td>
                            <td><p><input type="text" name="tel" maxlength="8" size="15"></p></td>
                        </tr>
                        <tr>
                            <td><p align="right">Email: </p></td>
                            <td><p><input type="email" name="email" maxlength="40" size="15"></p></td>
                        </tr>
                        <tr>
                            <td><p align="right">Type: </p></td>
                            <td><p><input type="radio" value="normal">Normal User</p></td>
                            <td><p><input type="radio" value="normal">Restaurant Operator </p></td>
                        </tr>
                        <tr>
                            <td colspan="2"><p align="center"><input type="submit" value="Register"></p></td>
                        </tr>
                    </table>
                </form>
            </div>
             <jsp:include page="footer.jsp" />
        </div>
    </body>
</html>
