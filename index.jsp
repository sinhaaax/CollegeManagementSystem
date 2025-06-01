<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Community | JU Portal</title>

    <!-- Bootstrap CSS + Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="css/header.css" />

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-image: url('images/allBg.png');
            background-size: cover;
            background-repeat: no-repeat;
            margin: 0;
            padding-top: 80px;
              min-height: 100vh;
              display: flex;
  flex-direction: column;
            
            color: #fff;
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

        .header-container {
            background-color: rgba(14, 24, 26, 0.9);
            border-radius: 0.75rem;
            box-shadow: 0 0 20px rgba(0, 255, 255, 0.2);
            padding: 1rem 2rem;
            margin: 20px auto;
            max-width: 750px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header-container h2 {
            margin: 0;
            color: #00ffff;
        }

        .post-btn {
            background-color: #00ffff;
            color: #000;
            padding: 10px 18px;
            border: none;
            border-radius: 30px;
            font-weight: bold;
            text-decoration: none;
        }

        .post-btn:hover {
            background-color: #00dddd;
        }

        .post-box {
            background-color: rgba(255, 255, 255, 0.05);
            border-left: 5px solid #00ffff;
            color: #fff;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 20px;
        }

        .post-box p {
            margin: 5px 0;
            color: #ccc;
        }

        .post-box img,
        .post-box video {
            max-width: 100%;
            border-radius: 6px;
            margin-top: 10px;
        }

        a.post-btn {
            text-decoration: none;
        }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">

    <%@ include file="header.html" %>

    <!-- Feed Content -->
    <div class="container py-4 d-flex justify-content-center">
        <div class="glass-card p-4 w-100" style="max-width: 750px;">
                    <a href="post.jsp" class="btn btn-info rounded-pill fw-semibold">
                <i class="bi bi-plus-circle me-1"></i> Post
            </a>
        
            <jsp:include page="feed.jsp" />
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
