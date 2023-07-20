<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
  <title>Available Jobs</title>
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body class="font-monospace">
<nav class="nav d-flex justify-content-between align-items-center p-2 bg-primary">
  <li class="fw-bold fs-3">${job.org.name}</li>
  <li class="fw-bold fs-3">DevsOnDeck</li>
  <li><a class="mx-3 fs-3 text-dark text-decoration-none" href="/logout">Logout<i class="fa fa-sign-out"></i></a></li>
</nav>
<h3 class="mx-5">Job Position: <c:out value="${job.position}"/></h3>
<c:forEach items="${job.skills}" var="j">
  <img src="${j.photo}" class="mx-5" style="width: 6%;">
</c:forEach>
  <div class="d-flex container justify-content-evenly mt-5">
    <div class="w-75">
      <h3>Devs by position skills</h3>
    <c:forEach items="${developers}" var="dev">
      <p class="mt-5">Bio: <c:out value="${dev.bio}"/></p>
      <p>Email: <c:out value="${dev.email}"/></p>
      <c:forEach items="${dev.skills}" var="s">
        <img src="${s.photo}" width="10%">
      </c:forEach>
    </c:forEach>
    </div>
    <div class="w-100">
    <h3>Applications</h3>
    <c:forEach items="${job.devs}" var="d">
      <p class="mt-5">Email: <c:out value="${d.email}"/></p>
      <p>Bio: ${d.bio}</p>
      <c:forEach items="${d.skills}" var="s">
        <img src="${s.photo}" width="10%">
      </c:forEach>
    </c:forEach>
    </div>
</div>
</body>
</html>
