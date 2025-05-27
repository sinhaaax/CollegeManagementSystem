<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Community | JU Portal</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/community.css" />
  </head>

  <body>

    <!-- Include Header -->
    <%@ include file="header.html" %>

      <!-- Main Content Wrapper -->
      <div class="page-wrapper">
        <div class="glass-card">

          <h2 class="text-center mb-4">🗣️ JU Student Community</h2>

          <!-- Post Form -->
          <form class="post-form mb-4">
            <div class="mb-3">
              <textarea class="form-control" rows="4" placeholder="Share your thoughts..." required></textarea>
            </div>
            <div class="d-grid">
              <button type="submit" class="btn btn-success rounded-pill">Post</button>
            </div>
          </form>

          <!-- Posts -->
          <div class="posts">

            <div class="card post-card mb-3 shadow">
              <div class="card-body d-flex">
                <img src="images/pf1.jpg" class="rounded-circle me-3" alt="Sraddha">
                <div class="w-100">
                  <p class="mb-1"><strong>Sraddha Kapoor</strong></p>
                  <p>Does anyone have the PDF of last year's DBMS paper?</p>
                  <div class="d-flex justify-content-between small">
                    <span class="text-white">🕒 Posted 1 day ago</span>
                    <div class="text-white">
                      <button class="btn btn-sm btn-outline-danger me-2 glow-icon">❤️
                        Like</button>
                      <button class="btn btn-sm btn-outline-secondary glow-icon">💬
                        Comment</button>
                    </div>
                  </div>

                </div>
              </div>
            </div>

            <div class="card post-card mb-3 shadow">
              <div class="card-body d-flex">
                <img src="images/pf2.jpg" class="rounded-circle me-3" alt="Tamanna">
                <div class="w-100">
                  <p class="mb-1"><strong>Tamanna Bhatia</strong></p>
                  <p>Cultural fest rehearsals at 5PM! Don’t miss it.</p>
                  <div class="d-flex justify-content-between small">
                    <span class="text-white">🕒 Posted 1 day ago</span>
                    <div class="text-white">
                      <button class="btn btn-sm btn-outline-danger me-2 glow-icon">❤️
                        Like</button>
                      <button class="btn btn-sm btn-outline-secondary glow-icon">💬
                        Comment</button>
                    </div>
                  </div>

                </div>
              </div>
            </div>

            <div class="card post-card mb-3 shadow">
              <div class="card-body d-flex">
                <img src="images/pf3.jpg" class="rounded-circle me-3" alt="Niha">
                <div class="w-100">
                  <p class="mb-1"><strong>Niha Su Xen</strong></p>
                  <p>Any updates on result rechecking forms?</p>
                  <div class="d-flex justify-content-between align-items-center small w-100"">
                    <span class="text-white">🕒 Posted 1 day ago</span>
                    <div class="text-white">
                      <button class="btn btn-sm btn-outline-danger me-2 glow-icon">❤️
                        Like</button>
                      <button class="btn btn-sm btn-outline-secondary glow-icon">💬
                        Comment</button>
                    </div>
                  </div>

                </div>
              </div>
            </div>

          </div>

        </div>
      </div>

      <!-- Bootstrap JS -->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  </body>

  </html>