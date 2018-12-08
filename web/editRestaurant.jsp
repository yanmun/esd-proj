<%-- 
    Document   : editRestaurant
    Created on : 2018年12月8日, 下午09:50:06
    Author     : pearh
--%>

<%@page import="ict.bean.RestaurantBean"%>
<%@page import="ict.db.RestaurantDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%!
    RestaurantBean r;
%>
<%
    if (request.getParameter("id") != null) {
        RestaurantDB db = new RestaurantDB();

        r = db.queryRestByRestID(request.getParameter("id"));
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css">
            <jsp:include page="css/style.css" />
        </style>
        <title>Edit Restaurant Info</title>
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp" />
            <jsp:include page="sidebar.jsp" />
            <div class="content">                
                <form action="action" method="post">
                    <p>Restaurant Name: <input type="text" name="rname" value="<%=r.getRestName()%>"></p>
                    <p>Telephone Number: <input type="text" name="tel" value="<%=r.getRestTel()%>"></p>
                    <p>Email: <input type="email" name="tel" value="<%=r.getRestEmail()%>"></p>
                    <p>District:    
                        <select name='district' style='width:100%;'>
                            <option value='Hong Kong Island'>Hong Kong Island</option>
                            <option value='Kowloon'>Kowloon </option>
                            <option value='New Territories'>New Territories</option>
                        </select></p>
                </form>
                <!--                        <th>Restaurant ID</th>
                                                      <th>Restaurant Name</th>
                                                      <th>Telephone Number</th>
                                                      <th>Email</th>
                                                      <th>District</th>
                                                      <th>Address</th>
                                                      <th>Description</th>
                                                      <th>Restaurant Photo</th>
                                                      <th>Status</th>
                                                      <th>Open Hour</th>
                                                      <th></th>
                                                      <th></th>
                                                      <th></th>-->
            </div>
            <jsp:include page="footer.jsp" />
        </div>
    </body>
</html>
