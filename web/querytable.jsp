<%--
  Created by IntelliJ IDEA.
  User: bhagan
  Date: 6/5/20
  Time: 12:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Query Table</title>
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
<h3>Query Table Code</h3>
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

    String queryText = "SELECT * from DEMO.EVENTS";

    try {
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery(queryText);
        System.out.println(queryText);
        connection.commit();

        ResultSetMetaData rsmd = rs.getMetaData();
        int columnsNumber = rsmd.getColumnCount();

        while (rs.next()) {
            for (int i = 1; i <= columnsNumber; i++) {
                if (i > 1) System.out.print(",  ");
                String columnValue = rs.getString(i);
                System.out.print(rsmd.getColumnName(i) + ": " + columnValue);
            }
            System.out.println("");
        }
        stmt.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }

    RequestDispatcher dispatcher = request.getRequestDispatcher("querytable.jsp");
    dispatcher.forward(request, response);
    response.sendRedirect("querytable.jsp");
}

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doPost(request, response);
}
    </code>
</pre>
</body>
</html>
