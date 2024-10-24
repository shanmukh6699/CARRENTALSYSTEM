<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Car Rental System Login</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        background: url("bg.jpg") no-repeat center center fixed;
        background-size: cover;
        margin: 0;
        padding: 0;
        height: 100vh;
        display: flex;
        justify-content: flex-start;
        align-items: center;
        padding-left: 50px;
        position: relative;
      }

      body::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: rgba(0, 0, 0, 0.1);
        z-index: -1;
      }

header {
    width: 97.5%;
    background-color: rgba(0, 0, 0, 0.6);
    padding: 8px 19px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: absolute;
    top: 0;
    left: 0;
    margin: 0px auto;
    z-index: 1000;
}

.header-content {
  display: flex;
  justify-content: space-between;
  width: 90%;
  align-items:center;
}

      .logo {
        color: #fff;
        font-size: 25px;
        font-weight: bold;
        margin-left: 30px;
      }

.register-btn {
    background-color: #28a745;
    color: white;
    padding: 8px 12px;
    border-radius: 5px;
    text-decoration: none;
    font-size: 20px;
    height: 20px;
}

      .register-btn:hover {
        background-color: #218838;
      }

.form-container {
    background-color: rgba(255, 255, 255, 0.9);
    padding: 20px 15px;
    border-radius: 10px;
    max-width: 300px;
    width: 100%;
    margin-left: 5rem;
}

      h2 {
        text-align: center;
        color: #333;
      }

      h2 a {
        color: #007bff;
        text-decoration: none;
      }

      h2 a:hover {
        color: #0056b3;
      }

form {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    justify-content: center;
}

      label {
        color: #333;
        margin-bottom: 2px;
        font-size: 16px;
        font-weight: bold;
      }

input[type="text"], input[type="password"] {
    width: 90%;
    padding: 6px;
    margin: 2px 0;
    border-radius: 5px;
    border: 1px solid #ddd;
    font-size: 16px;
    background-color: white;
}

input[type="submit"] {
    width: 95%;
    padding: 6px;
    background-color: #28a745;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

      input[type="submit"]:hover {
        background-color: #218838;
      }
    </style>
  </head>

  <body>
    <header>
      <div class="header-content">
        <h1 class="logo">CarRentalSystem</h1>
        <a href="/register" class="register-btn">Register</a>
      </div>
    </header>

    <div class="form-container">
      <form action="/login" method="post">
        <label for="username">Enter User Id:</label>
        <input
          type="text"
          name="username"
          id="username"
          placeholder="Username"
        />
        <br /><br />

        <label for="password">Enter Password:</label>
        <input
          type="password"
          name="password"
          id="password"
          placeholder="Password"
        />
        <br /><br />

        <input type="submit" value="Login" />
      </form>
    </div>
  </body>
</html>
