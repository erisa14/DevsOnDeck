<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<html>
<head>
    <title>New Position</title>
    <link rel="stylesheet" href="/css/style.css">
    <script src="/js/script.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>
<body class="mx-auto font-monospace">
<nav class="nav d-flex justify-content-between align-items-center p-2 bg-primary">
    <li class="fs-3 fw-bold">${org.name}</li>
    <li class="fs-3 fw-bold">DevsOnDeck</li>
    <li><a class="mx-3 fs-3 text-dark text-decoration-none" href="/logout">Logout<i class="fa fa-sign-out"></i></a></li>
</nav>
</div>
<div class="form1  border border-3 border-dark mt-4">
    <h1 class="bg-warning text-center p-1 mb-2">Add A Position</h1>
    <form:form modelAttribute="jobs" action="/orgs/jobs/new" enctype="multipart/form-data" method="post" class="px-5 form gap-2 d-flex flex-column">
        <div class="d-flex flex-row justify-content-center align-items-center px-5">
            <p class="col-sm-3">
                <form:label path="position" class="ms-2 fw-semibold col-form-label fs-2 text">Name</form:label>
            </p>
            <form:errors path="position" class="errors text-danger"/>
            <form:input path="position" type="text" class="form-control"/>
        </div>
        <div class="d-flex flex-row justify-content-center align-items-center px-5">
            <p class="col-sm-3">
                <form:label path="description" class="ms-2 fw-semibold col-form-label fs-2 text">Description</form:label>
            </p>
            <form:textarea rows="5" path="description" type="text" class="form-control"/>
            <form:errors path="description" class="errors text-danger"/>
        </div>
        <div>
            <form:errors path="org"/>
            <form:hidden path="org" value="${org.id}"/>
        </div>
    <div class="d-flex flex-row justify-content-center align-items-center px-5">
        <p class="col-sm-3">
            <label class="ms-2 fw-semibold col-form-label fs-2 text">Skills</label>
        </p>
        <div class="border border-2 border-dark mt-2 form-control org-photo">

    <c:forEach items="${skills}" var="skill" varStatus="loopStatus">
                    <c:if test="${(loopStatus.index % 4) == 0}">
                        <div class="image-row">
                    </c:if>
                        <div class="text-center px-5">
                            <input type="checkbox" name="jobSkill" id="${skill.id}" value="${skill.id}" onclick="limitSelection()">
                            <label class="checkbox-label" for="${skill.id}">
                                <div>
                                    <img class="skill-image" src="${skill.photo}">
                                    <p class="image-text">${skill.languageName}</p>
                                </div>
                            </label>
                        </div>
        <c:if test="${((loopStatus.index + 1) % 4) == 0 || loopStatus.last}">
                        </div>
                    </c:if>
                </c:forEach>
        </div>
    </div>
        <p class="d-md-flex justify-content-md-end mt-2">
            <input class="col-2 btn  btn-primary" type="submit" value="Add Position">
        </p>
    </form:form>
</div>
</body>
</html>
