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

public class PdfsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String subject = req.getParameter("subject");
        List<String> pdfList = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection(); // Use existing connection helper

            String sql = "SELECT * FROM question_papers WHERE name = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, subject);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pdfList.add(rs.getString("pdf_name"));
            }

            rs.close();
            ps.close();
            // Do NOT close connection here if managed by DBConnection

        } catch (Exception e) {
            e.printStackTrace();
        }

        req.setAttribute("pdfList", pdfList);
        req.setAttribute("subject", subject);
        RequestDispatcher rd = req.getRequestDispatcher("pdfs.jsp");
        rd.forward(req, res);
    }
}
