<%-- 
    Document   : ownedRestaurant
    Created on : 2018年12月7日, 下午04:39:17
    Author     : pearh
--%>
<%@page import="ict.bean.RestaurantBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ict.bean.UserInfo"%>
<%@page import="ict.db.RestaurantDB"%>
<%
    UserInfo ub = (UserInfo) session.getAttribute("userInfo");
    session.getAttribute("userInfo");
    RestaurantDB db = new RestaurantDB();
    ArrayList<RestaurantBean> rests = db.queryByUsername(ub.getUsername());
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Owned Restaurant</title>
    </head>
    <body>
        <input type="button" value="View all restaurant you owned">
        <input type="button" value="View Report">
        <table border="1">
            <tr>
                <th>Restaurant ID</th>
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
                <th></th>
            </tr>
        </table>
    </body>
</html>
