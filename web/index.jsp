<%-- 
    Document   : index
    Created on : 2018年11月30日, 上午02:15:07
    Author     : pearh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <style type="text/css">
            <jsp:include page="css/style.css" />
        </style>
    </head>
    <body>
          <div class="container">
            <div class="header"><a href="index.jsp"><b style="font-size: 50px;">Takeaway King</b></a> 
                <!-- end .header --></div>
            <div class="sidebar1">
                <ul class="nav">
                    <li><a href="restaurant_list.jsp">Find Restaurants</a></li>
                    <li><a href="register.jsp">Register</a></li>
                    <li><a href="login.jsp">Login</a></li>
                    <!--<li><a href="member.php">Member</a></li>-->    
                    <!--<li><a href="logout.php">Logout</a></li>-->                  
                    <!--<li><a href="cart.php">Cart</a></li>-->
                </ul>
                <p> The above links demonstrate a basic navigational structure using an unordered list styled with CSS. Use this as a starting point and modify the properties to produce your own unique look. If you require flyout menus, create your own using a Spry menu, a menu widget from Adobe's Exchange or a variety of other javascript or CSS solutions.</p>
                <p>If you would like the navigation along the top, simply move the ul.nav to the top of the page and recreate the styling.</p>
                <!-- end .sidebar1 --></div>
            <div class="content">
                <p>Cart</p>
                HI
                <!-- end .content --></div>
            <div class="footer">
                <p>This .footer contains the declaration position:relative; to give Internet Explorer 6 hasLayout for the .footer and cause it to clear correctly. If you're not required to support IE6, you may remove it.</p>
               </div>
          </div>
    </body>
</html>