# MuleSoft Internship <img src="https://img.shields.io/badge/assesment-completed-brightgreen">

<img src="https://img.shields.io/badge/Java-v1.8-brightgreen"> <img src="https://img.shields.io/badge/MySQL-v5.7.26-brightgreen"> <img src="https://img.shields.io/badge/Apache Tomcat-v8.0.32-brightgreen"> <img src="https://img.shields.io/badge/NetBeans-brightgreen">

Descripton
----------

The repository consists of source code of Mulesoft internship program via NJC Labs. There is a Web page where a button named Create Table. By clicking the button, a table named __`'movies'`__ is created in database. Then, user have to put details of the table by a form in the web page. And at  the last, a table in the web page shows the chart of movies.

Code
---

__`1. HTML Code`__

```html
<form action="insertDataInTable.jsp" method="get"  autocomplete="off">

   <label for="movieName">Movie Name <span>*</span></label><br>
   <input type="text" placeholder="Enter movies name" name="movieName" required=""><br><br>

   <label for="actorName">Actor Name <span>*</span></label><br>
   <input type="text" placeholder="Enter actor name" name="actorName" required=""><br><br>
   ...
</form>  
```

__`2. JSTL Code`__

```html
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
       ...
      </c:otherwise>
   </c:choose>
</c:forEach>
```

__`3. JVAV Code`__

```java
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
   out.println("<tr><td>" + rs.getString("name") + "</td><td>" + rs.getString("actor") + "</td><td>" + rs.getString("actress") + "</td><td>" + rs.getString("director") + "</td>   <td>" + rs.getString("yearOfRelease") + "</td></tr>");
   empty = false;
}
if (empty) { // check empty or not, if empty then show no data found
   out.println("<tr><td colspan =" + 5 + "> no data found !!</td></tr>");
}
```

Schema Diagram
--------------

| id | name | actor | actress | director | yearOfRelease |
|----|------|-------|---------|----------|---------------|
| 1 | ghosh | sneha | paul | subham | 2020 |
|...|...|...|...|...|...|

Images
-----

> Index Page

<img src="https://github.com/sneha2245/muleSoftInternship/blob/dd8a6151bb65559a5468b25b71f130f5dadc5371/web/images/ss/index.png" alt="index page" title="Index Page">

> Movies List

<img src="https://github.com/sneha2245/muleSoftInternship/blob/dd8a6151bb65559a5468b25b71f130f5dadc5371/web/images/ss/movies-listt.png" alt="movies list" title="Movies List">
