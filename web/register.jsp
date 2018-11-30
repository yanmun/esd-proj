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
            <div class="header"><a href="index.jsp"><b style="font-size: 50px;">Takeaway King</b></a> 
            </div>
            <div class="sidebar1">
                <ul class="nav">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="member.php">Member</a></li>
                    <li><a href="product_list.php">Product List</a></li>
                    <li><a href="cart.php">Cart</a></li>
                </ul>
                <p> The above links demonstrate a basic navigational structure using an unordered list styled with CSS. Use this as a starting point and modify the properties to produce your own unique look. If you require flyout menus, create your own using a Spry menu, a menu widget from Adobe's Exchange or a variety of other javascript or CSS solutions.</p>
                <p>If you would like the navigation along the top, simply move the ul.nav to the top of the page and recreate the styling.</p>
            </div>
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
            <div class="footer">
                <p>This .footer contains the declaration position:relative; to give Internet Explorer 6 hasLayout for the .footer and cause it to clear correctly. If you're not required to support IE6, you may remove it.</p>
            </div>
        </div>
    </body>
</html>