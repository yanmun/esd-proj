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
    </head>
    <body>
          <div class="container">
            <jsp:include page="header.jsp" />
            <jsp:include page="sidebar.jsp" />
            <div class="content">
                <form action="action" method="get">
                    <input type="file" accept=".png, .jpeg">
                    <input type="submit" value="Upload File">
                    <img src="" alt="">
                </form>
            </div>
            <jsp:include page="footer.jsp" />
        </div>
    </body>
</html>
