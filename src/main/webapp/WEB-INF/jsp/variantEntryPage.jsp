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
</head>
<body>
    <div>
        <h1><u>Car variant entry</u></h1>

        <form:form action="/variantAdd" method="post" modelAttribute="variantRecord">
            <form:hidden path="variantId"/>
            Variant Id:<form:input path="variantId" disabled="true"/>
            Enter variant name:<form:input path="variantName"/>
            Enter no of seats:<form:input path="numberOfSeat"/>
            Enter type of fuel:<form:input path="fuel"/>
            <button type="submit">Submit</button>
            <button type="reset">Reset</button>
        </form:form>

    </div>
</body>
</html>
