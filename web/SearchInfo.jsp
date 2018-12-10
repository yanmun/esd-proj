<%-- 
    Document   : SearchInfo
    Created on : 2018年12月10日, 上午07:36:00
    Author     : pearh
--%>

<%@page import="ict.db.KeywordDB"%>
<%@page import="ict.bean.KeywordBean"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%!
    KeywordBean r;
    KeywordDB mdb =  new KeywordDB();
    ArrayList<KeywordBean> mb;

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search History</title>
        <style type="text/css">
            <jsp:include page="css/style.css" />
        </style>
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp" />
            <jsp:include page="sidebar.jsp" />
            <div class="content">                
                <h1>Search History </h1>
                 <%
                           

                            if (!mdb.queryAllRecord()) {
                                out.println("No menu was found.");
                            } else {
                                mb = mdb.queryByOrderedKw();
                                out.println("  <table border=\"1\"  >\n"
                                        + "                            <thead>\n"
                                        + "                                <tr>\n"
                                        + "                                    <th>No</th>\n"
                                        + "                                    <th>Keyword</th>\n"
                                        + "                                    <th>Time(s)</th>\n"
                                       
                                        + "                                </tr>\n"
                                        + "                            </thead>\n"
                                        + "                            <tbody>");

                                for (int i = 0; i < mb.size(); i++) {
//                                    String desc = mb.get(i).getMenu_desc();
//                                    if (desc == null) {
//                                        desc = "";
//                                    }
                                    out.println("<tr>\n"
                                            + "    <td>" + (i + 1) + "</td>\n"
                                            + "    <td class='test'>"+mb.get(i).getKeyword()+"</td>\n"
                                            + "    <td>"+mb.get(i).getCount()+"</td>\n"
                                    
                                            + "</tr>");
                                }

                                out.println("</tbody></table>");
                            }

                        %>
            </div>
            <jsp:include page="footer.jsp" />
        </div>
    </body>
</html>

