<%-- 
    Document   : ManagerProduct
    Created on : Oct 31, 2021, 11:53:52 AM
    Author     : hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
              <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
            
            <h2>Manager Employee</h2>
            <td><a href="addemployee" class="btn btn-info but" role="button" >Add Employee</a></td>
            <style>
                .container .but{
                    float: right;
                   
                }
               
            </style>
            <div class="form-inline-block my-1 my-lg-0 col-sm-6">
            <form action="searchemployee" method="post">
                    <input name="txt" class="form-control mr-sm-2 col-sm-10" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
                <br>
              <form action="drawing" method="post" >
                    <select name="draw" class="form-control mr-sm-2 col-sm-10">
                        <option>Position</option>
                        <option>Age</option>
                        <option>Gender</option>
                    </select>
                     <button class="btn btn-outline-success my-2 my-sm-0 btn-danger" type="submit">Draw</button>
                </form>
            </div>
            <div class="filter">
                
                                                                  <form action="filter" method="post">
                            <select onchange="this.form.submit()" name="pid" class="form-control form-control-lg">
                                <option value="0">----------All----------</option>
                                <c:forEach items="${listP}" var="o">
                                    <option ${pid == o.pid?"selected":""} value="${o.pid}">${o.pname}</option>
                                </c:forEach>
                            </select>
                        </form>
    </div>
          
            <style>
                .form-inline {
                    float: left;
                }
                .filter{
                    margin-top: 70px;
                    width: 20%;
                    margin-left: 80%;
                }
            </style>                                            
            <table class="table table-striped">
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
                <c:forEach begin="1" end="${endP}" var="i">
                    <td><a href="managerfood?index=${i}"
                           class="btn btn-info">${i}</a></td>

                </c:forEach>       
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
