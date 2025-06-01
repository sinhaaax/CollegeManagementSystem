import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
@WebServlet("/like")
public class LikeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int postId = Integer.parseInt(request.getParameter("post_id"));
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/community", "root", "Wb@758004nak");

            PreparedStatement checkStmt = con.prepareStatement("SELECT * FROM likes WHERE post_id=?");
            checkStmt.setInt(1, postId);
            ResultSet rs = checkStmt.executeQuery();
            if (rs.next()) {
                PreparedStatement update = con.prepareStatement("UPDATE likes SET like_count = like_count + 1 WHERE post_id=?");
                update.setInt(1, postId);
                update.executeUpdate();
            } else {
                PreparedStatement insert = con.prepareStatement("INSERT INTO likes (post_id, like_count) VALUES (?, 1)");
                insert.setInt(1, postId);
                insert.executeUpdate();
            }

            response.setContentType("text/plain");
            response.getWriter().write("success");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
