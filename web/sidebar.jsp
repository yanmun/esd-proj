<%@page import="ict.bean.UserInfo"%>
<%@page import="ict.bean.UserBean"%>
<div class="sidebar1">
    <ul class="nav">
        <li><a href="showRestaurant?action=list">Find Restaurants</a></li>


        <%
            if (session.getAttribute("userInfo") == null) {
                out.println("  <li><a href='register.jsp'>Register</a></li>   ");
                out.println("  <li><a href='login.jsp'>Login</a></li>   ");
            }
        %>
        <!--        <li><a href="restRegister.jsp">restRegister</a></li>-->

        <%
            UserInfo ub = (UserInfo) session.getAttribute("userInfo");
            if (ub != null) {
//                out.println("  <li><a href='welcome.jsp'>" + ub.getType() + "</a></li>   ");
                if (ub.getType().equals("Normal User")) {
                    
                    out.println("<li><a href='welcome.jsp'>Favorite Restaurant and Menu</a></li>");
                }

                if (ub.getType().equals("Restaurant Owner")) {
                 out.println("<li><a href='restRegister.jsp'>Owned Restaurants</a></li>");
                    out.println("<li><a href='restRegister.jsp'>Restaurant Registration</a></li>");
                }
                
                 out.println("  <li><a href='welcome.jsp'>User Profile</a></li>   ");
            }

//            if(ub.getType()){
//                 out.println("  <li><a href='register.jsp'>Register</a></li>   ");
//                out.println("  <li><a href='login.jsp'>Login</a></li>   ");
//            }
        %>

        <li><a href="uploadMenu.jsp">upload menu</a></li>
        <li><a href="handleEdit?action=list">All User</a></li>


        <%  if (session.getAttribute("userInfo") != null) {
                out.println("<li><a href='LoginController?action=logout'>Logout</a></li> ");
            }
        %>
    </ul> 
    <p>If you would like the navigation along the top, simply move thse ul.nav to the top of the page and recreate the styling.</p>
</div>