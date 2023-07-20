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
<nav class="nav d-flex justify-content-between align-items-center p-2 bg-primary">
  <li class="fw-bold fs-3">${org.name}</li>
  <li class="fw-bold fs-3">DevsOnDeck</li>
  <li><a class="mx-3 fs-3 text-dark text-decoration-none" href="/logout">Logout<i class="fa fa-sign-out"></i></a></li>
</nav>
<div class="dash">
  <div class="d-flex  justify-content-between">
    <div class="w-50">
      <a class="btn btn-success col-50 mt-3" href="/orgs/jobs/new">List a New Job Position</a>
      <div class="border border-2 border-dark mt-2">
      <h5 class="text-center">Positions To Fill</h5>
      <c:forEach items="${jobs}" var="job">
        <li class="list-group-item px-3"><a href="/orgs/jobs/${job.id}">${job.position}</a></li>
      </c:forEach>
      </div>
    </div>
    <div class="w-75 mx-5 mt-3">
      <h4>All Available Devs</h4>
      <c:forEach items="${devs}" var="dev">
        <p class="fs-5 mt-5">Bio: ${dev.bio}</p>
        <p class="fs-5">Name: ${dev.firstName}</p>
        <c:forEach items="${dev.skills}" var="skill">
          <img src="${skill.photo}" width="10%">
        </c:forEach>
      </c:forEach>
    </div>
  </div>
</div>
</body>
</html>