<%-- 
    Document   : register
    Created on : Nov 30, 2018, 3:26:07 PM
    Author     : 170068072
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurant Register</title>
        <style type="text/css">
            <jsp:include page="css/style.css" />
        </style>
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp" />
            <jsp:include page="sidebar.jsp" />
            <div class="content">
                <h1>Restaurant Register</h1>
                <form method="post" action="RestaurantRegisterController">
                    <input type="hidden" name="action" value="restRegister">
                    <input type="hidden" name="state" value="open">
                    <table border="0">
                        <!--                        <tr>
                                                    <td><p align="left">More than one restaurant? </p></td>
                                                    <td><p><input type="button" value="add" style="width: 100%;"></p></td>
                                                </tr> -->
                        <tr>
                            <td><p align="left">Restaurant Name: </p></td>
                            <td><p><input type="text" name="rname" maxlength="50" style="width:100%;" required></p></td>
                        </tr>
                        <tr>
                            <td><p align="left">Working Hour: </p></td>
                            <td><p> <input type="time"  name="open_time"
                                           min="00:00" max="23:59" required/> to <input type="time" id="appt" name="close_time"
                                           min="00:00" max="23:59" required/> (
                                    <select name="start_day" >
                                        <option value="Sunday">Sunday</option>
                                        <option value="Monday">Monday</option>
                                        <option value="Tuesday">Tuesday</option>
                                        <option value="Wednesday">Wednesday</option>
                                        <option value="Thursday">Thursday</option>
                                        <option value="Friday">Friday</option>
                                        <option value="Saturday">Saturday</option>
                                    </select> to  <select name="end_day" >
                                        <option value="Sunday">Sunday</option>
                                        <option value="Monday">Monday</option>
                                        <option value="Tuesday">Tuesday</option>
                                        <option value="Wednesday">Wednesday</option>
                                        <option value="Thursday">Thursday</option>
                                        <option value="Friday">Friday</option>
                                        <option value="Saturday">Saturday</option>
                                    </select>)</p></td>
                        </tr>
                        <tr>
                            <td><p align="left">District: </p></td>
                            <td>
                                <p>
                                    <select name="district" style="width:100%;">
                                        <option value="hk">Hong Kong Island</option>
                                        <option value="kl">Kowloon </option>
                                        <option value="nt">New Territories</option>
                                    </select>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td><p align="left">Restaurant Addresss: </p></td>
                            <td><p><textarea rows="4" cols="30" name="address"></textarea></p></td>
                        </tr>
                        <tr>
                            <td><p align="left">Restaurant Type: </p></td>
                            <td>
                                <p>
                                    <select name="rtype" style="width:100%;">
                                        <option value="chinese">Chinese</option>
                                        <option value="western">Western </option>
                                        <option value="japanese ">Japanese </option>
                                        <option value="korean ">Korean </option>
                                    </select>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td><p align="left">Restaurant Tel: </p></td>
                            <td><p><input type="text" name="rtel" maxlength="8" style="width:100%;"></p></td>
                        </tr>
                        <tr>
                            <td><p align="left">Restaurant Email: </p></td>
                            <td><p><input type="email" name="remail" maxlength="40" style="width:100%;"></p></td>
                        </tr>
                        <tr>
                            <td><p align="left">Description: </p></td>
                            <td><p><textarea name="r_desc" cols="30" rows="10"></textarea></p></td>
                        </tr>
                        <tr>
                            <td><p align="left">Photo of Restuarant: </p></td>
                            <td><p><input type="file" name="r_photo"></p></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><p><input type="submit" value="Register" style="width: 100%;"></p></td>
                        </tr>
                    </table>
                </form>
            </div>
            <jsp:include page="footer.jsp" />
        </div>
    </body>
</html>