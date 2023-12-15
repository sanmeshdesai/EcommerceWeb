<%-- 
    Document   : normal
    Created on : 31 Oct, 2023, 2:12:33 PM
    Author     : sanmesh
--%>

<%@page import="com.ecom.entities.User"%>
<%
    User user = (User) session.getAttribute("current user");

    if (user == null) {
        session.setAttribute("message", "you are not logged in");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("admin")) {
            session.setAttribute("message", "log in as admin");
            response.sendRedirect("login.jsp");
            return;
        }

    }


%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <%@include file="component/css_js.jsp" %>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>

        <h1>normal user</h1>
    </body>
</html>
