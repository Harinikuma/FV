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


public class delete extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Get the appnum parameter from the request
        String pname = request.getParameter("name");
        String dname = request.getParameter("doctor");
        String appnum = request.getParameter("appnum");
        String date = request.getParameter("date");
        try {
    // Parse appnum to integer
    int appnum1 = Integer.parseInt(appnum);

    // Check if appnum is not null before deleting the record from the database
    if (appnum != null && !appnum.isEmpty()) {
        // Load the PostgreSQL driver
        Class.forName("org.postgresql.Driver");

        // Establish connection to the database
        try (Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "Feb112003")) {
            // Prepare the SQL delete statement
            PreparedStatement ps = conn.prepareStatement("DELETE FROM appointment WHERE appnum = ? and pname = ? and dname=? and date=?");
            ps.setInt(1, appnum1);
            ps.setString(2, pname);
            ps.setString(3, dname);
            ps.setString(4, date);

            // Execute the delete statement
            int rowsAffected = ps.executeUpdate();

            // Check if the delete was successful
            if (rowsAffected > 0) {
                out.println("<script>alert(' appointment deleted successfully!');</script>");
                RequestDispatcher dispatcher = request.getRequestDispatcher("appointment");
                dispatcher.forward(request, response);
            } else {
                // No rows affected, deletion failed
                out.println("Failed to delete appointment with appnum " + appnum1 + ".");
            }
        } catch (SQLException ex) {
            // SQL Exception occurred
            out.println("An error occurred while deleting appointment: " + ex.getMessage());
        }
    } else {
        // appnum parameter is null or empty
        out.println("Appnum parameter is null or empty.");
    }
} catch (NumberFormatException e) {
    // Invalid appnum parameter
    out.println("Invalid appnum parameter: " + e.getMessage());
} catch (ClassNotFoundException e) {
    // PostgreSQL JDBC driver not found
    out.println("PostgreSQL JDBC driver not found: " + e.getMessage());
}

    }



    @Override
    public String getServletInfo() {
        return "delete";
    }
}
