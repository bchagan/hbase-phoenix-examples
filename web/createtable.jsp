<%--
  Created by IntelliJ IDEA.
  User: bhagan
  Date: 6/4/20
  Time: 8:41 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Create Table</title>
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
<h3>Create Table Code</h3>
    <pre>
        <code>
private Connection connection;

public void init(ServletConfig config) throws ServletException {

    try {
        Class.forName("org.apache.phoenix.jdbc.PhoenixDriver");
        connection = DriverManager.getConnection("jdbc:phoenix:localhost");
        System.out.println("Connected to phoenix");
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }
}

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    String queryText = "CREATE TABLE IF NOT EXISTS demo.events (ln CHAR(15) not null, fn CHAR(15) not null, et TINYINT, " +
                        "ts TIMESTAMP not null, CONSTRAINT pk PRIMARY KEY (ln, fn, ts))";
    Statement stmt;

    try {
        stmt = connection.createStatement();
        boolean result = stmt.execute(queryText);
        stmt.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }

    RequestDispatcher dispatcher = request.getRequestDispatcher("createtable.jsp");
    dispatcher.forward(request, response);
    response.sendRedirect("createtable.jsp");
}

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doPost(request, response);
}
        </code>
    </pre>
</body>
</html>
