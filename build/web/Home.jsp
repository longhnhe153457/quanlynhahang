<%-- 
    Document   : Home
    Created on : Oct 30, 2021, 12:20:35 AM
    Author     : hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Food Menu</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="style.css">
        <!-- fontawesome icon -->

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
    </head>
    <body>
        <nav>
            <div class="logo">
                Tuan Hiep
            </div>
            <input type="checkbox" id="click">
            <label for="click" class="menu-btn">
                <i class="fas fa-bars"></i>
            </label>
            <ul>
                <li><a class="active" href="HomeControl">Home</a></li>
                    <c:if test="${sessionScope.acc.isSell==1}">
                    <li><a href="managerfood">MangerFood</a></li>
                    </c:if>
                    <c:if test="${sessionScope.acc.isAdmin==1}">
                    <li><a href="Homeemployeecontrol">ManagerEmployee</a></li>
                    </c:if>
                    <c:if test="${sessionScope.acc!=null}">
                    <li><a href="#">Hello ${sessionScope.acc.user}</a></li>
                    <li><a href="logout">Logout</a></li>
                </c:if>
                <c:if test="${sessionScope.acc==null}">         
                    <li><a href="login">Login</a></li>
                    </c:if> 

            </ul>
        </nav>
        <section class = "menu">
            <div class = "menu-container">
                <div class = "menu-head">
                    <h2>Special Food Menu</h2>
                    <p>Chẳng cần phải là người sành ăn, bất cứ ai cũng có thể chọn cho mình những quán ăn “ruột” để thưởng thức những món ăn khoái khẩu, ngon miệng và hấp dẫn.</p>
                </div>

                <div class="choose">
                    <c:forEach items="${listC}" var="o">
                        <li class="list-group-item text-white"><a href="category?categoryID=${o.categoryID}">${o.cname}</a></li>
                        </c:forEach>

                </div>
                <div class="but">
                    <form action="search" method="post">
                        <input value="${txtS}" type="text" name="txt" placeholder="Search...">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>
                <div class = "food-items">

                    <!-- item -->
                    <c:forEach items="${listP}" var="o">
                        <div class = "food-item featured">
                            <div class="card-img-top">
                                <img src = "${o.image}" alt = "food image" >
                            </div>
                            <div class = "food-content">
                                <div class = "line"></div>
                                <h3 class = "food-price">${o.price}</h3>
                                <ul class = "rating">
                                    <li><i class = "fas fa-star"></i></li>
                                    <li><i class = "fas fa-star"></i></li>
                                    <li><i class = "fas fa-star"></i></li>
                                    <li><i class = "fas fa-star"></i></li>
                                    <li><i class = "far fa-star"></i></li>
                                </ul>
                                <p class = "category"><a href="#">${o.name}</a></p>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                </body>
                </html>
