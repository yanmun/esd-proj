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
        <title>Register</title>
        <style type="text/css">
            <jsp:include page="css/style.css" />
        </style>
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp" />
            <jsp:include page="sidebar.jsp" />
            <div class="content">
                <h1>Restaurant Register</h1>
                <form method="post" action="main">
                    <input type="hidden" name="action" value="register">
                    <table border="0">
                        <tr>
                            <td><p align="left">Restaurant Name: </p></td>
                            <td><p><input type="text" name="rname" maxlength="50" size="30"></p></td>
                        </tr>
                        <tr>
                            <td><p align="left">District: </p></td>
                            <td>
                                <p>
                                    <select name="district" style="width:100%;">
                                        <option value="hk">Hong Kong Island</option>
                                        <option value="kl">Kowloon </option>
                                        <option value="nt">New Territories</option>
                                    </select>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td><p align="left">Restaurant Type: </p></td>
                            <td>
                                <p>
                                    <select name="rtype" style="width:100%;">
                                        <option value="chinese">Chinese</option>
                                        <option value="western">Western </option>
                                        <option value="japanese ">Japanese </option>
                                        <option value="korean ">Korean </option>
                                    </select>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td><p align="left">Restaurant Tel: </p></td>
                            <td><p><input type="text" name="rtel" maxlength="8" size="30"></p></td>
                        </tr>
                        <tr>
                            <td><p align="left">Restaurant Email: </p></td>
                            <td><p><input type="email" name="remail" maxlength="40" size="30"></p></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><p><input type="submit" value="Register" style="width: 100%"></p></td>
                        </tr> 
                    </table>
                </form>
            </div>
            <jsp:include page="footer.jsp" />
        </div>
    </body>
</html>