<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Report</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/table.css">
</head>
<body>
  <header>
      <div class="header-content">
          <div class="navbar">
              <h1 class="logo">rent&drive</h1>
              <a href="/index" class="btn" id="home-btn">Home</a>
          </div>
          <div class="navbar navbar-right">
              <a href="/logout" class="logout-btn">Logout</a>
          </div>
      </div>
  </header>

  <div class="main-container" id="customerReportMainContainer">
      <h1 class="primary-heading">Customer Report</h1>
      <br />
      <div class="table-container">
        <table class="table">
          <tr class="table-header">
            <th>Username</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Address</th>
            <th>Email</th>
            <th>Mobile</th>
            <th>License Number</th>
            <th>Expiry Date</th>
            <th>Status</th>
          </tr>

          <c:forEach items="${customers}" var="customer">
            <tr class="table-row">
              <td>${customer.username}</td>
              <td>${customer.firstName}</td>
              <td>${customer.lastName}</td>
              <td>${customer.address}</td>
              <td>${customer.email}</td>
              <td>${customer.mobile}</td>
              <td>${customer.license}</td>
              <td>${customer.expiryDate}</td>
              <td>${customer.status}</td>
            </tr>
          </c:forEach>
        </table>
      </div>
      <br />
      <h3><a class="return-link" href="/index">Return</a></h3>
  </div>
</body>
</html>
