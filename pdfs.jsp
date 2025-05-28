<%@ page import="java.util.List" %>
    <% List<String> pdfs = (List<String>) request.getAttribute("pdfList");
            String subject = (String) request.getAttribute("subject");
            %>
            <h2>Previous Year Questions for <%= subject %>
            </h2>
            <ul>
                <% if (pdfs !=null) { for (String pdf : pdfs) { %>
                    <li><a href="downloadPdf?filename=<%= pdf %>" target="_blank">
                            <%= pdf %>
                        </a></li>
                    <% } } else { %>
                        <li>No previous year questions found.</li>
                        <% } %>
            </ul>