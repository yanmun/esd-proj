<%-- 
    Document   : editRestaurant
    Created on : 2018年12月8日, 下午09:50:06
    Author     : pearh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css">
            <jsp:include page="css/style.css" />
        </style>
        <title>Edit Restaurant Info</title>
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp" />
            <jsp:include page="sidebar.jsp" />
            <div class="content">                
                <%
                    if(request.getParameter("id")!=null){
                        
                    }
                %>
           
            </div>
            <jsp:include page="footer.jsp" />
        </div>
    </body>
</html>
