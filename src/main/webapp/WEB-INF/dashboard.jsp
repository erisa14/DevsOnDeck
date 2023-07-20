<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="/css/style.css">
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
            crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<nav class="nav d-flex justify-content-between align-items-center p-2 bg-primary">
    <li class="fw-bold fs-3">DevsOnDeck</li>
    <li><a class="mx-3 fs-3 text-decoration-none" href="/logout">Logout<i class="fa fa-sign-out"></i></a></li>
</nav>
<div class="dash border border-2 border-dark mt-2">
    <div>
    <h1 class="bg-warning text-center p-1 mb-2">Add Your Skills
        <div class="progress">
            <div class="progress-bar progress-bar-striped bg-danger progress-bar-animated" role="progressbar"
                 style="width: ${userId.skills.size()*20}%; " aria-valuenow="50"
                 aria-valuemin="0" aria-valuemax="100">${userId.skills.size()*20}%</div>
        </div>
    </h1>
    </div>
    <div class="d-flex justify-content-between container p-2">
        <div class="d-flex">
                <div class="w-75">
                    <h5 class="text-center">Pick Your Top 5 Languages/FrameWorks</h5>
                    <div>
                    <form:form modelAttribute="newSkill" action="/addSkill" method="post" class="m-3 p-3">
                        <div class="photo-div border border-dark">
                        <c:forEach items="${skills}" var="skill" varStatus="loopStatus">
                            <c:if test="${(loopStatus.index % 4) == 0}">
                                <div class="image-row">
                            </c:if>
                            <button type="submit" class="submit-btn" name="addSkill" value="${skill.id}">
                            <div class="text-center px-4">
                                <input type="checkbox" name="addSkill" id="${skill.id}" value="${skill.id}">
                                <label class="checkbox-label" for="${skill.id}">
                                    <div>
                                        <img class="skill-image" src="${skill.photo}">
                                        <p class="image-text">${skill.languageName}</p>
                                    </div>
                                </label>
                            </div>
                            </button>
                            <c:if test="${((loopStatus.index + 1) % 4) == 0 || loopStatus.last}">
                                </div>
                            </c:if>
                        </c:forEach>
                        </div>
                    </form:form>
                    </div>
                </div>
<%--                <div class="skill-container mx-4 border border-2 border-dark">--%>
<%--                    <c:forEach var="skillAss" items="${assigned}">--%>
<%--                        <img src="${skillAss.photo}" style="width: 18%;">--%>
<%--                    </c:forEach>--%>
<%--                </div>--%>
        <div class="w-50">
            <div class="skill-container m-4 pt-2 px-2 border border-2 border-dark">
                <c:forEach var="skillAss" items="${assigned}">
                    <img src="${skillAss.photo}" style="width: 18%;">
                </c:forEach>
            </div>
            <form:form modelAttribute="editDev" method="post" action="/addBio" name="bio">
                <div class="d-flex flex-row justify-content-center align-items-center">
                    <form:errors path="firstName" class="error"/>
                    <form:input type="hidden" value="${editDev.firstName}" path="firstName" class="form-control"/>
                </div>
                <div class="d-flex flex-row justify-content-center align-items-center">
                <form:errors path="lastName" class="error"/>
                <form:input type="hidden" value="${editDev.lastName}" path="lastName" class="form-control"/>
                </div>
                <div class="d-flex flex-row justify-content-center align-items-center">
                <form:errors path="email" class="error"/>
                <form:input type="hidden" value="${editDev.email}" path="email" class="form-control"/>
                </div>
                <div>
                <form:errors path="password" class="error"/>
                <form:input type="hidden"  path="password" value="${editDev.password}" class="form-control"/>
                </div>
                <form:errors path="confirm" class="error"/>
                <form:input type="hidden" path="confirm" value="${editDev.password}" class="form-control"/>

                <div class="d-flex flex-row justify-content-center align-items-center">
                    <form:errors path="address" class="error"/>
                    <form:input type="hidden" value="${editDev.address}" path="address"  class="form-control"/>
                </div>
                <div class="d-flex flex-row justify-content-center align-items-center">

                    <form:errors path="state" class="error"/>
                    <form:input type="hidden" value="${editDev.state}" path="state"  class="form-control"/>
                </div>
                <div class="d-flex flex-row justify-content-center align-items-center">
                <form:errors path="city" class="error"/>
                <form:input type="hidden" value="${editDev.city}" path="city"  class="form-control"/>
                </div>
                <div class="mx-4">
                        <form:label path="bio" class="ms-2 fs-4 fw-semibold col-form-label">Short bio: </form:label>
                <form:textarea cols="50" rows="7" path="bio" name="bio" id="bio"/>
                </div>
                <p class="d-md-flex justify-content-md-end">
                    <input type="submit" value="Add bio" class="m-4 btn btn-success col-3">
                </p>
            </form:form>
        </div>
     </div>
    </div>
</div>
</body>
</html>