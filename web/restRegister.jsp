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
                $("#confirm_num_rest").click(function(){
                    alert("njdsn");
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
                <p><input type="button" value="Confirm" id="confirm_num_rest"></p>
                
                
            </div>
            <jsp:include page="footer.jsp" />
        </div>
    </body>
</html>