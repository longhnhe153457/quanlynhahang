<%-- 
    Document   : Addnewemployee
    Created on : Dec 14, 2021, 10:42:12 AM
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
           <form action="addemployee" method="post">
                        <h2>Add person</h2>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Full Name</label>
                            <input name="name" type="text" class="form-control" id="exampleInputEmail1" placeholder="input name">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Age</label>
                            <input name="age" type="text" class="form-control" id="exampleInputEmail1" placeholder="Age">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Address</label>
                            <input name="address" type="text" class="form-control" id="exampleInputEmail1" placeholder="input address">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Join date</label>
                            <input name="join" type="text" class="form-control" id="exampleInputEmail1" placeholder="yyyy-MM-dd">
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label for="exampleInputEmail1">Gender</label>
                            </div>
                            <div class="form-check col-md-4">
                                <input class="form-check-input" type="radio" name="gender" id="exampleRadios1" value="1" checked>
                                <label class="form-check-label" for="exampleRadios1">
                                    Male
                                </label>
                            </div>
                            <div class="form-check col-md-4">
                                <input class="form-check-input" type="radio" name="gender" id="exampleRadios2" value="0">
                                <label class="form-check-label" for="exampleRadios2">
                                    Female
                                </label>
                            </div>
                        </div>
                        <div class="row">
                            <label class="col-md-4" for="exampleInputEmail1">Position</label>
                            <select name="pid" class="form-control col-md-7">
                                <c:forEach items="${listP}" var="o">
                                    <option value="${o.pid}">${o.pname}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Add person</button>
                    </form>
                
    </body>
    <style>
        .body{
            width: 90%;
        }
    </style>
</html>
