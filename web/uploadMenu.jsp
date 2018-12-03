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
            $(document).ready(function () {
                $(".photo_upload").change(function () {
                    readURL(this);
                })

                function readURL(input) {

                    if (input.files && input.files[0]) {
                        var reader = new FileReader();

                        reader.onload = function (e) {
                            $('img').attr('src', e.target.result);
                        }

                        reader.readAsDataURL(input.files[0]);
                    }
                }
            })
        </script>
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp" />
            <jsp:include page="sidebar.jsp" />
            <div class="content">

                <h1>Upload Menu(s)</h1>
                <form action="UploadMenuController" method="post">
                    <input type="file" accept=".png, .jpeg" class="photo_upload" name="menu_photo">
                    <input type="hidden" value="public" name="status">
                    <input type="submit" value="Upload File">
                    <img src="" alt="">
                </form>
            </div>
            <jsp:include page="footer.jsp" />
        </div>
    </body>
</html>
