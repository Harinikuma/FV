/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author harin
 */
public class admindelete extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      response.setContentType("text/html;charset=UTF-8");
      PrintWriter out = response.getWriter();
      String dname = request.getParameter("dname");
       String demail = request.getParameter("demail");
        String qua = request.getParameter("qua");
        
         try {
                Class.forName("org.postgresql.Driver");

                // Establish connection to the database
                try (Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "Feb112003")) {
                    // Prepare the SQL delete statement
                    PreparedStatement ps = conn.prepareStatement("DELETE FROM doctor WHERE name = ? and qualification = ? and email = ?");
                    ps.setString(1, dname);
                    ps.setString(2, qua);
                    ps.setString(3, demail);
                    // Execute the delete statement
                    int rowsAffected = ps.executeUpdate();

                    // Check if the delete was successful
                    if (rowsAffected > 0) {
                        RequestDispatcher dispatcher = request.getRequestDispatcher("admin.html");
                        dispatcher.forward(request, response);
                    } else {
                        out.println("Failed to delete doctor with  " + dname + ".");
                    }
                } catch (SQLException ex) {
                    out.println("An error occurred while deleting appointment: " + ex.getMessage());
                }
        } catch (NumberFormatException e) {
            out.println("Invalid appnum parameter: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            out.println("PostgreSQL JDBC driver not found: " + e.getMessage());
        }
    }


}
