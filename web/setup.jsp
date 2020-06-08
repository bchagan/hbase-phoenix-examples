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

<h3>HBase Sample App</h3>
<table>
    <tr>
        <td><a href="setup.jsp">Setup</a></td>
        <td><a href="CreateTable">Create Table</a></td>
        <td><a href="UpsertData">Put Data</a></td>
        <td><a href="QueryTable">Get Data</a></td>
    </tr>
</table>
<div>
<h3>Setup Instructions</h3>

    <p>1. hbase-2.1.6 > lib > phoenix-5.0.0-HBase-2.0-server.jar</p>
    <p>2. apache-tomcat-8.5.55 > lib > phoenix-5.0.0-HBase-2.0-client.jar</p>
</div>
</body>
</html>
