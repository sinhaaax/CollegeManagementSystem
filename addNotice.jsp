<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="java.util.*" %>
    <% // Get or create the notice list in session scope List<String> sessionNotices = (List<String>)
        session.getAttribute("sessionNotices");
        if (sessionNotices == null) {
        sessionNotices = new ArrayList<>();
          session.setAttribute("sessionNotices", sessionNotices);
          }

          // If the form is submitted with a notice
          String newNotice = request.getParameter("notice");
          if (newNotice != null && !newNotice.trim().isEmpty()) {
          sessionNotices.add(0, newNotice.trim()); // Add to top
          }
          %>

          <!DOCTYPE html>
          <html lang="en">

          <head>
            <meta charset="UTF-8">
            <title>Session Notice Board</title>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <!-- Bootstrap -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
          </head>

          <body class="bg-light">

            <div class="container py-5">
              <h2 class="text-center mb-4">📢 My Personal Notice Board</h2>

              <!-- Form -->
              <form method="post" action="addNotice.jsp">
                <div class="mb-3">
                  <textarea name="notice" class="form-control" rows="3" placeholder="Write your notice here..."
                    required></textarea>
                </div>
                <div class="text-center">
                  <button type="submit" class="btn btn-success px-4">Add Notice</button>
                </div>
              </form>

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

          </body>

          </html>