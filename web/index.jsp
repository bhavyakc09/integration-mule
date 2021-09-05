<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<html>
    <head>
        <title>First assessment page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body{
                margin: 0;
                padding: 0;
            }
            label>span{
                color: red;
            }
            input[type=text]{
                padding: 10px;
                width: 60%;
                margin-top: 7px;
            }
            input[type=submit]{
                padding: 10px;
                border-radius: 10px;
            }
        </style>
    </head>
    <body>
        <div style="border: 1px solid red;width:35% ;height: auto;margin: auto;">
            <h1>Create Table</h1>
            <a href="showTableData.jsp" style="float: right;">See all movies list</a>
            <h3 id="check" style="color: red;">
                <%
                    if (session.getAttribute("check") != null) { //for checking session value
                        out.println(session.getAttribute("check"));
                    }

                    if (session.getAttribute("check1") != null) {
                        out.println(session.getAttribute("check1"));
                    }
                %>
            </h3>
            <form action="createTable.jsp" method="get">
                <input type="hidden" value="movies" name="tName" >
                <input type="submit" value="Chreate Table Movies">            
            </form>
            <h1>Insert Table Value</h1>
            <form action="insertDataInTable.jsp" method="get"  autocomplete="off">

                <label for="movieName">Movie Name <span>*</span></label><br>
                <input type="text" placeholder="Enter movies name" name="movieName" required=""><br><br>

                <label for="actorName">Actor Name <span>*</span></label><br>
                <input type="text" placeholder="Enter actor name" name="actorName" required=""><br><br>

                <label for="actressName">Actress Name <span>*</span></label><br>
                <input type="text" placeholder="Enter actress name" name="actressName" required=""><br><br>

                <label for="directorName">Director Name <span>*</span></label><br>
                <input type="text" placeholder="Enter director name" name="directorName" required=""><br><br>

                <label for="yearRelease">Year of Release <span>*</span></label><br>
                <input type="text" placeholder="Enter year of release" name="yearRelease" required=""><br><br>        

                <input id="sub" type="submit" value="Insert Data">
            </form><br>
        </div>

        <script>
            //for check before insert data in the table user need to create the table 
            document.getElementById("sub").disabled = true;

            console.log(document.getElementById("check").innerHTML.trim());

            if (document.getElementById("check").innerHTML.trim() === "Table name exists not need to create !!" || document.getElementById("check").innerHTML.trim() === "New table is created !!") {
                document.getElementById("sub").disabled = false;
            } else {
                //alert("Plaes Create the table");
            }

        </script>
    </body>
</html>
