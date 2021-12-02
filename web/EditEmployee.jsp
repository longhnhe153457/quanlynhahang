<%-- 
    Document   : edit
    Created on : Oct 31, 2021, 8:19:13 PM
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
                          
           <div class="container">
               
                    <form action="EditEmployee" method="post">
                        
                        <h2>Edit food</h2>
                         <div class="form-group">
                            <label for="exampleInputEmail1">ID</label>
                            <input name="id" type="text" class="form-control" id="exampleInputEmail1" placeholder="Name" value="${detail.personID}" readonly>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Name</label>
                            <input name="name" type="text" class="form-control" id="exampleInputEmail1" placeholder="Name" value="${detail.name}">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Age</label>
                            <input name="age" type="text" class="form-control" id="exampleInputEmail1" placeholder="Image" value="${detail.age}">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Address</label>
                            <input name="address" type="text" class="form-control" id="exampleInputEmail1" placeholder="Price" value="${detail.address}">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">JoinDate</label>
                            <input name="joinDate" type="text" class="form-control" id="exampleInputEmail1" placeholder="Description" value="${detail.joinDate}">
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label for="exampleInputEmail1">Gender</label>
                            </div>
                            <div class="form-check col-md-4">
                                <input class="form-check-input" type="radio" name="gender" id="exampleRadios1" value="1" ${detail.gender==1?"checked":""}>
                                <label class="form-check-label" for="exampleRadios1">
                                    Male
                                </label>
                            </div>
                            <div class="form-check col-md-4">
                                <input class="form-check-input" type="radio" name="gender" id="exampleRadios2" value="0"  ${detail.gender==0?"checked":""}>
                                <label class="form-check-label" for="exampleRadios2">
                                    Female
                                </label>
                            </div>
                        </div>
                        <div class="row">
                            <label class="col-md-4" for="exampleInputEmail1">Position</label>
                            <select name="position" class="form-control col-md-7">
                                <c:forEach items="${listC}" var="o">
                                    <option value="${o.pid}">${o.pname}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Edit</button>
                      
                    </form>
                </div>
          
    </body>
</html>
