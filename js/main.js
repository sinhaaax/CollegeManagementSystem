function loginUser(event) {
  event.preventDefault();

  const username = document.getElementById("username").value;
  const password = document.getElementById("password").value;

  if (username === "102111001154" && password === "1154") {
    window.location.href = "dashboard.html";
  } else {
    alert("Invalid credentials! Try again.");
  }
}
