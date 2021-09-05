<%-- 
    Document   : createTable
    Created on : 3 Sep, 2021, 9:24:00 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<%
    String tableName = request.getParameter("tName");

    out.println(tableName);

    session.setAttribute("tableNameDB", tableName);

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var = "snapshot" driver = "com.mysql.cj.jdbc.Driver"
                           url = "jdbc:mysql://localhost:3306/dummydb"
                           user = "root"  password = "admin"/>
        <!-- check if table exists or not -->
        <sql:query dataSource = "${snapshot}" var = "result">
            SELECT COUNT(*) as t  FROM information_schema.tables WHERE table_schema = 'njcLabDb' AND table_name = '<%= tableName%>';
        </sql:query>
        <c:forEach var = "row" items = "${result.rows}">      
            <c:choose>
                <c:when test="${row.t == 1}">                       
                    <h2> <c:out value="y" /> </h2>
                    <% session.setAttribute("check", "Table name exists not need to create !!");%>
                    <c:redirect url = "index.jsp?tName=movies"/>                    
                </c:when>
                <c:otherwise>
                    <sql:update dataSource = "${snapshot}" var = "result"> 
                        <!-- create table query -->
                        CREATE TABLE `<%= tableName%>`(
                        `id` int NOT NULL AUTO_INCREMENT,
                        `name` VARCHAR(255),
                        `actor` VARCHAR(255), 
                        `actress` VARCHAR(255),
                        `director` VARCHAR(255),
                        `yearOfRelease` VARCHAR(255),
                        PRIMARY KEY ( id )
                        );
                    </sql:update>
                    <% session.setAttribute("check1", "New table is created !!");%>
                    <c:redirect url = "index.jsp?tName=movies"/>
                </c:otherwise>
            </c:choose>
        </c:forEach>


    </body>
</html>
