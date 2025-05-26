function loginUser(event) {
  event.preventDefault();

  const username = document.getElementById("username").value;
  const password = document.getElementById("password").value;

  if (username === "project" && password === "100") {
    window.location.href = "dashboard.jsp";
  } else {
    alert("Invalid credentials! Try again.");
  }
}
