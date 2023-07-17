<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page isErrorPage="true" %>
<html>
<head>
    <title>Welcome to DevsOnDeck</title>
    <link rel="stylesheet" href="/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body class="mx-auto font-monospace">
<nav class="d-flex justify-content-between align-items-center p-2 bg-warning">
    <h3 class="text-light">DevsOnDeck</h3>
    <p>
        <a class="mx-3" href="/orgs/register">Dev Registration</a>
        <a class="mx-3" href="/orgs/register">Org Registration</a>
    </p>
</nav>
<div class="log mt-5 border border-3 border-dark">
    <h1 class="text-center mt-3">Welcome Back!</h1>
    <h4 class="text-center font-monospace">Let's Find You Some Candidates!</h4>
    <div class="p-2">
        <form:form modelAttribute="newLogin" action="/orgs/login" method="post" class="form gap-2 d-flex flex-column">
            <div class="d-flex flex-row justify-content-center align-items-center">
                <p class="col-sm-2">
                    <form:label path="email" class="ms-2 fw-semibold col-form-label fs-2 text">Email</form:label>
                </p>
                <form:errors path="email" class="errors text-danger"/>
                <form:input path="email" type="text" class="form-control"/>
            </div>
            <div class="d-flex flex-row justify-content-center align-items-center">
                <p class="col-sm-2">
                    <form:label path="password" class="ms-2 fw-semibold col-form-label fs-2 text">Password</form:label>
                </p>
                <form:input path="password" type="password" class="form-control"/>
                <form:errors path="password" class="errors text-danger"/>
            </div>
            <p class="d-md-flex justify-content-md-end">
                <input class="col-2 btn  btn-success" type="submit" value="Log In">
            </p>
        </form:form>
    </div>
</div>
</body>
</html>
