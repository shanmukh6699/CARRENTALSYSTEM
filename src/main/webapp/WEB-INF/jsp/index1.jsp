<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSP Template</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }
        header {
            width: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            padding: 8px 19px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }
        .header-content {
            display: flex;
            justify-content: space-between;
            width: 100%;
            align-items: center;
        }
        .logo {
            color: #fff;
            font-size: 25px;
            font-weight: bold;
            margin-right: 30px;
        }
        .navbar {
            display: flex;
            align-items: center;
        }
        .navbar a {
            font-size: 16px;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            border-radius:5px;
        }
        .dropdown {
            position: relative;
        }
        .dropdown .dropbtn {
            font-size: 16px;
            border: none;
            outline: none;
            color: white;
            padding: 14px 16px;
            background-color: inherit;
            font-family: inherit;
        }
        .navbar a:hover, .dropdown:hover .dropbtn {
            background-color: indianred;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }
        .dropdown-content a {
            float: none;
            color: black;
            padding: 8px 12px;
            text-decoration: none;
            display: block;
            text-align: left;
            border-radius: 5px;
        }
        .dropdown-content a:hover {
            background-color: #ddd;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
        .navbar-right {
            margin-left: auto;
            margin-right: 30px;
        }
        .logout-btn {
            background-color: darkred;
            color: white;
            padding: 6px 10px;
            margin-right:30px;
            border-radius:5px;
        }
    </style>
</head>
<body>
    <header>
        <div class="header-content">
            <div class="navbar">
                <h1 class="logo">CarRentalSystem</h1>
                <div class="dropdown">
                    <button class="dropbtn">Customer</button>
                    <div class="dropdown-content">
                        <a href="/">Customer Addition</a>
                        <a href="/">Customer Update</a>
                        <a href="/">Customer Deletion</a>
                        <a href="/">Customer Reports</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">Variant</button>
                    <div class="dropdown-content">
                        <a href="/variantAdd">Variant Addition</a>
                        <a href="/">Variant Deletion</a>
                        <a href="/">Variant Reports</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">Car</button>
                    <div class="dropdown-content">
                        <a href="/">Car Addition</a>
                        <a href="/">Car Update</a>
                        <a href="/">Car Deletion</a>
                        <a href="/">Car Report</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">Booking</button>
                    <div class="dropdown-content">
                        <a href="/">New Booking</a>
                        <a href="/">Booking Update</a>
                        <a href="/">Cancellation</a>
                        <a href="/">Booking Report</a>
                    </div>
                </div>
            </div>
            <div class="navbar navbar-right">
                <a href="/logout" class="logout-btn">Logout</a>
            </div>
        </div>
    </header>
    <div align="center" style="margin-top: 70px;">
        <h1 style="font-family:ALGERIAN">Welcome!</h1>
    </div>
</body>
</html>
