<%-- 
    Document   : editRestaurant
    Created on : 2018年12月8日, 下午09:50:06
    Author     : pearh
--%>

<%@page import="ict.bean.MenuBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ict.db.MenuDB"%>
<%@page import="ict.bean.RestaurantBean"%>
<%@page import="ict.db.RestaurantDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%!
    RestaurantBean r;
    MenuDB mdb;
    ArrayList<MenuBean> mb;

%>
<%
    mdb = new MenuDB();
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
            <jsp:include page="css/element_style.css" />
        </style>
        <!--<link rel="stylesheet" href="./css/element_style.css">-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="./jslib/jquery-3.3.1.js">

        </script>

        <script>

            var temp = '<%=r.getDistrict()%>';
            var status = '<%=r.getStatus()%>';
            var success = '<%=request.getParameter("successDelete")%>';
            var start_hr = '<%=r.getStart_hour()%>';

            var close_time = '<%=r.getEnd_hour()%>';

            var start_day = "<%=r.getStart_day()%>";

            var end_day = "<%=r.getEnd_day()%>";
            var type = "<%=r.getRestTypeID()%>";
            var count = 0;

            $(document).ready(function () {

                if (success == "true") {
                    alert("The restaurant menu has been successfully deleted!");
                }
                $("#district option[value='" + temp + "']").attr('selected', 'selected');
                $("#status option[value='" + status + "']").attr('selected', 'selected');
                $("input[name=open_time]").val(start_hr);
                $("input[name=close_time]").val(close_time);
                $("#start_day option[value='" + start_day + "']").attr('selected', 'selected');
                $("#end_day option[value='" + end_day + "']").attr('selected', 'selected');

                $("#rtype option[value='" + type + "']").attr('selected', 'selected');

                $(".img").click(function () {

                    $("input[class='photo_upload']").click();
                })

                $("input[class='photo_upload']").change(function () {
                    readURL(this, $("#rest_photo"));

                })

                $("#add_upload").click(function () {
                    count++;

                    if (count == 1) {
                        $("#menus_table").css("display", "block");
                        $("#menus_table > tbody").append("<tr>\n" +
                                "    <td>" + count + "</td>\n" +
                                "    <td class='test'><img src=\"\" alt=\"\" width='90' height='90'></td>\n" +
                                "    <td><textarea name=\"menu_desc\" id=\"\" cols=\"25\" rows=\"5\"></textarea></td>\n" +
                                "    <td>\n" +
                                "        <select name=\"menu_type\" id=\"\">\n" +
                                "            <option value=\"Normal\" selected>Normal</option>\n" +
                                "            <option value=\"Breakfast\" >Breakfast</option>\n" +
                                "            <option value=\"Lunch\" >Lunch</option>\n" +
                                "            <option value=\"Tea\" >Tea</option>\n" +
                                "            <option value=\"Dinner\" >Dinner</option>\n" +
                                "        </select></td>\n" +
                                "    <td><input type=\"file\" accept=\".png, .jpeg\" class=\"photo_upload\" name=\"menu_photo\"></td>\n" +
                                "    <td><input type=\"button\" value=\"delete\"></td>\n" +
                                "</tr>");
                    } else {
                        $("tbody > tr").after("<tr>\n" +
                                "    <td>" + count + "</td>\n" +
                                "    <td class='test'><img src=\"\" alt=\"\" width='90' height='90'></td>\n" +
                                "    <td><textarea name=\"menu_desc\" id=\"\" cols=\"25\" rows=\"5\"></textarea></td>\n" +
                                "    <td>\n" +
                                "        <select name=\"menu_type\" id=\"\">\n" +
                                "            <option value=\"Normal\" selected>Normal</option>\n" +
                                "            <option value=\"Breakfast\" >Breakfast</option>\n" +
                                "            <option value=\"Lunch\" >Lunch</option>\n" +
                                "            <option value=\"Tea\" >Tea</option>\n" +
                                "            <option value=\"Dinner\" >Dinner</option>\n" +
                                "        </select></td>\n" +
                                "    <td><input type=\"file\" accept=\".png, .jpeg\" class=\"photo_upload\" name=\"menu_photo\"></td>\n" +
                                "    <td><input type=\"button\" value=\"delete\"></td>\n" +
                                "</tr>");
                    }
                })

                $(".content").on('change', '.photo_upload', function () {
                    var img = $(this).parent().siblings(".test").children("img");
                    readURL(this, img);


                });

                function readURL(input, img) {

                    if (input.files && input.files[0]) {
                        var reader = new FileReader();

                        reader.onload = function (e) {
//                            $('img').attr('src', e.target.result);
                            img.attr('src', e.target.result);
                        }

                        reader.readAsDataURL(input.files[0]);
                    }
                }

            })


        </script>
        <title>Edit Restaurant Info</title>
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp" />
            <jsp:include page="sidebar.jsp" />
            <div class="content">                
                <form action="EditRestaurantController" method="post">
                    <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
                    <a class="img" style=" ">
                        <div class="im_overlay" style=""><i class="fa fa-camera"></i></div>
                        <img src="<%=r.getRest_pic()%>" style="width:200px; height:200px;" id="rest_photo">
                    </a>
                    <input type="hidden" name="ori" value="<%=r.getRest_pic()%>">
                    <input type="file" style="display:none;" class="photo_upload" name="r_photo" >    
                    <p>Restaurant Name: <input type="text" name="rname" value="<%=r.getRestName()%>"></p>
                    <p>Telephone Number: <input type="text" name="rtel" value="<%=r.getRestTel()%>"></p>
                    <p>Email: <input type="email" name="remail" value="<%=r.getRestEmail()%>"></p>
                    <p>Restaurant Type:
                        <select name='rtype' style='width:100%;' id="rtype">
                            <option value='4001'>Chinese</option>
                            <option value='4002'>Western </option>
                            <option value='4003'>Japanese </option>
                            <option value='4004'>Korean </option>
                        </select>
                    </p>
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
                        <input type="text" name="address" value="<%=r.getAddress()%>" style="width: 100%;"></p>
                    <p>Description: <br><textarea name="r_desc" cols="30" rows="10" ><%=r.getRest_desc()%></textarea></p>
                    <p>Status: 
                        <select name="status" id="status">
                            <option value="open">Open</option>
                            <option value="defunct">defunct</option>
                        </select>
                    </p>
                    <p>Open Hour: 
                        <input type='time'  name='open_time'
                               min='00:00' max='23:59' /> - <input type='time' id='appt' name='close_time'
                               min='00:00' max='23:59'  value=""/> ( 
                        <select name='start_day' id="start_day">
                            <option value='Sunday'>Sunday</option>
                            <option value='Monday'>Monday</option>
                            <option value='Tuesday'>Tuesday</option>
                            <option value='Wednesday'>Wednesday</option>
                            <option value='Thursday'>Thursday</option>
                            <option value='Friday'>Friday</option>
                            <option value='Saturday'>Saturday</option>
                        </select> to  
                        <select name='end_day' id="end_day">
                            <option value='Sunday'>Sunday</option>
                            <option value='Monday'>Monday</option>
                            <option value='Tuesday'>Tuesday</option>
                            <option value='Wednesday'>Wednesday</option>
                            <option value='Thursday'>Thursday</option>
                            <option value='Friday'>Friday</option>
                            <option value='Saturday'>Saturday</option>
                        </select>)</p>

                    <div>
                        Uploaded Menu(s):
                        <%
                            mdb = new MenuDB();

                            if (mdb.queryByRestID(request.getParameter("id")).size()==0) {
                                out.println("No menu was found.");
                            } else {
                                mb = mdb.queryByRestID(request.getParameter("id"));
                                out.println("  <table border=\"1\"  >\n"
                                        + "                            <thead>\n"
                                        + "                                <tr>\n"
                                        + "                                    <th>No</th>\n"
                                        + "                                    <th>Menu</th>\n"
                                        + "                                    <th>Description</th>\n"
                                        + "                                    <th>Type</th>\n"
                                        + "                                    <th>Delete</th>\n"
                                        + "                                </tr>\n"
                                        + "                            </thead>\n"
                                        + "                            <tbody>");

                                for (int i = 0; i < mb.size(); i++) {
                                    String desc = mb.get(i).getMenu_desc();
                                    if (desc == null) {
                                        desc = "";
                                    }
                                    out.println("<tr>\n"
                                            + "    <td>" + (i + 1) + "</td>\n"
                                            + "    <td class='test'><img src=\"" + mb.get(i).getPath() + "\" alt=\"\" width='90' height='90'></td>\n"
                                            + "    <td><textarea name=\"menu_desc\" id=\"\" cols=\"25\" rows=\"5\">" + desc + "</textarea></td>\n"
                                            + "    <td>\n"
                                            + "        <select name=\"menu_type\" id=\"menu_type" + (i + 1) + "\">\n"
                                            + "            <option value=\"Normal\" >Normal</option>\n"
                                            + "            <option value=\"Breakfast\" >Breakfast</option>\n"
                                            + "            <option value=\"Lunch\" >Lunch</option>\n"
                                            + "            <option value=\"Tea\" >Tea</option>\n"
                                            + "            <option value=\"Dinner\" >Dinner</option>\n"
                                            + "        </select></td>\n"
                                            + "    <td><a href='UpdateMenu?id=" + mb.get(i).getID() + "'>Delete</a></td>\n"
                                            + "</tr>");
                                }

                                out.println("</tbody></table>");
                            }

                        %>



                    </div>
                    <div>

                        Upload New Menu(s):


                        <table border="1" style="display: none;" id="menus_table">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Menu</th>
                                    <th>Description</th>
                                    <th>Type</th>
                                    <th>Upload</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>

                        <!--                        <div class="photo_upload_div"> 
                                                    <input type="file" accept=".png, .jpeg" class="photo_upload" name="menu_photo">
                                                    <img src="" alt="" width="200" height="200">
                                                </div>-->
                        <input type="hidden" value="public" name="menu_status" id="status_input">
                        <input type="button" value="+" id="add_upload">
                    </div>
                    <input type="submit" value="Confirm Edit">
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
