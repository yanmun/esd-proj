<div class="sidebar1">
    <ul class="nav">
        <li><a href="showRestaurant?action=list">Find Restaurants</a></li>
        <li><a href="register.jsp">Register</a></li>
        
          <%
            if(session.getAttribute("userInfo")==null){
                out.println("  <li><a href='login.jsp'>Login</a></li>   ");
            }
            %>
<!--        <li><a href="restRegister.jsp">restRegister</a></li>-->
        <li><a href="uploadMenu.jsp">upload menu</a></li>
        <li><a href="handleEdit?action=list">All User</a></li>
       
        
        <%
            if(session.getAttribute("userInfo")!=null){
                out.println("<li><a href='LoginController?action=logout'>Logout</a></li> ");
            }
            %>
    </ul> 
    <p>If you would like the navigation along the top, simply move thse ul.nav to the top of the page and recreate the styling.</p>
</div>