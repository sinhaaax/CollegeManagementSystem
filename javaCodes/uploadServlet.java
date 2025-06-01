import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/upload")
@MultipartConfig(fileSizeThreshold=1024*1024, maxFileSize=1024*1024*5)
public class uploadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String caption = request.getParameter("caption");
        Part filePart = request.getPart("file");

        String fileName = null;
        String fileType = null;

        if (filePart != null && filePart.getSize() > 0) {
            fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
            fileType = filePart.getContentType();
            String uploadPath = getServletContext().getRealPath("") + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            filePart.write(uploadPath + File.separator + fileName);
        }

        try {
            Connection con = DBConnection.getConnection(); 
            String query = "INSERT INTO posts (caption, filename, filetype) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, caption);
            ps.setString(2, fileName);
            ps.setString(3, fileType);
            ps.executeUpdate();

            ps.close(); con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("index.jsp");
    }
}
