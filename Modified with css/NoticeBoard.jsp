<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%   
    // Get or create the notice list in session scope
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
  <title>Session Notice Board</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<jsp:include page="header.html"/>
<body class="bg-light">
<div class="container py-5">
  <h2 class="text-center mb-4">📢 Notice Board</h2>

  <!-- Notice Display -->
  <div class="mt-5">
    <h4>🗂️ Your Notices:</h4>
    <ul class="list-group mt-3">
      <%
        for (String notice : sessionNotices) {
      %>
        <li class="list-group-item"><%= notice %></li>
      <%
        }
        if (sessionNotices.isEmpty()) {
      %>
        <li class="list-group-item text-muted">No notices yet.</li>
      <%
        }
      %>
    </ul>
  </div>
</div>

</body>
</html>