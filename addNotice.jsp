<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>

<%
    List<String> sessionNotices = (List<String>) session.getAttribute("sessionNotices");
    if (sessionNotices == null) {
        sessionNotices = new ArrayList<>();
        session.setAttribute("sessionNotices", sessionNotices);
    }

    String newNotice = request.getParameter("notice");
    if (newNotice != null && !newNotice.trim().isEmpty()) {
        sessionNotices.add(0, newNotice.trim());
    }

    // Clear all notices
    if (request.getParameter("clear") != null) {
        sessionNotices.clear();
    }

    // Delete individual notice
    String deleteIndexParam = request.getParameter("deleteIndex");
    if (deleteIndexParam != null) {
        try {
            int indexToDelete = Integer.parseInt(deleteIndexParam);
            if (indexToDelete >= 0 && indexToDelete < sessionNotices.size()) {
                sessionNotices.remove(indexToDelete);
            }
        } catch (NumberFormatException e) {
            // Ignore invalid index
        }
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Notice Board Card</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CSS + Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/header.css" />
</head>

<body class="d-flex bg-cover" style="background-image: url('images/allBg.png')">
    <%@ include file="header.html" %>

    <div class="container py-5 d-flex justify-content-center">
        <div class="card shadow-lg rounded-4 w-100" style="max-width: 600px;  background-color: #0e181a; color: #ffffff;">
            <div class="card-body">
                <h3 class="card-title text-center mb-4">
                    <i class="bi bi-megaphone-fill text-warning"></i> Notice Board
                </h3>

                <!-- Add Notice Form -->
                <form method="post" action="addNotice.jsp">
                    <div class="mb-3">
                        <textarea name="notice" class="form-control" rows="3" placeholder="Write your notice here..." required></textarea>
                    </div>
                    <div class="d-flex justify-content-between">
                        <button type="submit" class="btn btn-success">
                            <i class="bi bi-pencil-square me-1"></i> Add Notice
                        </button>
                        <button type="submit" name="clear" value="true" class="btn btn-danger">
                            <i class="bi bi-trash3 me-1"></i> Clear All
                        </button>
                    </div>
                </form>

                <!-- Notice List -->
                <div class="mt-4">
                    <h5 class="text-primary"><i class="bi bi-journal-text me-2"></i>Notices:</h5>
                    <ul class="list-group mt-2">
                        <% if (!sessionNotices.isEmpty()) {
                            for (int i = 0; i < sessionNotices.size(); i++) {
                                String notice = sessionNotices.get(i); %>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span>
                                        <i class="bi bi-pin-angle-fill text-danger me-2"></i>
                                        <%= notice %>
                                    </span>
                                    <form method="post" action="addNotice.jsp" class="ms-2">
                                        <input type="hidden" name="deleteIndex" value="<%= i %>" />
                                        <button type="submit" class="btn btn-sm btn-outline-danger" title="Delete">
                                            <i class="bi bi-x-circle"></i>
                                        </button>
                                    </form>
                                </li>
                        <%   }
                           } else { %>
                            <li class="list-group-item text-muted">
                                <i class="bi bi-info-circle me-2"></i> No notices yet.
                            </li>
                        <% } %>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
