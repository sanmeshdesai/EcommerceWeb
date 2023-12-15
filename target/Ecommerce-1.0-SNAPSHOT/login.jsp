<%-- 
    Document   : login
    Created on : 30 Oct, 2023, 5:46:28 PM
    Author     : sanmesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <%@include file="component/css_js.jsp" %>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card mt-5">
                        <div class="card-header custom-bg text-center text-white">
                            <h3>Login</h3>
                        </div>
                        <div class="card-body">
                            <%@include file="component/message.jsp" %>

                            <form action="LoginServlet" method="post">
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email address</label>
                                    <input type="email" name="email" class="form-control" id="email">
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Password</label>
                                    <input type="password" name="password" class="form-control" id="password">
                                </div>


                                <a class="text-center d-block mb-3" href="register.jsp">click here to register</a>

                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary">Submit</button>

                                </div>

                            </form>

                        </div>
                    </div>
                </div>
            </div>

    </body>
</html>
