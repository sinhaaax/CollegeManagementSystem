<%@ page import="java.util.List" %>
<%
    List<String> subjects = (List<String>) request.getAttribute("subjectList");
%>
<h2>Select a Subject</h2>
<ul>
    <% if (subjects != null) {
        for (String subject : subjects) { %>
            <li><a href="pdfs?subject=<%= subject %>"><%= subject %></a></li>
    <%  }
    } else { %>
        <li>No subjects found.</li>
    <% } %>
</ul>
