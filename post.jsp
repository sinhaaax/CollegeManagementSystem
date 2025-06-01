<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Community | JU Portal</title>

        <!-- Bootstrap CSS + Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/header.css" />

        <style>
            body {
                background-image: url('images/allBg.png');
                background-size: cover;
                background-repeat: no-repeat;
            }

            .glass-card {
                background-color: #0e181a;
                color: #fff;
                box-shadow: 0 0 25px #0e181a, 0 0 40px rgba(0, 255, 255, 0.5);
                border-radius: 1rem;
            }

            .glow-icon:hover {
                text-shadow: 0 0 5px #7b7878, 0 0 10px #00ffff;
                transition: text-shadow 0.3s ease-in-out;
            }

            .post-card {
                background: rgba(255, 255, 255, 0.05);
                border-left: 5px solid #00ffff;
                color: #fff;
            }

            textarea.form-control {
                background-color: rgba(255, 255, 255, 0.05);
                color: #fff;
            }

            textarea::placeholder {
                color: #ccc;
            }

            .post-card img {
                width: 50px;
                height: 50px;
                object-fit: cover;
            }
        </style>
    </head>

    <body class="d-flex flex-column min-vh-100">

        <!-- Include Header -->
        <%@ include file="header.html" %>

            <!-- Main Content Wrapper -->
            <div class="container py-5 d-flex justify-content-center">
                <div class="glass-card p-4 w-100" style="max-width: 750px;">
                    <h2 class="text-center mb-4">📝 Create a Post</h2>

                    <form action="upload" method="post" enctype="multipart/form-data">
                        <!-- Caption Input -->
                        <div class="mb-3">
                            <textarea class="form-control" name="caption" rows="4" placeholder="What's on your mind?"
                                required></textarea>
                        </div>

                        <!-- File Upload -->
                        <div class="mb-4">
                            <label class="form-label">Attach Image/Video (optional):</label>
                            <input type="file" name="file" class="form-control">
                        </div>

                        <!-- Submit Button -->
                        <div class="d-grid">
                            <button type="submit" class="btn btn-success rounded-pill">
                                <i class="bi bi-send-fill me-1"></i> Post
                            </button>
                        </div>
                    </form>

                    <!-- Back Link -->
                    <div class="text-center mt-3">
                        <a href="index.jsp" class="text-light text-decoration-none glow-icon">
                            ← Back to Feed
                        </a>
                    </div>
                </div>


            </div>

            <!-- Bootstrap JS -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>