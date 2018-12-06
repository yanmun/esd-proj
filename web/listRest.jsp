<%-- 
    Document   : restInfo
    Created on : 2018年12月5日, 上午09:57:00
    Author     : Tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ict.bean.*, java.util.*, ict.db.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            <jsp:include page="css/style.css" />
        </style>
    </head>
    <body> 
        <div class="container">
            <jsp:include page="header.jsp" />
            <jsp:include page="sidebar.jsp" />
            <div class="content">
                <form method="post" action="handleEdit">
                    <input type="hidden" name="action" value="search">
                    Search user<br><input type="text" name="username">
                    <input type="submit" value="search">
                </form>
                <br>
                <%
                    ArrayList<RestaurantBean> restaurants = (ArrayList<RestaurantBean>) request.getAttribute("restaurants");
                    for (int i = 0; i < restaurants.size(); i++) {
                        RestaurantBean r = restaurants.get(i);
                        out.println("<p><a href=\"showRestaurant?action=show&username=" + r.getRestName() + "\">" + r.getRestName() + "</a></p>");
                        out.println("<p>Address: " + r.getAddress() + "</p>");

                        String id = r.getRestTypeID();
                        RestaurantTypeDB db = new RestaurantTypeDB();
                        String restType = db.getType(id);
                        out.println("<p>Type: " + restType + "</p>");
                    }
                %>
            </div>
            <jsp:include page="footer.jsp" />
        </div>    
    </body>
</html>
