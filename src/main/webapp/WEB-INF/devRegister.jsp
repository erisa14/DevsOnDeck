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
    <h3 class="text-light font-monospace">DevsOnDeck</h3>
    <p>
        <a class="mx-3" href="/devs/login">Dev Login</a>
        <a class="mx-3" href="/orgs/login">Org Login</a>
    </p>
</nav>
<div class="form1 mt-5 border border-3 border-dark">
    <h1 class="text-center mt-3 fw-bold">Developer Sign Up</h1>
        <div class="p-2">
            <form:form modelAttribute="newDev" action="/register" method="post" class="form  d-flex flex-column">
                <div class="d-flex flex-row gap-2 mt-3 align-items-center">
                    <p class="col-sm-2">
                        <form:label path="firstName" class="ms-2 fw-semibold col-form-label">First Name</form:label>
                    </p>
                    <form:errors path="firstName" class="errors text-danger"/>
                    <form:input path="firstName" type="text" class="form-control"/>
                    <p class="col-sm-1">
                        <form:label path="lastName" class="ms-2 fw-semibold col-form-label">Last Name</form:label>
                    </p>
                    <form:errors path="lastName" class="errors text-danger"/>
                    <form:input path="lastName" type="text" class="form-control"/>
                </div>
                <div class="d-flex flex-row justify-content-center align-items-center gap-2">
                    <p class="col-sm-2">
                        <form:label path="email" class="ms-2 fw-semibold col-form-label">Email</form:label>
                    </p>
                    <form:errors path="email" class="errors text-danger"/>
                    <form:input path="email" type="text" class="form-control"/>
                </div>
                <div class="d-flex flex-row justify-content-center align-items-center gap-2">
                    <p class="col-sm-2">
                        <form:label path="address" class="ms-2 fw-semibold col-form-label">Address</form:label>
                    </p>
                    <form:errors path="address" class="errors text-danger"/>
                    <form:input path="address" type="text" class="form-control"/>
                </div>
                <div class="d-flex gap-2  align-items-center">
                    <p class="col-sm-2">
                        <form:label path="city" class="ms-2 fw-semibold col-form-label">City</form:label>
                    </p>
                    <form:errors path="city" class="errors text-danger"/>
                    <form:input path="city" type="text" class="form-control"/>
                        <p class="col-sm-1">
                            <form:label path="state" class="ms-2 fw-semibold col-form-label">State</form:label>
                        </p>
                        <form:errors path="state" class="errors text-danger"/>
                        <form:input path="state" type="text" class="form-control"/>
                </div>
                <div class="d-flex flex-row justify-content-center align-items-center gap-2">
                    <p class="col-sm-2">
                        <form:label path="password" class="ms-2 fw-semibold col-form-label">Password</form:label>
                    </p>
                    <form:errors path="password" class="errors text-danger"/>
                    <form:input path="password" type="password" class="form-control"/>
                </div>
                <div class="d-flex flex-row justify-content-center align-items-center gap-2">
                    <p class="col-sm-2">
                        <form:label path="confirm" class="ms-2 fw-semibold col-form-label">Confirm Password</form:label>
                    </p>
                    <form:errors path="confirm" class="errors text-danger"/>
                    <form:input path="confirm" type="password" class="form-control"/>
                </div>
                <p class="d-md-flex justify-content-md-end">
                <input class="col-2 btn  btn-success" type="submit" value="Register">
                </p>
            </form:form>
            <p class="text-center">
                <a href="/orgs/register">Need to Sign Up an Organization?</a>
            </p>
        </div>
    </div>
</body>
</html>