<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">


    <style>
        .image-row {
            display: flex;
            /*justify-content: space-between;*/
            margin-bottom: 10px;
            max-width: 50%;

        }

        .image-row img {
            width: 20%;
            max-width: 100%;
            height: auto;
        }
    </style>
</head>
<body>
<div class="container">
    <p>This is your dashboard. Nothing to see here yet.</p>

    <form:form modelAttribute="skills" action="/skills" method="POST">
        <form:label path="languageName">Name: </form:label>
        <form:errors path="languageName"/>
        <form:input type="text"  path="languageName"/>
<%--        <form:input type="text" path="photo" name="photo" accept="image/*"/>--%>
        <button type="submit">Save Skill</button>
    </form:form>


        <c:forEach items="${sk}" var="skill" varStatus="loopStatus">
            <c:if test="${(loopStatus.index % 4) == 0}">
                <div class="image-row">
            </c:if>
        <div class="text-center">
        <img src="${skill.photo}">
            <p>${skill.languageName}</p>
        </div>
        <c:if test="${((loopStatus.index + 1) % 4) == 0 || loopStatus.last}">
</div>
</c:if>

        </c:forEach>
    <a href="/logoutOrg">Logout</a>
</div>
</body>
</html>
