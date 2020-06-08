package hagan.b;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "CreateTable")
public class CreateTable extends HttpServlet {

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

        String queryText = "CREATE TABLE IF NOT EXISTS demo.events (ln CHAR(15) not null, fn CHAR(15) not null, et TINYINT, ts TIMESTAMP not null, CONSTRAINT pk PRIMARY KEY (ln, fn, ts))";
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
}
