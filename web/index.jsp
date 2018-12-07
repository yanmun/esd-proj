<%-- 
    Document   : index
    Created on : 2018年11月30日, 上午02:15:07
    Author     : pearh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <style type="text/css">
            <jsp:include page="css/style.css" />
        </style>
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp" />
            <jsp:include page="sidebar.jsp" />
            <div class="content">                
                <p>Welcome!</p>
                <% 
                    
                    String msg = (String) request.getAttribute("msg");
                    if (msg != null) {
                        out.println("<p>");
                        out.println(msg);
                        out.println("</p>");
                    }
                %>
            </div>
            <jsp:include page="footer.jsp" />
        </div>
    </body>
</html>
