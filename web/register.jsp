<%-- 
    Document   : register
    Created on : Nov 30, 2018, 3:26:07 PM
    Author     : 170068072
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ict.db.AccountDB"%>
<%
    AccountDB db = new AccountDB();
    ArrayList<String> users = db.getAllID();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <style type="text/css">
            <jsp:include page="css/style.css" />
        </style>
        <script src="./jslib/jquery-3.3.1.js">

        </script>
        <script>
            var users;
            $(document).ready(function () {
                users = "<%=users%>";
                users = users.replace("[", "");
                users = users.replace("]", "");
                var users_array = users.split(", ");
           
                $("input[name=fname]").keyup(function () {
                    var text = $(this).val();
                    $(this).val(text.charAt(0).toUpperCase() + text.slice(1).toLowerCase());
                });

                $("input[name=lname]").keyup(function () {
                    var text = $(this).val();
                    $(this).val(text.charAt(0).toUpperCase() + text.slice(1).toLowerCase());
                });

                $("input[name=username]").keyup(function () {
                    for (var i = 0; i < users_array.length; i++) {
                       
                        if ($(this).val() == users_array[i])
                            alert("nsds");
                    }
                });
            })
        </script>
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp" />
            <jsp:include page="sidebar.jsp" />
            <div class="content">
                <h1>Register</h1>
                <form method="post" action="RegisterController">
                    <input type="hidden" name="action" value="userRegister">
                    <table border="0">
                        <tr>
                            <td><p align="left">Username: </p></td>
                            <td><p><input type="text" name="username" maxlength="15" size="15"></p></td>  
                        </tr>

                            
                        <tr>
                            <td><p align="left">Password: </p></td>
                            <td><p><input type="password" name="password" maxlength="25" size="15"></p></td>
                        </tr>
                        <tr>
                            <td><p align="left">FirstName: </p></td>
                            <td><p><input type="text" name="fname" maxlength="15" size="15"></p></td>
                        </tr>
                        <tr>
                            <td><p align="left">LastName: </p></td>
                            <td><p><input type="text" name="lname" maxlength="15" size="15"></p></td>
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
                            <td><p><input type="radio" value="0001" name="userType">Normal User</p></td>
                            <td><p><input type="radio" value="0002" name="userType">Restaurant Operator </p></td>
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
