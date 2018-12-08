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
                            <optgroup label='Hong Kong Island'>
                                <option value='Central and Western'>Central and Western</option>
                                <option value='Wan Chai'>Wan Chai</option>
                                <option value='Eastern'>Eastern </option>
                                <option value='Southern'>Southern</option>
                            <optgroup label='Kowloon'>
                                <option value='Yau Tsim Mong'>Yau Tsim Mong </option>
                                <option value='Sham Shui Po'>Sham Shui Po</option>
                                <option value='Kowloon City'>Kowloon City</option>
                                <option value='Wong Tai Sin'>Wong Tai Sin</option>
                                <option value='Kwun Tong'>Kwun Tong</option>
                            <optgroup label='New Territories'>
                                <option value='Kwai Tsing'>Kwai Tsing</option>
                                <option value='Tsuen Wan'>Tsuen Wan</option>
                                <option value='Tuen Mun'>Tuen Mun</option>
                                <option value='Yuen Long'>Yuen Long</option>
                                <option value='North'>North</option>
                                <option value='Tai Po'>Tai Po</option>
                                <option value='Sha Tin'>Sha Tin</option>
                                <option value='Sai Kung'>Sai Kung</option>
                                <option value='Islands'>Islands</option>
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
