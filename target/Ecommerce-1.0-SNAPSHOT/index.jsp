<%-- 
    Document   : index
    Created on : 30 Oct, 2023, 11:14:17 AM
    Author     : sanmesh
--%>

<%@page import="com.ecom.helper.Helper"%>
<%@page import="com.ecom.entities.Category"%>
<%@page import="com.ecom.Dao.CategoryDao"%>
<%@page import="com.ecom.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.ecom.Dao.ProductDao"%>
<%@page import="com.ecom.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecommerce</title>

        <%@include file="component/css_js.jsp" %>
        
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
        
        

        <div class="container-fluid">
        <div class="row">

            <% 
                String cat = request.getParameter("category");
                
                ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                List<Product> list = null;
                 if (cat==null || cat.trim().equals("all")) {
                
                  list = dao.getAllProduct();
                  
                } else {
                    int cid = Integer.parseInt(cat.trim());
                    list = dao.getProductByCat(cid);
                }
                
                
                
                
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist = cdao.getCategories();

            %>

            <div class="col-md-2 mt-3 mx-3">

                <div class="list-group">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active" aria-current="true">Categories  </a>





                    <%                for (Category c : clist) {

                    %> 

                    <a href="index.jsp?category=<%= c.getCategoryId() %>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>


                    <%
                        }
                    %>

                </div>
            </div>


            <div class="col-md-8">
                <div class="row mt-4">
                    <div class="col-md-12">
                        <div class="card-columns">

                            <div class="row row-cols-3 g-4">
                            <%
                                for (Product p : list) {
                            %>

                                <div class="col">
                                    <div class="card product-card">
                                        <div class="container text-center">
                                        <img src="img/products/<%= p.getpPhoto() %>" class="card-img-top m-2" style="max-height: 250px; max-width: 280px; margin: auto">
                                        
                                        </div>
                                        <div class="card-body">
                                            <h5 class="card-title"> <%= p.getpName() %> </h5>
                                            <p class="card-text">
                                                <%= Helper.getWords(p.getpDesc()) %>
                                            </p>
                                            <div class="text-center">
                                                <button class="btn custom-bg text-white" onclick="add_to_cart(<%= p.getpId()%>,'<%= p.getpName()%>',<%= p.getPriceAfterApplyingDisount() %>)">Add to Cart</button> 
                                                <button class="btn btn-outline-success ">&#8377;<%= p.getPriceAfterApplyingDisount() %> <span class="text-secondary discount-label "> <%= p.getpPrice() %> <%= p.getpDiscount() %>%off </span> </button> 
                                            </div>
                                        </div>
                                            
                                            
                                    </div>
                                </div>

                                <%
                                    }
                                        
                                    if(list.size()==0) {
                                        out.println("<h3>No iteam in category</h3>");
                                    }



                                %>

                            </div>
                        </div>l
                    </div>



                </div>



            </div>

        </div>
    </div>
                                
                                
                                <%@include file="component/common_modals.jsp" %>
    </body>
</html>
