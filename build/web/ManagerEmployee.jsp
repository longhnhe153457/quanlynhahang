<%-- 
    Document   : Home
    Created on : Oct 20, 2020, 8:36:48 AM
    Author     : trinh
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
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="HomeControl">Back to home</a>
            <a class="navbar-brand" href="Addnewemployee" hidden="">Home</a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">

                </ul>
                <form action="searchemployee" method="post" class="form-inline my-2 my-lg-0 col-sm-6">
                    <input name="txt" class="form-control mr-sm-2 col-sm-10" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </nav>
        <br>
        <div class="row">
            <div class="col-md-2">
                <form action="drawing" method="post">
                    <select name="draw" class="form-control form-control-lg">
                        <option>Position</option>
                        <option>Age</option>
                        <option>Gender</option>
                    </select>
                    <a>
                        <button type="submit" class="btn btn-danger">Draw</button>
                    </a>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 mt-5">
                <div class="row">
                    <div class="col-md-1">
                    </div>
                    <div class="col-md-3">
                        <h3>Filter</h3>
                    </div>
                    <div class="col-md-8">
                        <form action="filter" method="post">
                            <select onchange="this.form.submit()" name="pid" class="form-control form-control-lg">
                                <option value="0">----------All----------</option>
                                <c:forEach items="${listP}" var="o">
                                    <option ${pid == o.pid?"selected":""} value="${o.pid}">${o.pname}</option>
                                </c:forEach>
                            </select>
                        </form>
                    </div>
                </div>
                <div class="container mt-5">
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
                </div>
            </div>
            <div class="col-lg-9">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Name</th>
                            <th scope="col">Age</th>
                            <th scope="col">Gender</th>
                            <th scope="col">Address</th>
                            <th scope="col">Join date</th>
                            <th scope="col">Position</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list}" var="o" varStatus="i">
                            <tr>
                                <th scope="row">${o.personID}</th>
                                <td>${o.name}</td>
                                <td>${o.age}</td>
                                <c:if test="${o.gender == 1}">
                                    <td class="text-primary">
                                        <i class="fa fa-male" aria-hidden="true"></i>
                                        Male
                                    </td>
                                </c:if>
                                <c:if test="${o.gender == 0}">
                                    <td class="text-success">
                                        <i class="fa fa-female" aria-hidden="true"></i>
                                        Female
                                    </td>
                                </c:if>
                                <td>${o.address}</td>
                                <td>${o.joinDate}</td>
                                <td>${o.pname}</td>
                                <td>
                                    <a href="loadEmployee?eid=${o.personID}">
                                        <button type="button" class="btn btn-primary">Edit</button>
                                    </a>
                                <a href="deleteemployee?id=${o.personID}"  class="btn btn-danger" role="button"  onclick="showMessage(${o.personID})">Delete</a>     
                                </td>
                            </tr>
                        
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <script>
                                function showMessage(id) {
                                    var result = confirm("Want to delete?");
                                    if (result === true) {
                                        window.location.href = 'deleteemployee?id' + id;
                                    }
                                }
                        </script>  

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    </body>
</html>
