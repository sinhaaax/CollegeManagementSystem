<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Community Feed</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .post-box {
            border: 1px solid #ddd;
            padding: 20px;
            margin-bottom: 30px;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        .post-box img, .post-box video {
            max-width: 100%;
            border-radius: 6px;
            margin-top: 10px;
        }

        .comment-section {
            display: none;
        }

        .comment-section input[type="text"] {
            width: 75%;
            margin-right: 10px;
        }

        .like-btn, .comment-btn, .share-btn {
            margin-right: 10px;
        }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">

<div class="container py-4">
    <h2 class="mb-4">🗣️ JU Student Community Feed</h2>

<%
    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/community", "root", "Wb@758004nak");

        String postQuery = "SELECT * FROM posts ORDER BY id DESC";
        stmt = con.prepareStatement(postQuery);
        rs = stmt.executeQuery();

        while (rs.next()) {
            int postId = rs.getInt("id");
            String caption = rs.getString("caption");
            String filename = rs.getString("filename");
            String type = rs.getString("filetype");

            // Fetch like count
            int likeCount = 0;
            PreparedStatement likeStmt = con.prepareStatement("SELECT like_count FROM likes WHERE post_id=?");
            likeStmt.setInt(1, postId);
            ResultSet likeRs = likeStmt.executeQuery();
            if (likeRs.next()) likeCount = likeRs.getInt("like_count");
%>

    <div class="post-box" id="post<%= postId %>">
        <p><strong>Caption:</strong> <%= caption %></p>

        <% if (filename != null && !filename.isEmpty()) {
            if (type.startsWith("image")) { %>
                <img src="uploads/<%= filename %>" alt="Post Image">
            <% } else if (type.startsWith("video")) { %>
                <video controls>
                    <source src="uploads/<%= filename %>" type="<%= type %>">
                    Your browser does not support the video tag.
                </video>
            <% }
        } %>

        <div class="mt-3">
            <form class="d-inline like-form" action="like" method="post">
                <input type="hidden" name="post_id" value="<%= postId %>">
                <button type="submit" class="btn btn-outline-primary btn-sm like-btn">Like (<span class="like-count"><%= likeCount %></span>)</button>
            </form>

            <button class="btn btn-outline-secondary btn-sm comment-toggle comment-btn">Comment</button>

            <button class="btn btn-outline-success btn-sm share-btn"
                    onclick="sharePost('<%= request.getRequestURL() %>#post<%= postId %>')">Share</button>
        </div>

        <div class="comment-section mt-3">
            <form method="post" action="comment">
                <input type="hidden" name="post_id" value="<%= postId %>">
                <input type="text" name="comment" class="form-control d-inline-block" placeholder="Write a comment..." required />
                <input type="submit" value="Post" class="btn btn-success btn-sm">
            </form>
        </div>

        <div class="mt-3">
            <strong>Comments:</strong>
            <ul>
                <%
                    PreparedStatement commentStmt = con.prepareStatement("SELECT comment FROM comments WHERE post_id=?");
                    commentStmt.setInt(1, postId);
                    ResultSet commentRs = commentStmt.executeQuery();
                    while (commentRs.next()) {
                %>
                    <li><%= commentRs.getString("comment") %></li>
                <%
                    }
                    commentRs.close();
                    commentStmt.close();
                    likeRs.close();
                    likeStmt.close();
                %>
            </ul>
        </div>
    </div>

<%
        }
    } catch (Exception e) {
%>
    <div class="alert alert-danger">Error loading posts. Please try again later.</div>
<%
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (con != null) con.close();
    }
%>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll('.comment-toggle').forEach(button => {
            button.addEventListener('click', function () {
                const section = this.closest('.post-box').querySelector('.comment-section');
                section.style.display = section.style.display === "block" ? "none" : "block";
            });
        });

        document.querySelectorAll(".like-form").forEach(form => {
            form.addEventListener("submit", function (e) {
                e.preventDefault();
                const postId = this.querySelector("input[name='post_id']").value;
                const likeCountSpan = this.querySelector(".like-count");

                fetch("like", {
                    method: "POST",
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: "post_id=" + encodeURIComponent(postId)
                }).then(response => {
                    if (response.ok) return response.text();
                    throw new Error("Failed to like post");
                }).then(data => {
                    likeCountSpan.textContent = data;
                }).catch(err => {
                    alert("Error: " + err.message);
                });
            });
        });
    });

    function sharePost(url) {
        navigator.clipboard.writeText(url).then(() => {
            alert("Post link copied to clipboard!");
        }).catch(() => {
            alert("Failed to copy post link.");
        });
    }
</script>

</body>
</html>
