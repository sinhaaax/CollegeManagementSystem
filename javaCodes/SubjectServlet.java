import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SubjectServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String year = req.getParameter("year");
        String semester = req.getParameter("semester");

        List<String> subjectList = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();  // Use your existing connection helper

            String sql = "SELECT name FROM subjects WHERE year = ? AND semester = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, year);
            ps.setString(2, semester);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                subjectList.add(rs.getString("name"));
            }

            rs.close();
            ps.close();
            // Do NOT close connection here if DBConnection manages pooling

        } catch (Exception e) {
            e.printStackTrace();
        }

        req.setAttribute("subjectList", subjectList);
        RequestDispatcher rd = req.getRequestDispatcher("subject.jsp");
        rd.forward(req, res);
    }
}
