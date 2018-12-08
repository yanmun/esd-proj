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
        <link rel="stylesheet" href="./css/element_style.css">
        <script src="./jslib/jquery-3.3.1.js">

        </script>
        <script>

            var temp = '<%=r.getDistrict()%>';
            var status = '<%=r.getStatus()%>';
            var time = '<%=r.getOpen_hrs()%>';
            var start_hr = time.charAt(0) + time.charAt(1) +
                    time.charAt(2) + time.charAt(3) + time.charAt(4);
            var close_time = time.charAt(8) + time.charAt(9) +
                    time.charAt(10) + time.charAt(11) + time.charAt(12);

            var start_day = "";


            $(document).ready(function () {
                alert(getStartDay());
                $("#district option[value='" + temp + "']").attr('selected', 'selected');
                $("#status option[value='" + status + "']").attr('selected', 'selected');
                $("input[name=open_time]").val(start_hr);
                $("input[name=close_time]").val(close_time);
            })

            function getStartDay() {
                for (var i = 0; i < time.length; i++) {
                    if (time[i] == "t") {
                        return i;
                    }
                }
            }
        </script>
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
                        <select name='district' style='' id="district">
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

                    <p>Address:
                        <input type="email" name="address" value="<%=r.getAddress()%>" style="width: 100%;"></p>
                    <p>Description: <br><textarea name="r_desc" cols="30" rows="10" ><%=r.getRest_desc()%></textarea></p>
                    <p>Status: 
                        <select name="status" id="status">
                            <option value="open">Open</option>
                            <option value="defunct">defunct</option>
                        </select>
                    </p>
                    <p>Open Hour: 
                        <input type='time'  name='open_time'
                               min='00:00' max='23:59' /> to <input type='time' id='appt' name='close_time'
                               min='00:00' max='23:59'  value=""/> ( <select name='start_day' >
                            <option value='Sunday'>Sunday</option>
                            <option value='Monday'>Monday</option>
                            <option value='Tuesday'>Tuesday</option>
                            <option value='Wednesday'>Wednesday</option>
                            <option value='Thursday'>Thursday</option>
                            <option value='Friday'>Friday</option>
                            <option value='Saturday'>Saturday</option>
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
