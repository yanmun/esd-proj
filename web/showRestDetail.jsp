<%-- 
    Document   : showRestDetail
    Created on : 2018年12月7日, 上午01:07:25
    Author     : Tung
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ict.bean.*, java.util.*, ict.db.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurant Detail</title>
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
                    out.println("<p>Description: " + r.getRest_desc() + "</p>");
                    out.println("</td>");
                    out.println("<td></td>");
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

                    ArrayList<CommentBean> comments = (ArrayList<CommentBean>) request.getAttribute("comments");
                    out.println("<tr>");
                    out.println("<td>");
                    out.println("<p>All Comment: </p>");
                    out.println("</td>");
                    out.println("<td></td>");
                    out.println("</tr>");
                    out.println("<table>");
                    for (int i = 0; i < comments.size(); i++) {
                        CommentBean c = comments.get(i);
                        out.println("<tr>");
                        out.println("<td>");
                        out.println("<p>User: " + c.getUsername() + "</p>");
                        out.println("</td>");
                        out.println("<td>");
                        out.println("<p>Date: " + c.getComment_date() + "</p>");
                        out.println("</td>");
                        out.println("<td>");
                        out.println("<p>Time: " + c.getComment_time() + "</p>");
                        out.println("</td>");
                        out.println("</tr>");
                        out.println("<tr>");
                        out.println("<td>");
                        out.println("<p>Comment: " + c.getComment() + "</p>");
                        out.println("</td>");
                        out.println("</tr>");
                        out.println("<tr>");
                        out.println("<td colspan='3'>");
                        out.println("<hr>");
                        out.println("</td>");
                        out.println("<td></td>");
                        out.println("</tr>");
                    }
                %>
                <jsp:useBean id="userInfo" class="ict.bean.UserInfo" scope="session"/>
                <%
                    String user = userInfo.getUsername();
                    String Restowner = r.getOwnerID();
                    if (Restowner.equals(user)) {
                        RestaurantDB restDB = new RestaurantDB();
                        int view = restDB.getView(r.getRestName());
                        out.println("<tr>");
                        out.println("<td>");
                        out.println("<p>People of view: " + view + "</p>");
                        out.println("</td>");
                        out.println("<td></td>");
                        out.println("</tr>");
                    }

                    String type = userInfo.getType();
                    if ("System Administrator".equals(type)) {
                        RestaurantDB restDB = new RestaurantDB();
                        int view = restDB.getView(r.getRestName());
                        out.println("<tr>");
                        out.println("<td>");
                        out.println("<p>People of view: " + view + "</p>");
                        out.println("</td>");
                        out.println("<td></td>");
                        out.println("</tr>");
                    }
                    
                    String restID = r.getRestID();
                    String restName = r.getRestName();
                    

                    if ("Normal User".equals(type)) {
                        out.println("<tr>");
                        out.println("<td>");
                        out.println("<form method='post' action='showRestaurant?action=addComment'>");
                        out.println("<input type='hidden' name='restID' value='" + restID + "'>");
                        out.println("<input type='hidden' name='username' value='" + userInfo.getUsername() + "'>");
                        out.println("<input type='hidden' name='restName' value='" + restName+ "'>");
                        Date date = new Date();
                        SimpleDateFormat dateF = new SimpleDateFormat("yyyy-MM-dd ");
                        SimpleDateFormat timeF = new SimpleDateFormat("k:mm:ss");
                        out.println("<input type='hidden' name='comment_date' value='" + dateF.format(date) + "'>");
                        out.println("<input type='hidden' name='comment_time' value='" + timeF.format(date) + "'>");
                        out.println("<p>Comment:</p>");
                        out.println("<p><textarea name='comment' rows='4' cols='50'></textarea></p>");
                        out.println("<p><input type='submit' value='submit'></p>");
                        out.println("</td>");
                        out.println("<td></td>");
                        out.println("</tr>");
                        out.println("<tr>");
                        out.println("<td>");
                        out.println("<p><a href=''>Add to favorite</p>");
                        out.println("</td>");
                        out.println("<td></td>");
                        out.println("</tr>");
                    }

                    out.println("</table>");
                    out.println("</table>");
                %>
            </div>
            <jsp:include page="footer.jsp" />
        </div>    
    </body>
</html>
