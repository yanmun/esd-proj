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
        <title>All Restaurant</title>
        <style type="text/css">
            <jsp:include page="css/style.css" />
        </style>
    </head>
    <body> 
        <div class="container">
            <jsp:include page="header.jsp" />
            <jsp:include page="sidebar.jsp" />
            <div class="content">
                <form method="post" action="showRestaurant">
                    <input type="hidden" name="action" value="search">
                    Search Restaurant<br><input type="text" name="restName">
                    <input type="submit" value="search">
                </form>
                <br>
                <%
                    ArrayList<RestaurantBean> restaurants = (ArrayList<RestaurantBean>) request.getAttribute("restaurants");
                    out.println("<table border='0'>");
                    for (int i = 0; i < restaurants.size(); i++) {
                        RestaurantBean r = restaurants.get(i);
                        out.println("<tr>");
                        out.println("<td width='500'>");
                        out.println("<p><a href=\"showRestaurant?action=show&restName=" + r.getRestName() + "&restID=" + r.getRestID() +"\">" + r.getRestName() + "</a></p>");
                        out.println("</td>");
                        out.println("<td rowspan='4' width='500'><img src='" + r.getRest_pic() + "' height='100' width='150'>");
                        out.println("</td>");
                        out.println("</tr>");
                        out.println("<tr>");
                        out.println("<td>");
                        out.println("<p>Address: " + r.getAddress() + "</p>");
                        out.println("</td>");
                        out.println("<td></td>");
                        out.println("</tr>");
                        out.println("<tr>");
                        out.println("<td>");
                        out.println("<p>Telephone: " + r.getRestTel() + "</p>");
                        out.println("</td>");
                        out.println("<td></td>");
                        out.println("</tr>");

                        String id = r.getRestTypeID();
                        RestaurantTypeDB db = new RestaurantTypeDB();
                        String restType = db.getType(id);
                        out.println("<tr>");
                        out.println("<td>");
                        out.println("<p>Type: " + restType + "</p>");
                        out.println("</td>");
                        out.println("<td></td>");
                        out.println("</tr>");
                    }
                    out.println("</table>");
                %>
            </div>
            <jsp:include page="footer.jsp" />
        </div>    
    </body>
</html>