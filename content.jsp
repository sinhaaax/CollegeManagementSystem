<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="org.apache.catalina.util.IOTools" %>
    <%@ page import="java.io.*, java.net.*, java.util.Date" %>
      <%@ page import="java.util.Arrays, java.util.List" %>
        <% String Name=request.getParameter("username").trim(); %>
          <!DOCTYPE html>
          <html lang="en">

          <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Dashboard | JU Portal</title>

            <!-- Bootstrap CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

            <!-- Custom CSS -->
            <link rel="stylesheet" href="css/style.css" />

          </head>

          <body>
            <%@ include file="header.html" %>

              <!-- Main Content -->
              <main>
                <!-- Profile Card -->
                <section class="profile-card">
                  <div class="card-body">
                    <h2>Welcome to Profile Dashboard</h2>
                    <p><strong>Name:</strong>
                      <%= Name %>
                    </p>
                    <p><strong>Department:</strong> Information Technology</p>
                    <p><strong>Year:</strong> 3rd</p>
                    <p><strong>Semester:</strong> 6th</p>
                  </div>
                </section>
                <% if (Name.equals("admin")){ %>
                  <a href="addNotice.jsp" class="dash-btn">📢 Add Notice</a>
                  <%} %>
              </main>

              <!-- Dashboard Links Footer -->
              <footer>
                <%@ include file="dashbordIcon.html" %>
              </footer>

              <!-- Bootstrap Bundle JS -->
              <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
          </body>

          </html>