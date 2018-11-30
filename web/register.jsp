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
                <h1>Register</h1>
                <form method="post" action="main">
                    <input type="hidden" name="action" value="register">
                    <table border="0">
                        <tr>
                            <td><p align="left">FirstName: </p></td>
                            <td><p><input type="text" name="fname" maxlength="15" size="15"></p></td>
                        </tr>
                        <tr>
                            <td><p align="left">LastName: </p></td>
                            <td><p><input type="text" name="lname" maxlength="15" size="15"></p></td>
                        </tr>
                        <tr>
                            <td><p align="left">Username: </p></td>
                            <td><p><input type="text" name="username" maxlength="15" size="15"></p></td>
                        </tr>
                        <tr>
                            <td><p align="left">Password: </p></td>
                            <td><p><input type="password" name="password" maxlength="25" size="15"></p></td>
                        </tr>
                        <tr>
                            <td><p align="left">Tel: </p></td>
                            <td><p><input type="text" name="tel" maxlength="8" size="15"></p></td>
                        </tr>
                        <tr>
                            <td><p align="left">Email: </p></td>
                            <td><p><input type="email" name="email" maxlength="40" size="15"></p></td>
                        </tr>
                        <tr>
                            <td><p align="left">Type: </p></td>
                            <td><p><input type="radio" value="normal">Normal User</p></td>
                            <td><p><input type="radio" value="normal">Restaurant Operator </p></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><p><input type="submit" value="Register" style="width: 100%"></p></td>
                        </tr> 
                    </table>
                </form>
            </div>
             <jsp:include page="footer.jsp" />
        </div>
    </body>
</html>
