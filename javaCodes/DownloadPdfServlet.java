import java.io.IOException;
import java.io.OutputStream;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/downloadPdf")
public class DownloadPdfServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String filename = request.getParameter("filename");

        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT pdf FROM question_papers WHERE pdf_name = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, filename);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                byte[] pdfData = rs.getBytes("pdf");

                // Set response headers
                response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "inline; filename=\"" + filename + "\"");
                response.setContentLength(pdfData.length);

                // Write PDF bytes to response
                OutputStream os = response.getOutputStream();
                os.write(pdfData);
                os.flush();
                os.close();
            } else {
                response.getWriter().println("PDF not found for: " + filename);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error retrieving PDF: " + e.getMessage());
        }
    }
}
