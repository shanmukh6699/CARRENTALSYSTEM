<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<script type="text/javascript">
    function validateEntries() {
        var pass1 = document.getElementById("pass1").value;
        var pass2 = document.getElementById("pass2").value;
        var email = document.getElementById("email").value;

        if(pass1.length < 5 || pass1.length > 10) {
            alert("Password length must be between 5 to 10");
        }
        var passwordRegex = /^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*]).{5,10}$/;
        if (!passwordRegex.test(pass1)) {
            alert("Password must contain at least one uppercase letter, one digit, and one special character.");
            return;
        }

        if (pass1 !== pass2) {
            alert("Passwords do not match.");
            return;
        }

        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            alert("Please enter a valid email address.");
            return;
        }

        document.getElementById("registrationForm").submit();
    }
</script>
    <title>Register new user</title>
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

        .login-btn {
            background-color: #28a745;
            color: white;
            padding: 8px 13px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 20px;
            height: 25px;
        }

        .register-btn:hover {
            background-color: #218838;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px 15px;
            border-radius: 10px;
            max-width: 350px;
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
    margin-top: 20px;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    justify-content: center;
}

        label {
            color: #333;
            margin-bottom: 5px;
            font-size: 16px;
            font-weight: bold;
        }

.input-field {
    width: 90%;
    margin-bottom: -26px;
    font-size: 16px;
    padding: 2px 4px;
}

input[type="submit"], button[type="button"], button[type="reset"] {
    width: 95%;
    padding: 6px;
    background-color: #28a745;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    margin-top: 10px;
}

        input[type="submit"]:hover, button[type="button"]:hover {
            background-color: #218838;
        }

        button[type="reset"] {
            width: 95%;
            padding: 6px;
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        button[type="reset"]:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <div align="center">
        <header>
            <div class="header-content">
                <h1 class="logo">CarRentalSystem</h1>
                <a href="/loginpage" class="login-btn">Login</a>
            </div>
        </header>

        <form:form id="registrationForm" method="post" action="/register" modelAttribute="userRecord" class="form-container">
            <label>Enter User Id:</label>
            <form:input path="username" class="input-field"/>
            <br/><br/>

            <label>Enter Password:</label>
            <form:input type="password" path="password" id="pass1" class="input-field"/>
            <br/><br/>

            <label>Re-type Password:</label>
            <input type="password" id="pass2" class="input-field"/>
            <br/><br/>

            <label>Enter Email:</label>
            <form:input path="email" class="input-field"/>
            <br/><br/>

            <label>Select User Type:</label>
            <form:input list="types" name="type" id="type" path="role" class="input-field"/>
            <datalist id="types">
                <option value="Customer"/>
                <option value="Admin"/>
            </datalist>
            <br/><br/>

            <button type="button" onclick="validateEntries();">Submit</button>
            <button type="reset">Reset</button>
        </form:form>
    </div>
</body>
</html>
