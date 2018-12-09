<%-- 
    Document   : uploadMenu
    Created on : 2018年12月1日, 下午11:37:50
    Author     : pearh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload Menu</title>
        <style type="text/css">
            <jsp:include page="css/style.css" />
        </style>
        <script src="./jslib/jquery-3.3.1.js">

        </script>
        <script>
            var count = 0;
            $(document).ready(function () {
//                $(".photo_upload").change(function () {
//                    var img = $(this).siblings("img");
//                    readURL(this, img);
//                })

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

                $(".content").on('change', '.photo_upload', function () {
                    var img = $(this).siblings("img");
                    readURL(this, img);
                    if (count == 0) {
                        $("<table boder>  <thead>\n" +
                                "                            <tr>\n" +
                                "                             <th>No</th>\n" +
                                "                                <th>Menu</th>\n" +
                                "                                <th></th>\n" +
                                "                            </tr>\n" +
                                "                        </thead> </table>").insertBefore("#status_input");
                    }

                });

                $("#add_upload").click(function () {
                    $("<div class='photo_upload_div'>  \n\
            <input type='file' accept='.png, .jpeg' class='photo_upload' name='menu_photo'>\n\
 <img src='' alt=''></div> ").insertBefore("#status_input");
                })
            })
        </script>
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp" />
            <jsp:include page="sidebar.jsp" />
            <div class="content">

                <div style=" width:100%; height:50px; text-align: center; padding-top:30px;">
                    Nice! Complete the last step to finish the registration! </div>

                <form action="UploadMenuController" method="post">
                    <p>Upload the menu(s) of the restaurant:</p>
                    
                    <div class="photo_upload_div"> 
                        <input type="file" accept=".png, .jpeg" class="photo_upload" name="menu_photo">
                        <img src="" alt="" width="200" height="200">
                    </div>
                    <input type="hidden" value="public" name="status" id="status_input">
                    <input type="button" value="+" id="add_upload">
                    <input type="submit" value="Upload File">

                </form>
            </div>
            <jsp:include page="footer.jsp" />
        </div>
    </body>
</html>
