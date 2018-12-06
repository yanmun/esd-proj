<%-- 
    Document   : showRestDetail
    Created on : 2018年12月7日, 上午01:07:25
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
                <%
                    RestaurantBean r = (RestaurantBean) request.getAttribute("restaurant");
                    out.println("<table border='0'>");
                    out.println("<tr>");
                    out.println("<td width='500'>");
                    out.println("<p>" + r.getRestName() + "</p>");
                    out.println("</td>");
                    out.println("<td rowspan='4' width='500'><img src='" + r.getRest_pic() + "' >");
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
                    out.println("<tr>");
                    out.println("<td>");
                    out.println("<hr>");
                    out.println("</td>");
                    out.println("<td></td>");
                    out.println("</tr>");


                %>
                <jsp:useBean id="userInfo" class="ict.bean.UserInfo" scope="session"/>
                <%                    
                    String type = userInfo.getType();
                    if ("0001".equals(type)) {
                        out.println("<tr>");
                        out.println("<td>");
                        out.println("<p>Comment: <textarea rows='4' cols='50'></textarea></p>");
                        out.println("<p><input type='button' value='submit' onclick='welcome.jsp'></p>");
                        out.println("</td>");
                        out.println("<td></td>");
                        out.println("</tr>");
                    }

                    RestaurantDB restDB = new RestaurantDB();
                    int view = restDB.getView(r.getRestName());
                    out.println("<tr>");
                    out.println("<td>");
                    out.println("<p>People of view: " + view + "</p>");
                    out.println("</td>");
                    out.println("<td></td>");
                    out.println("</tr>");

                    out.println("</table>");
                %>
            </div>
            <jsp:include page="footer.jsp" />
        </div>    
    </body>
</html>
