<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>carRentalSystem login</title>
</head>
<body>
    <div align="center">
        <h3>
            <form action="/login" method="post">
                Enter User Id:<input type="text" name="username"/>
                <br/><br/>
                Enter Password:<input type="password" name="password"/>
                <br/><br/>
                <input type="submit" value="Submit"/>
            </form>
        </h3>
        <h2>
            <a href="/register">Register for new User</a>
        </h2>
    </div>
</body>
</html>
