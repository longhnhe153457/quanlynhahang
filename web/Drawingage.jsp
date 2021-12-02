<%-- 
    Document   : test
    Created on : Oct 20, 2021, 11:08:33 AM
    Author     : hoang
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="context.DBContext"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <script  src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script> 
    </head> 
    <body onload="hpmpGraph()">      
        <script>
            function hpmpGraph() {
                        var hp = document.hpmpForm.age1.value,
                        mp = document.hpmpForm.age2.value,
                        zp = document.hpmpForm.age3.value,
                        td = document.hpmpForm.age4.value,
                        ctx = document.getElementById('hpmpratio').getContext('2d');
                const myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: ["20", "20-30", "30-40", "40"],
                        datasets: [
                            {
                                label: "Number of peope (/person)",
                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9",],
                                data: [hp, mp, zp, td]
                            }
                        ]
                    },
                    options: {
                        legend: {display: false},
                        title: {
                            display: true,
                            text: 'AGE CHART'
                        }
                    }
                });
            }
        </script>     

        <form name="hpmpForm" method="post">
            <%
                try {
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
                    Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ManagerFood", "sa", "long");
                    Statement st = con.createStatement();
                    String strQuery = "select count(*) from Person where age<20";
                    ResultSet rs = st.executeQuery(strQuery);
                    String Countrow = "";
                    while (rs.next()) {
                        Countrow = rs.getString(1);
                        request.setAttribute("test1", Countrow);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
            <%
                try {
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
                    Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ManagerFood", "sa", "long");
                    Statement st = con.createStatement();
                    String strQuery2 = "select count(*) from Person where age>=20 and age<30";
                    ResultSet rs = st.executeQuery(strQuery2);
                    String Countrow = "";
                    while (rs.next()) {
                        Countrow = rs.getString(1);
                        request.setAttribute("test2", Countrow);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
            <%
                try {
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
                    Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ManagerFood", "sa", "long");
                    Statement st = con.createStatement();
                    String strQuery2 = "select count(*) from Person where age>=30 and age<40";
                    ResultSet rs = st.executeQuery(strQuery2);
                    String Countrow = "";
                    while (rs.next()) {
                        Countrow = rs.getString(1);
                        request.setAttribute("test3", Countrow);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
            <%
                try {
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
                    Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ManagerFood", "sa", "long");
                    Statement st = con.createStatement();
                    String strQuery2 = "select count(*) from Person where age>=40";
                    ResultSet rs = st.executeQuery(strQuery2);
                    String Countrow = "";
                    while (rs.next()) {
                        Countrow = rs.getString(1);
                        request.setAttribute("test4", Countrow);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
            <input type="text" name="age1"  value="<%=request.getAttribute("test1")%>" hidden>
            <br>
            <input type="text" name="age2"  value="<%=request.getAttribute("test2")%>" hidden>
            <br> 
            <input type="text" name="age3"  value="<%=request.getAttribute("test3")%>" hidden>
            <br>
            <input type="text" name="age4" value="<%=request.getAttribute("test4")%>" hidden>
            <canvas id="hpmpratio" ></canvas> 
        </form>  
    </body>
</html>