<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>

    <style>
        /*input[type="checkbox"] {*/
        /*    display: none;*/
        /*}*/

        /*!* Style the label with image *!*/
        /*label.checkbox-label {*/
        /*    display: inline-block;*/
        /*    position: relative;*/
        /*    cursor: pointer;*/

        /*}*/

        /*!* Style the checkbox icon *!*/
        /*label.checkbox-label::before {*/
        /*    content: "";*/
        /*    display: block;*/
        /*    width: 60px;*/
        /*    height: 85px;*/
        /*    border: 1px solid black;*/
        /*    background-color: #fff;*/
        /*    position: relative;*/
        /*    left: 0;*/
        /*    !*top: 50%;*!*/
        /*}*/

        /*!* Style the checkbox icon when checked *!*/
        /*input[type="checkbox"]:checked + label.checkbox-label::before {*/
        /*    background-color: #009688;*/
        /*}*/

        /*!* Style the image *!*/
        /*label.checkbox-label img {*/
        /*    position: relative;*/
        /*    top: 50%;*/
        /*    transform: translateY(-150%);*/
        /*    width: 50px;*/
        /*    height: 50px;*/
        /*}*/
        /*label.checkbox-label .image-text {*/
        /*    display: block;*/
        /*    font-size: 12px;*/
        /*    text-align: center;*/
        /*    transform: translateY(-400%);*/
        /*}*/
        /*.submit-btn{*/
        /*    display: inline-block;*/
        /*    margin: 5px;*/
        /*    width: 65px;*/
        /*    height: 90px;*/
        /*    background-color: white;*/
        /*}*/
    </style>


    <title>Dashboard</title>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<nav class="d-flex justify-content-between align-items-center p-2 bg-warning">
    <h3 class="text-light fs-3">DevsOnDeck</h3>
    <a class="mx-3 fs-3 text-dark text-decoration-none" href="/logout">Logout<i class="fa fa-sign-out"></i></a>
</nav>
<h1>Welcome ${userId.firstName}!</h1>
<p>This is your dashboard. Nothing to see here yet.</p>
<div class="dash border border-2 border-dark mt-2">
    <h1 class="bg-primary text-center p-1 mb-2">Add Your Skills</h1>
    <div class="d-flex justify-content-between">
        <div>
                <div>
                    <h5 class="text-center">Pick Your Top 5 Languages</h5>
                    <div class="border border-2 border-dark mt-2">
                    <form:form modelAttribute="newSkill" action="/addSkill" method="post" class="mt-3 p-3">
                        <c:forEach items="${skills}" var="skill" varStatus="loopStatus">
                            <c:if test="${(loopStatus.index % 4) == 0}">
                                <div class="image-row">
                            </c:if>
                            <button type="submit" class="submit-btn" name="addSkill" value="${skill.id}">
                            <div class="text-center">
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
                    </form:form>
                    </div>
                </div>
            </div>
                <div class="skill-container mx-4 border border-2 border-dark">
                    <c:forEach var="skillAss" items="${assigned}">
                        <img src="${skillAss.photo}" style="width: 18%;">
                    </c:forEach>
                </div>
        <div>
            <form method="post" action="/addBio" name="bio">
                <label for="bio">Bio</label>
                <textarea name="bio" id="bio"></textarea>
                <input type="submit" value="Submit">
            </form>
        </div>
        </div>
    </div>
    <a href="/logout">Logout</a>
</body>
</html>