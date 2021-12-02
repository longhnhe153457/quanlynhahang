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
        <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.4.0/dist/chartjs-plugin-datalabels.min.js"></script> 
    </head> 
    <body onload="hpmpGraph()">      
        <script>
            function hpmpGraph() {
                var hp = document.hpmpForm.Manager.value,
                        mp = document.hpmpForm.Leader.value,
                        zp = document.hpmpForm.Employee.value,
                        ctx = document.getElementById('hpmpratio').getContext('2d');
                var data = {
                    labels: ["Manager", "Leader", "Employee"],
                    labbels:{
                        margin:'600',
                    },
                    datasets:
                            [{
                                    data: [hp, mp, zp],
                                    backgroundColor: ["#EF0000", "#0000EF", "#00EF00"],
                                    hoverBackgroundColor: ["#FF0000", "#0000FF", "#00EF00"],
                                }]
                            
                };
                var options = {
                    tooltips: {
                        enabled: false
                    },
                    plugins: {
                        datalabels: {
                            formatter: (value, ctx) => {

                                let sum = ctx.dataset._meta[0].total;
                                let percentage = (value * 100 / sum).toFixed(2) + "%";
                                return percentage;


                            },
                            color: '#fff',
                            font:{
                                weight:'bold',
                                size:'25'
                            }
                        }
                    }
                };
                var myPieChart = new Chart(ctx, {
                    type: 'pie',
                    data: data,
                    options: options,
                });
            }
        </script>     

        <form name="hpmpForm" method="post">
            <%
                try {
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
                    Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ManagerFood", "sa", "long");
                    Statement st = con.createStatement();
                    String strQuery = "select count(*) from Person where pid=1";
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
                    String strQuery2 = "select count(*) from Person where pid=2";
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
                    String strQuery2 = "select count(*) from Person where pid=3";
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
            <input type="text" name="Manager"  value="<%=request.getAttribute("test1")%>" hidden>
            <br>
            <input type="text" name="Leader"   value="<%=request.getAttribute("test2")%>" hidden>
            <br> 
            <input type="text" name="Employee"   value="<%=request.getAttribute("test3")%>" hidden>
            <canvas id="hpmpratio" height="100"></canvas> 
        </form>  
    </body>
</html>