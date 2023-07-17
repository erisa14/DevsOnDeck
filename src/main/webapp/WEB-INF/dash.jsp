<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
  <title>Dashboard</title>
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body class="font-monospace">
<nav class="d-flex justify-content-between align-items-center p-2 bg-warning">
  <h3 class="text-light">Coding Dojo</h3>
  <h3 class="text-light fs-3">DevsOnDeck</h3>
    <a class="mx-3 fs-3 text-dark text-decoration-none" href="/logoutOrg">Logout<i class="fa fa-sign-out"></i></a>
</nav>
<div class="dash">
  <h1>Welcome ${org.firstName}!</h1>
  <h1>Welcome ${org.name}!</h1>
  <p>This is your dashboard. Nothing to see here yet.</p>
  <div class="d-flex flex-row justify-content-center">
  <div class="w-50">
    <a class="btn btn-primary col-50" href="/orgs/jobs/new">List a New Job Position</a>
    <div class="border border-2 border-dark mt-2">
    <h5 class="text-center">Positions To Fill</h5>
    <c:forEach items="${jobs}" var="job">
      ${job.position}
    </c:forEach>
    </div>
  </div>
  <div class="w-75 mx-4 border border-2 border-dark overflow-auto">
    <h4>Available Devs</h4>
  </div>
  </div>
<a href="/skills">Skills</a>

  <a href="/logoutOrg">Logout</a>
</div>
</body>
</html>