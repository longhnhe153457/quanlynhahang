<%-- 
    Document   : ManagerProduct
    Created on : Oct 31, 2021, 11:53:52 AM
    Author     : hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Add new contact</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <a class="navbar-brand" href="HomeControl">Back to home</a>
        <div class="container">
            
            <h2>Manager product</h2>
            <td><a href="add" class="btn btn-info but" role="button" >Add product</a></td>
            <style>
                .container .but{
                    float: right;
                }
            </style>
            <form method="post" action="Searchinmanagerfood" class="form-inline">
                <div class="form-group">
                    <label for="poductname">Name:</label> <input type="name"
                                                                 class="form-control" id="name" name="name" value="${txtS}"
                                                                 placeholder="Enter name">
                </div>
                <button type="submit" class="btn btn-default">Search</button>
            </form>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Image</th>
                        <th>Price</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach items="${listP}" var="o">
                        <tr>
                            <td>${o.id}</td>
                            <td>${o.name}</td>
                            <td>
                                <img src="${o.image}">
                                <style>
                                    .table-striped img{
                                        width: 100px;
                                        height: 100px;
                                    }
                                </style>
                            </td>
                            <td>${o.price}</td>
                            <td><a href="loadproduct?pid=${o.id}"
                                   class="btn btn-info" role="button">Update</a></td>
                            <td><a href="delete?pid=${o.id}" class="btn btn-info" role="button"  onclick="showMessage(${o.id})">Delete</a></td>                               
                        </tr>
                    </c:forEach>

                </tbody>

            </table> 
            <div class="end">
                <c:forEach begin="1" end="${endP}" var="i">
                    <td><a href="managerfood?index=${i}"
                           class="btn btn-info">${i}</a></td>

                </c:forEach>       
            </div>
            <style>
                .end{
                    margin:auto;
                    margin-left: 500px;
                    margin-bottom: 50px;
                }
            </style>
        </div>
               <script>
        function showMessage(id){
            var result = confirm("Want to delete?");
            if (result===true) {
                window.location.href = 'delete?id='+id;
            }
        }
    </script>                                                 

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    </body>
</html>
