<%-- 
    Document   : insertDataInTable
    Created on : 4 Sep, 2021, 7:44:03 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<%
    String movieName = request.getParameter("movieName");
    String actorName = request.getParameter("actorName");
    String actressName = request.getParameter("actressName");
    String directorName = request.getParameter("directorName");
    String yearRelease = request.getParameter("yearRelease");

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Table Data</title>
    </head>
    <body>
        <sql:setDataSource var = "snapshot" driver = "com.mysql.cj.jdbc.Driver"
                           url = "jdbc:mysql://localhost:3306/dummydb"
                           user = "root"  password = "admin"/>
        <!-- Insert data Query -->
        <sql:update dataSource = "${snapshot}" var = "result">
            insert into movies(name,actor,actress,director,yearOfRelease) values ('<%= movieName%>','<%= actorName%>','<%=  actressName%>','<%= directorName%>','<%= yearRelease%>');
        </sql:update>
        <c:redirect url = "showTableData.jsp"/>
    </body>
</html>
