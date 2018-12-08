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
        <link rel="stylesheet" href="./css/element_style.css">
        <script src="./jslib/jquery-3.3.1.js">

        </script>
        <script>
            $(document).ready(function () {
                var num_rest;
                $("#num_rest").keyup(function () {
                    if (parseInt($(this).val()) < 1 || parseInt($(this).val()) > 10) {

                        $(this).val("");
                    }
                })
                $("#confirm_num_rest").click(function () {
                    num_rest = parseInt($("#num_rest").val());
                     $("#pos").empty();
                    var str = "<form method='post' action='RestaurantRegisterController'>\n" +
                            "                    <input type='hidden' name='action' value='restRegister'>\n" +
                            "                    <input type='hidden' name='state' value='open'>";
                    for (var i = 1; i <= num_rest; i++) {
                        str += "<table border='0'>\n" +
                                "                 \n" +
                                "                        <tr>\n" +
                                "  <tr><td><p align='left'>"+i+"</p></td><td><p></p></td></tr> <td><p align='left'>Restaurant Name: </p></td>\n" +
                                "                            <td><p><input type='text' name='rname' maxlength='50' style='width:100%;' required></p></td>\n" +
                                "                        </tr>\n" +
                                "                        <tr>\n" +
                                "                            <td><p align='left'>Working Hour: </p></td>\n" +
                                "                            <td><p> <input type='time'  name='open_time'\n" +
                                "                                           min='00:00' max='23:59' required/> to <input type='time' id='appt' name='close_time'\n" +
                                "                                           min='00:00' max='23:59' required/> (\n" +
                                "                                    <select name='start_day' >\n" +
                                "                                        <option value='Sunday'>Sunday</option>\n" +
                                "                                        <option value='Monday'>Monday</option>\n" +
                                "                                        <option value='Tuesday'>Tuesday</option>\n" +
                                "                                        <option value='Wednesday'>Wednesday</option>\n" +
                                "                                        <option value='Thursday'>Thursday</option>\n" +
                                "                                        <option value='Friday'>Friday</option>\n" +
                                "                                        <option value='Saturday'>Saturday</option>\n" +
                                "                                    </select> to  <select name='end_day' >\n" +
                                "                                        <option value='Sunday'>Sunday</option>\n" +
                                "                                        <option value='Monday'>Monday</option>\n" +
                                "                                        <option value='Tuesday'>Tuesday</option>\n" +
                                "                                        <option value='Wednesday'>Wednesday</option>\n" +
                                "                                        <option value='Thursday'>Thursday</option>\n" +
                                "                                        <option value='Friday'>Friday</option>\n" +
                                "                                        <option value='Saturday'>Saturday</option>\n" +
                                "                                    </select>)</p></td>\n" +
                                "                        </tr>\n" +
                                "                        <tr>\n" +
                                "                            <td><p align='left'>District: </p></td>\n" +
                                "                            <td>\n" +
                                "                                <p>\n" +
                                "                                    <select name='district' style='width:100%;'>\n" +
                                "                                        <optgroup label='Hong Kong Island'>\n" +
                                "                                        <option value='Central and Western'>Central and Western</option>\n" +
                                "                                        <option value='Wan Chai'>Wan Chai</option>\n" +
                                "                                        <option value='Eastern'>Eastern </option>\n" +
                                "                                        <option value='Southern'>Southern</option>\n" +
                                "                                        <optgroup label='Kowloon'>\n" +
                                "                                        <option value='Yau Tsim Mong'>Yau Tsim Mong </option>\n" +
                                "                                        <option value='Sham Shui Po'>Sham Shui Po</option>\n" +
                                "                                        <option value='Kowloon City'>Kowloon City</option>\n" +
                                "                                        <option value='Wong Tai Sin'>Wong Tai Sin</option>\n" +
                                "                                        <option value='Kwun Tong'>Kwun Tong</option>\n" +
                                "                                        <optgroup label='New Territories'>\n" +
                                "                                        <option value='Kwai Tsing'>Kwai Tsing</option>\n" +
                                "                                        <option value='Tsuen Wan'>Tsuen Wan</option>\n" +
                                "                                        <option value='Tuen Mun'>Tuen Mun</option>\n" +
                                "                                        <option value='Yuen Long'>Yuen Long</option>\n" +
                                "                                        <option value='North'>North</option>\n" +
                                "                                        <option value='Tai Po'>Tai Po</option>\n" +
                                "                                        <option value='Sha Tin'>Sha Tin</option>\n" +
                                "                                        <option value='Sai Kung'>Sai Kung</option>\n" +
                                "                                        <option value='Islands'>Islands</option>\n" +
                                "                                    </select>\n" +
                                "                                </p>\n" +
                                "                            </td>\n" +
                                "                        </tr>\n" +
                                "                        <tr>\n" +
                                "                            <td><p align='left'>Restaurant Addresss: </p></td>\n" +
                                "                            <td><p><textarea rows='4' cols='30' name='address'></textarea></p></td>\n" +
                                "                        </tr>\n" +
                                "                        <tr>\n" +
                                "                            <td><p align='left'>Restaurant Type: </p></td>\n" +
                                "                            <td>\n" +
                                "                                <p>\n" +
                                "                                    <select name='rtype' style='width:100%;'>\n" +
                                "                                        <option value='4001'>Chinese</option>\n" +
                                "                                        <option value='4002'>Western </option>\n" +
                                "                                        <option value='4003'>Japanese </option>\n" +
                                "                                        <option value='4004'>Korean </option>\n" +
                                "                                    </select>\n" +
                                "                                </p>\n" +
                                "                            </td>\n" +
                                "                        </tr>\n" +
                                "                        <tr>\n" +
                                "                            <td><p align='left'>Restaurant Tel: </p></td>\n" +
                                "                            <td><p><input type='text' name='rtel' maxlength='8' style='width:100%;'></p></td>\n" +
                                "                        </tr>\n" +
                                "                        <tr>\n" +
                                "                            <td><p align='left'>Restaurant Email: </p></td>\n" +
                                "                            <td><p><input type='email' name='remail' maxlength='40' style='width:100%;'></p></td>\n" +
                                "                        </tr>\n" +
                                "                        <tr>\n" +
                                "                            <td><p align='left'>Description: </p></td>\n" +
                                "                            <td><p><textarea name='r_desc' cols='30' rows='10'></textarea></p></td>\n" +
                                "                        </tr>\n" +
                                "                        <tr>\n" +
                                "                            <td><p align='left'>Photo of Restuarant: </p></td>\n" +
                                "                            <td><p><input type='file' name='r_photo'> </p></td>\n" +
                                "                        </tr> </table> <hr>";
                    }

                    str += "<p><input type='submit' value='Register' style='width: 100%;'></p>    </form>";
                    
                    $("#pos").append(str);
                })
            })
        </script>
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp" />
            <jsp:include page="sidebar.jsp" />
            <div class="content">
                <h1>Restaurant Information</h1>
                <p>Please enter the number of restaurant you want to register:</p>
                <p><input type="number" id="num_rest" min="1" max="10"></p>
                <p ><input type="button" value="Confirm" id="confirm_num_rest"></p>
                <div id="pos"></div>


            </div>
            <jsp:include page="footer.jsp" />
        </div>
    </body>
</html>