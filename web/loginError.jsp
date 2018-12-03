<%-- 
    Document   : loginError
    Created on : 2018年11月5日, 下午05:12:36
    Author     : SM-LAU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Error</title>
        <style type="text/css">
            <jsp:include page="css/style.css" />
        </style>
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp" />
            <jsp:include page="sidebar.jsp" />
            <div class="content">
                <p>Incorrect Password</p>
                <p>
                    <% out.println("<a href=\"" + request.getContextPath() + "/LoginController\">Login again</a>");%>
                </p>
            </div>
            <jsp:include page = "footer.jsp" />
        </div>
    </body>
</html>
