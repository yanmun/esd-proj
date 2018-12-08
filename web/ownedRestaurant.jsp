<%-- 
    Document   : ownedRestaurant
    Created on : 2018年12月7日, 下午04:39:17
    Author     : pearh
--%>
<%@page import="ict.bean.RestaurantBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ict.bean.UserInfo"%>
<%@page import="ict.db.RestaurantDB"%>

<%!
    UserInfo ub;
    ArrayList<RestaurantBean> rests;
    int count = 1;
%>
<%

    if (session.getAttribute("userInfo") != null) {
        ub = (UserInfo) session.getAttribute("userInfo");

        RestaurantDB db = new RestaurantDB();
        rests = db.queryByUsername(ub.getUsername());
    }


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css">
            <jsp:include page="css/style.css" />
        </style>
        <title>Owned Restaurant</title>
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp" />
            <jsp:include page="sidebar.jsp" />
            <div class="content">                
                <input type="button" value="View all restaurant you owned">
                <input type="button" value="View Report">

                <div class="sub_content">      
                    <table border="1">
                        <tr>

                            <%                                
                                if (rests != null) {
                                    for (int i = 0; i < rests.size(); i++) {
                                        if (count % 3 == 0) {
                                            out.println(" </tr><tr>");

                                        }

                                        out.println("<td style='width:200px;'><img src='" + rests.get(i).getRest_pic() + "' width='200' height='200'>"
                                                + "<p> <strong>" + rests.get(i).getRestName() + "</strong></p>"
                                                + " <p>" + rests.get(i).getAddress() + "</p>"
                                                + "<p> Tel:" + rests.get(i).getRestTel() + "</p>"
                                                + "<p>" + rests.get(i).getOpen_hrs() + "</p>"
                                                + "<p>" + rests.get(i).getStatus() + "</p>"
                                                + "<p> <a href=''>Edit</a></p></td>");
                                    }
                                }

                            %>


                    </table>
                </div>
                         
            </div>
            <jsp:include page="footer.jsp" />
        </div>
       
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
    </body>
</html>
