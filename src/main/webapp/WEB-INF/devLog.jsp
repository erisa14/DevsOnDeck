<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page isErrorPage="true" %>
<html>
<head>
    <title>Welcome to DevsOnDeck</title>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/st.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body class="mx-auto font-monospace text-light">
<nav class="nav navbar-expand-lg justify-content-between">
    <h3 class="nav-item text-light">DevsOnDeck</h3>
    <div class="nav">
        <li class="nav-item"><a class="nav-link text-light " href="/devs/register">Dev Register</a> </li>
        <li class="nav-item"><a class="nav-link text-light" href="/devs/login">Dev Login </a></li>
        <li class="nav-item"><a class="nav-link  text-light" href="/orgs/register">Org Register </a></li>
        <li class="nav-item"><a class="nav-link  text-light" href="/orgs/login">Org Login</a> </li>
    </div>
</nav>
<div class="log border border-3 border-dark">
    <h1 class="text-center mt-3">Welcome Back, Developer</h1>
    <h4 class="text-center">Let's connect you to a job!</h4>
    <div class="p-2">
    <form:form modelAttribute="newLogin" action="/login" method="post" class="form gap-2 d-flex flex-column">
        <div class="d-flex flex-row justify-content-center align-items-center">
            <p class="col-sm-4">
                <form:label path="email" class="ms-2 fw-semibold col-form-label fs-2 text">Email</form:label>
            </p>
            <form:errors path="email" class="errors text-light"/>
            <form:input path="email" type="text" class="form-control"/>
        </div>
        <div class="d-flex flex-row justify-content-center align-items-center">
            <p class="col-sm-4">
                <form:label path="password" class="ms-2 fw-semibold col-form-label fs-2 text">Password</form:label>
            </p>
            <form:input path="password" type="password" class="form-control"/>
            <form:errors path="password" class="errors text-light"/>
        </div>
        <p class="d-md-flex justify-content-md-end">
            <input class="col-2 btn  btn-success" type="submit" value="Log In">
        </p>
    </form:form>
    </div>
</div>
</body>
</html>
