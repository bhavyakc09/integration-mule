<%-- 
    Document   : showTableData
    Created on : 4 Sep, 2021, 8:38:37 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movies List</title>
    </head>
    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
            text-transform: capitalize;            
        }
        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
            text-align: center;
        }
        tr:nth-child(even) {
            background-color: #ffffff;;
        }
        tr:nth-child(odd) {
            background-color: #dddddd;
        }
        tr:nth-child(1) {
            background-color: #787676 !important;
            color: white;
        }
    </style>
    <body>
        <h1>The Movies Details</h1>
        <table border = "1" width = "100%">
            <tr>
                <th>name</th>
                <th>actor</th>
                <th>actress</th>
                <th>director</th>
                <th>year Of Release</th>
            </tr> 
            <%  Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
                final String DB_URL = "jdbc:mysql://localhost:3306/dummydb";

                final String USER = "root";
                final String PASS = "admin";

                try {
                    //STEP 2: Register JDBC driver
                    Class.forName(JDBC_DRIVER);
                    conn = DriverManager.getConnection(DB_URL, USER, PASS);
                    stmt = conn.createStatement();
                    String sql;
                    //select query for get data from database
                    sql = "select * from movies";
                    rs = stmt.executeQuery(sql);
                    boolean empty = true;
                    // show data to jsp
                    while (rs.next()) {
                        out.println("<tr><td>" + rs.getString("name") + "</td><td>" + rs.getString("actor") + "</td><td>" + rs.getString("actress") + "</td><td>" + rs.getString("director") + "</td><td>" + rs.getString("yearOfRelease") + "</td></tr>");
                        empty = false;
                    }
                    if (empty) { // check empty or not, if empty then show no data found
                        out.println("<tr><td colspan =" + 5 + "> no data found !!</td></tr>");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                } finally {
                    //statement and connection close 
                    if (stmt != null) {
                        stmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                }
            %>
        </table>
    </body>
</html>
