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
import java.text.SimpleDateFormat;
import java.util.Random;


@WebServlet(name = "UpsertData")
public class UpsertData extends HttpServlet {

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

        long date = System.currentTimeMillis();
        int eventType = new Random().nextInt(3);

        Date dNow = new Date(System.currentTimeMillis());
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd' 'hh:mm:ss");

        String queryText = "UPSERT INTO demo.events VALUES('hagan','brian'," + eventType + ",'" + ft.format(dNow) + "')";

        try {
            Statement stmt = connection.createStatement();
            int result = stmt.executeUpdate(queryText);
            System.out.println(queryText);
            System.out.println(result);
            stmt.close();
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("upsertdata.jsp");
        dispatcher.forward(request, response);
        response.sendRedirect("upsertdata.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
