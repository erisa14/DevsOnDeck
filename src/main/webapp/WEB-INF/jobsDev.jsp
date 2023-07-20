<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<html>
<head>
    <title>Available Jobs</title>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body class="font-monospace">
<nav class="nav d-flex justify-content-between align-items-center p-2 bg-primary">
    <li class="fw-bold fs-3">DevsOnDeck</li>
    <div class="d-flex">
        <li class="mx-3 fs-4"><a class="nav-link" href="/devs/skills/language">Edit</a></li>
    <li><a class="mx-3 fs-3 text-dark text-decoration-none" href="/logout">Logout<i class="fa fa-sign-out"></i></a></li>
    </div>
</nav>
<div class="container mt-3">
    <h3><c:out value="${dev.firstName}"/></h3>
    <c:forEach items="${dev.skills}" var="d">
        <img src="${d.photo}" style="width: 8%" class="mx-4">
    </c:forEach>
    <div class="d-flex justify-content-between mt-4">
        <div class="w-25">
    <h3>Free job positions</h3>
<c:forEach items="${toApply}" var="job">
    <c:if test="${!jobs.contains(job)}">
    <h4><label>Position:</label> <c:out value="${job.position}"/></h4>
    <h4><label>Org:</label> <c:out value="${job.org.name}"/></h4>
    <c:forEach items="${job.skills}" var="skill">
        <img src="${skill.photo}" width="13%">
    </c:forEach>
        <h6><label class="mt-2">Description:</label><p>${job.description}</p></h6>
        <a href="/dev/apply/${job.id}">Apply</a>
    </c:if>
</c:forEach>
        </div>
        <div class="w-25">
    <h4>Positions based on your skills</h4>
    <c:forEach items="${toApply}" var="job">
    <c:if test="${jobs.contains(job)}">
        <h4><label>Position:</label> <c:out value="${job.position}"/></h4>
        <h4><label>Org:</label> <c:out value="${job.org.name}"/></h4>
        <c:forEach items="${job.skills}" var="skill">
            <img src="${skill.photo}" width="13%">
        </c:forEach>
        <h6><label class="mt-2">Description:</label><c:out value="${job.description}"/></h6>
        <a href="/dev/apply/${job.id}">Apply</a>
    </c:if>
</c:forEach>
        </div>
        <div class="w-25">
    <h4>Applied jobs</h4>
    <c:forEach items="${applied}" var="app">
        <h5><label>Position:</label>${app.position}</h5>
        <h5><label>Org:</label>${app.org.name}</h5>
    </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
