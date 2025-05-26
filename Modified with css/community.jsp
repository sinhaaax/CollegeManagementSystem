<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Community | JU Portal</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link rel="stylesheet" href="css/style.css" />
</head>

<body class="d-flex flex-column min-vh-100">

  <!-- Include Header -->
  <%@ include file="header.html" %>

  <!-- Community Section -->
  <main class="flex-grow-1 container py-5 mt-4" style="background: #f0f2f5;">
    <h2 class="text-center mb-4">🗣️ JU Student Community</h2>

    <!-- Post Form -->
    <form class="post-form mb-5">
      <div class="mb-3">
        <textarea class="form-control" rows="4" placeholder="Share your thoughts..." required></textarea>
      </div>
      <button type="submit" class="btn btn-success">Post</button>
    </form>

    <!-- Posts Section -->
    <div class="posts">
      <div class="card mb-3 shadow-sm">
        <div class="card-body">
          <p><strong>Ananya Sinha:</strong> Does anyone have the PDF of last year's DBMS paper?</p>
        </div>
      </div>

      <div class="card mb-3 shadow-sm">
        <div class="card-body">
          <p><strong>Ritvik Das:</strong> Cultural fest rehearsals at 5PM! Don’t miss it.</p>
        </div>
      </div>

      <div class="card mb-3 shadow-sm">
        <div class="card-body">
          <p><strong>Neha Roy:</strong> Any updates on result rechecking forms?</p>
        </div>
      </div>
    </div>
  </main>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
