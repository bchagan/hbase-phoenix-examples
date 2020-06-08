<%--
  Created by IntelliJ IDEA.
  User: bhagan
  Date: 6/5/20
  Time: 4:28 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Setup</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<h2>HBase Phoenix Sample App</h2>
<table>
    <tr>
        <td><a href="setup.jsp">Setup</a></td>
        <td><a href="CreateTable">Create Table</a></td>
        <td><a href="UpsertData">Put Data</a></td>
        <td><a href="QueryTable">Get Data</a></td>
    </tr>
</table>
<h3>Setup Instructions</h3>
<ol>
    <li>hbase-2.1.6 > lib > phoenix-5.0.0-HBase-2.0-server.jar</li>
    <li>apache-tomcat-8.5.55 > lib > phoenix-5.0.0-HBase-2.0-client.jar</li>
</ol>
<h3>Key Classes</h3>
<ul>
    <li>javax.servlet.http.HttpServlet</li>
    <li>javax.servlet.http.HttpServletRequest</li>
    <li>javax.servlet.http.HttpServletResponse</li>
    <li>java.sql.DriverManager</li>
    <li>java.sql.Connection</li>
    <li>java.sql.Statement</li>
    <li>java.sql.ResultSet</li>
</ul>
</body>
</html>
