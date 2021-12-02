<%-- 
    Document   : addproduct
    Created on : Oct 31, 2021, 1:37:49 PM
    Author     : hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
             <a class="navbar-brand" href="managerfood">Back to food</a>             
           <div class="container">
               
                    <form action="add" method="post">
                        
                        <h2>Add person</h2>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Name</label>
                            <input name="name" type="text" class="form-control" id="exampleInputEmail1" placeholder="Name">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Image</label>
                            <input name="image" type="text" class="form-control" id="exampleInputEmail1" placeholder="Image">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Price</label>
                            <input name="price" type="text" class="form-control" id="exampleInputEmail1" placeholder="Price">
                        </div>
                        <div class="row">
                            <label class="col-md-4" for="exampleInputEmail1">Category</label>
                            <select name="category" class="form-control col-md-7">
                                <c:forEach items="${listC}" var="o">
                                    <option value="${o.categoryID}">${o.cname}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Add Food</button>
                    </form>
                </div>
          
    </body>
</html>
