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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />



    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/header.css" />
    <link rel="stylesheet" href="css/dashboard.css" />




</head>

<body class="d-flex bg-cover" style="background-image: url('images/allBg.png')">
    <%@ include file="header.html" %>

        <!-- Main Content -->
        <main>

            <!-- Profile Card with Animated Border -->
            <div class="profile-container">
                <div class="animated-border"></div>
                <section class="profile-card">
                    <div class="card-body">
                        <div class="profile-image">
                            <img src="images/pf1.jpg" alt="Profile Picture" />
                        </div>
                        <h2>Welcome to Profile Dashboard</h2>
                        <p><strong>Name:</strong>
                            <%=Name %>
                        </p>
                        <p><strong>Department:</strong> Information Technology</p>
                        <p><strong>Year:</strong> 3rd</p>
                        <p><strong>Semester:</strong> 6th</p>
                    </div>
                </section>
            </div>

            <!-- Dashboard Links Footer -->
            <%@ include file="dashbordIcon.html" %>

                <% if (Name.equals("admin")){ %>
                    <div class="col-sm-6 col-md-3">
                        <a href="addNotice.jsp" class="card dashboard-icon text-center text-decoration-none shadow-sm">
                            <div class="card-body">
                                <i class="fas fa-user-shield fa-2x" style="color: #0E2148;"></i>
                                <h5 class="card-title mt-3">Add Notice</h5>
                            </div>
                        </a>
                    </div>
                    </div>
                    </section>
                    <%} %>
        </main>



        <!-- Bootstrap Bundle JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>