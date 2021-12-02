<%-- 
    Document   : Login
    Created on : Oct 29, 2021, 11:27:02 PM
    Author     : hoang
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Food Menu</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="login.css">
        <!-- fontawesome icon -->

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
    </head>
    <body>
        <div class="form">
            <div class="tab-header">
                <div >Sign Up</div>
                <div class="active">Sign In</div>
            </div>

            <div class="tab-content">
                <div class="tab-body">
                    <form class="form-signup" action ="signup" method="post">
                        <div class="form-element">
                            <input type="text" placeholder="Username" name="user">
                        </div>
                        <div class="form-element">
                            <input type="password" placeholder="Password" name="pass">
                        </div>
                        <div class="form-element">
                            <input type="password" placeholder="Repassword" name="repass">
                        </div>
                        <div class="form-element">
                            <button type="submit">Sign Up</button>
                        </div>
                    </form>
                </div>
    <div class="tab-body active">

                    <form class="form-signin" action ="login" method="post">
                        <div class="form-element">
                            <input type="text" value="${username}" placeholder="Username" name="user">
                        </div>
                        <div class="form-element">
                            <input type="password" value="${password}" placeholder="Password" name="pass">
                        </div>
<!--                     <div class="form-group form-check">
                            <input name="remember" value="1" type="checkbox" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">Remember me</label>
                        </div>
            -->
                        <div class="form-element">
                            <button type="submit">Sign In</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            let tabPanes = document.getElementsByClassName("tab-header")[0].getElementsByTagName("div");

            for (let i = 0; i < tabPanes.length; i++) {
                tabPanes[i].addEventListener("click", function () {
                    document.getElementsByClassName("tab-header")[0].getElementsByClassName("active")[0].classList.remove("active");
                    tabPanes[i].classList.add("active");

                    document.getElementsByClassName("tab-content")[0].getElementsByClassName("active")[0].classList.remove("active");
                    document.getElementsByClassName("tab-content")[0].getElementsByClassName("tab-body")[i].classList.add("active");
                });
            }
        </script>
    </body>
</html>
