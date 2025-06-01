<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Previous Year Question Papers</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/header.css" />
    <link rel="stylesheet" href="css/pyq.css" />
</head>
<body>
    <%@ include file="header.html" %>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card glowing-card shadow-lg rounded-4">
                    <div class="card-body">
                        <h4 class="card-title text-center mb-4"><i class="fas fa-file-alt me-2"></i>Select Year and Semester</h4>
                        
                        <form action="subjects" method="post">
                            <div class="mb-3">
                                <label for="year" class="form-label">Year:</label>
                                <select name="year" id="year" class="form-select">
                                    <option value="1st">1st</option>
                                    <option value="2nd">2nd</option>
                                    <option value="3rd">3rd</option>
                                    <option value="4th">4th</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="semester" class="form-label">Semester:</label>
                                <select name="semester" id="semester" class="form-select">
                                    <option value="1st">1st</option>
                                    <option value="2nd">2nd</option>
                                </select>
                            </div>

                            <div class="d-grid mt-4">
                                <button type="submit" class="btn btn-primary">
                                    <i class="bi bi-search me-1"></i> Search
                                </button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
