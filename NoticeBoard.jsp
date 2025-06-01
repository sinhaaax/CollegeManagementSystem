<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="java.util.*" %>
    <% // Get or create the notice list in session scope 
     List<String> sessionNotices = (List<String>) session.getAttribute("sessionNotices");
        if (sessionNotices == null) {
        sessionNotices = new ArrayList<>();
          session.setAttribute("sessionNotices", sessionNotices);
          }
%>
          <!DOCTYPE html>
          <html lang="en">

          <head>
            <meta charset="UTF-8">
            <title>Notice Board | JU Portal</title>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <!-- Bootstrap -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <!-- Custom CSS -->
            <link rel="stylesheet" href="css/style.css">
                        <link rel="stylesheet" href="css/header.css">

            <style>
            .notice-board {
  max-width: 800px;
  margin: 3rem auto;
  padding: 2rem;
  border-radius: 16px;
  box-shadow: 0 6px 30px rgba(0, 0, 0, 0.15);
  backdrop-filter: blur(10px);
  text-align: center;
}

.notice-board h2 {
  font-size: 2rem;
  margin-bottom: 1.5rem;
}

.notice-list {
  list-style: none;
  padding: 0;
  text-align: left;
}

.notice-list li {
  padding: 1rem;
  margin-bottom: 1rem;
  border-radius: 10px;
  font-size: 1rem;
  box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2);
  transition: background 0.3s;
}

.notice-list li:hover {
}
            
            </style>
          </head>

          <body class="d-flex bg-cover" style="background-image: url('images/allBg.png')">

            <!-- Include Navbar -->
            <jsp:include page="header.html" />

            <div class="container py-5">
              <h2 class="text-center mb-4">📢 Notice Board</h2>

              <!-- Notice Display -->
              <div class="mt-5">
                <h4>🗂️ Your Notices:</h4>
                <ul class="list-group mt-3">
                  <% for (String notice : sessionNotices) { %>
                    <li class="list-group-item">
                      <%= notice %>
                    </li>
                    <% } if (sessionNotices.isEmpty()) { %>
                      <li class="list-group-item text-muted">No notices yet.</li>
                      <% } %>
                </ul>
              </div>
            </div>

            <!-- Bootstrap JS -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
          </body>

          </html>