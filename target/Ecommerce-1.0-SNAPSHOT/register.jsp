<%-- 
    Document   : Register
    Created on : 30 Oct, 2023, 4:43:48 PM
    Author     : sanmesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <%@include file="component/css_js.jsp" %>
        <link rel="stylesheet" href="css/style.css">


    </head>
    <body>
        <%@include file="component/navbar.jsp" %>

        <div class="container-fluid">
            <div class="row mt-5">
                <div class="col-md-4  offset-md-4">
                    <div class="card">
                        <%@include file="component/message.jsp" %>
                        <div class="card-body px-5">
                            <h3 class="text-center my-3">Register here</h3>
                            <form action="RegisterServlet" method="post">
                                <div class="mb-3">
                                    <label for="name" class="form-label">Username</label>
                                    <input type="text" name="user_name" class="form-control" id="name" placeholder="enter name" >
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" name="user_email" class="form-control" id="email" placeholder="enter email" >
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Password</label>
                                    <input type="password" name="user_password" class="form-control" id="password" placeholder="enter password" >
                                </div>
                                <div class="mb-3">
                                    <label for="phone" class="form-label">Phone</label>
                                    <input type="number" name="user_phone" class="form-control" id="phone" placeholder="enter phone" >
                                </div>
                                <div class="mb-3">
                                    <label for="address" class="form-label">Address</label>
                                    <textarea name="user_address" style="height: 100px" class="form-control" placeholder="enter address"></textarea>
                                </div>
                                <a class="text-center d-block mb-3" href="login.jsp">click here to login</a>


                                <div class="container text-center">
                                    <button class="btn btn-primary">Register</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </body>
</html>
