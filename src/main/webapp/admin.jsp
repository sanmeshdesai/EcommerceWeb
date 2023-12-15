<%-- 
    Document   : admin
    Created on : 31 Oct, 2023, 2:12:18 PM
    Author     : sanmesh
--%>

<%@page import="com.ecom.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.ecom.helper.FactoryProvider"%>
<%@page import="com.ecom.Dao.CategoryDao"%>
<%@page import="com.ecom.entities.User"%>
<%
    User user = (User) session.getAttribute("current user");

    if (user == null) {
        session.setAttribute("message", "you are not logged in");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "you are not admin");
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
        <title>admin</title>
        <%@include file="component/css_js.jsp" %>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/admin.css">
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>

        <div class="container ad">
            
            <div class="container-fluid mt-3" >
                <%@include file="component/message.jsp" %>
            </div>
            
            <div class="row mt-4">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 80px" class="img-fluid" src="img/user.png"/>
                            </div>

                            <h2>1234</h2>
                            <h2>Users</h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 80px" class="img-fluid" src="img/categories.png"/>
                            </div>
                            <h2>1234</h2>
                            <h2>Categories</h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 80px" class="img-fluid" src="img/cubes.png"/>
                            </div>
                            <h2>1234</h2>
                            <h2>Products</h2>
                        </div>
                    </div>
                </div>

            </div>

            <div class="row mt-4">
                <div class="col-md-6">
                    <div class="card" data-bs-toggle="modal" data-bs-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 80px" class="img-fluid" src="img/add (1).png"/>
                            </div>
                            <p class="mt-3">Click here to add Categories</p>
                            <h2>Add Categories</h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card" data-bs-toggle="modal" data-bs-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 80px" class="img-fluid" src="img/add.png"/>
                            </div>
                            <p class="mt-3">Click here to add products</p>
                            <h2>Add Products</h2>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- Button trigger modal -->
        

        <!-- add category Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Fill Category details</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">
                            
                            <input type="hidden" name="operation" value="addcategory" />
                            
                            <div class="form-group m-2">
                                <input type="text" class="form-control" name="catTitle" placeholder="enter category title" required />
                            </div>
                            <div class="form-group">
                                <textarea style="height: 150px" placeholder="enter description" name="catDesc" class="form-control" ></textarea>
                            </div>

                            <div class="container mt-5 text-center">
                                <button type="submit" class="btn btn-primary">Save</button>
                                <button type="button" class="btn btn-secondary " data-bs-dismiss="modal">Close</button>
                            </div>

                        </form>

                    </div>

                </div>
            </div>
        </div>
        
        <!-- product modal-->
        
        

<!-- Modal -->
            <div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    
                      <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                          
                          <input type="hidden" name="operation" value="addproduct" />
                          
                          <div class="form-group">
                              <input type="text" class="form-control" placeholder="Enter title of product" name="pName" required />
                              
                          </div>
                          <div class="form-group mt-2">
                                <textarea style="height: 150px" placeholder="enter description" name="pDesc" class="form-control" ></textarea>
                            </div>
                          <div class="form-group mt-2">
                              <input type="number" class="form-control" placeholder="Enter price of product" name="pPrice" required />
                              
                          </div>
                          <div class="form-group mt-2">
                              <input type="number" class="form-control" placeholder="Enter discount" name="pDescount" required />
                              
                          </div>
                          <div class="form-group mt-2">
                              <input type="number" class="form-control" placeholder="Enter quantity" name="pQuantity" required />
                              
                          </div>
                          
                          <%  
                                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                                List<Category> list = categoryDao.getCategories();
                              %>
                          
                          <div>
                              <select name="catId" class="form-control mt-2" id="">
                                  
                                  <%
                                      for(Category c: list) {
                                      
                                      
                                      %>
                                  
                                      <option value="<%= c.getCategoryId() %>"> <%= c.getCategoryTitle() %> </option>
                                 <% } %>
                              </select>
                          </div>
                          
                          <div class="form-group mt-2">
                              <label for="pPic">Select picture of product</label><br>
                              <input type="file" id="pPic" name="pPic" required />
                          </div>
                          
                          <div class="container mt-5 text-center">
                                <button type="submit" class="btn btn-primary">Save</button>
                                <button type="button" class="btn btn-secondary " data-bs-dismiss="modal">Close</button>
                            </div>
                              
                           
                              
                              
                      </form>
                      
                  </div>
                  
                </div>
              </div>
            </div>


    </body>
</html>
