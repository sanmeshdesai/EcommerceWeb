<%-- 
    Document   : navbar
    Created on : 30 Oct, 2023, 4:25:36 PM
    Author     : sanmesh
--%>


<%@page import="com.ecom.entities.User"%>
<%
    User user1 = (User) session.getAttribute("current user");

%>












<nav class="navbar navbar-expand-lg bg-body-tertiary custom-bg">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">ECommerce</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse text-white"  id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Categories
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto " >
                
                <li class  
                    ="nav-item active">
                    <a class ="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#cart"> <i class="fa fa-cart-plus " style="font-size: 20px ; color: white " ></i> <span class="ml-2 cart-items">( 0 )</span>   </a> </li>
                
                
                <%                if (user1 == null) {

                %>
                <li class  
                    ="nav-item active">
                    <a class ="nav-link" href="login.jsp" >Login</a> </li>
                <li class ="nav-item active">
                    <a  class ="nav-link" href="register.jsp" >Register</a> </li> 
                        <%                                } else {

                        %>
                        <li class  
                            ="nav-item active">
                            <a  class  ="nav-link" href="#" > <%= user1.getUserName()%> </a > </li>
                                <li class   ="nav-item active">
                                    <a   class  ="nav-link" href="LogoutServlet" >Logout</a > </li > 

                                        <%             
                                            }
                                        %>


                                        </ul> 

                                        </div>
                                        </div>
                                        </nav>