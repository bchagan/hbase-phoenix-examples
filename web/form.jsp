<%--
  Created by IntelliJ IDEA.
  User: bhagan
  Date: 6/4/20
  Time: 4:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="styles.css">
    <title>Create Database</title>
</head>
<body>
<h3>HBase Sample App</h3>

<ul>
    <li><a href="createdatabase.jsp">Create Database</a></li>
    <li><a href="#news">Get Data</a></li>
    <li><a href="#contact">Put Data</a></li>
    <li><a href="#about">About</a></li>
</ul>

<div>
    <form action="CreateDatabase" method="POST">
        <label for="fname">First Name</label>
        <input type="text" id="fname" name="firstname" placeholder="Tenant name..">

        <label for="lname">Last Name</label>
        <input type="text" id="lname" name="lastname" placeholder="Tenant last name..">

        <label for="country">Country</label>
        <select id="country" name="country">
            <option value="australia">Australia</option>
            <option value="canada">Canada</option>
            <option value="usa">USA</option>
        </select>

        <input type="submit" value="Submit">
    </form>
</div>

</body>
</html>
