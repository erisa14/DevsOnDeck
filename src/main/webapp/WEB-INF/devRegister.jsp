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
<div class="form1 border border-3 border-dark ">
    <h2 class="text-center mt-1 fw-bold">Developer Sign Up</h2>
        <div class="px-2">
            <form:form modelAttribute="newDev" action="/register" method="post" class="form d-flex flex-column">
                <div class="d-flex flex-row align-items-center">
                    <p class="col-sm-3">
                        <form:label path="firstName" class="ms-2 fw-semibold form-label">First Name</form:label>
                    </p>
                    <form:errors path="firstName" class="errors text-light"/>
                    <form:input path="firstName" type="text" class="form-control"/>
                    <p class="col-sm-2">
                        <form:label path="lastName" class="ms-2 fw-semibold form-label">Last Name</form:label>
                    </p>
                    <form:errors path="lastName" class="errors text-light"/>
                    <form:input path="lastName" type="text" class="form-control"/>
                </div>
                <div class="d-flex flex-row justify-content-center align-items-center">
                    <p class="col-sm-3">
                        <form:label path="email" class="ms-2 fw-semibold form-label">Email</form:label>
                    </p>
                    <form:errors path="email" class="errors text-light"/>
                    <form:input path="email" type="text" class="form-control"/>
                </div>
                <div class="d-flex flex-row justify-content-center align-items-center">
                    <p class="col-sm-3">
                        <form:label path="address" class="ms-2 fw-semibold form-label">Address</form:label>
                    </p>
                    <form:errors path="address" class="errors text-light"/>
                    <form:input path="address" type="text" class="form-control"/>
                </div>
                <div class="d-flex align-items-center">
                    <p class="col-sm-3">
                        <form:label path="city" class="ms-2 fw-semibold form-label">City</form:label>
                    </p>
                    <form:errors path="city" class="errors text-light"/>
                    <form:input path="city" type="text" class="form-control"/>
                        <p class="col-sm-1">
                            <form:label path="state" class="ms-2 fw-semibold form-label">State</form:label>
                        </p>
                    <p class="col-sm-2">
                        <form:errors path="state" class="errors text-light"/>
                    <form:select path="state" type="text" class="form-select">
                        <option>Albania</option>
                        <option>UK</option>
                        <option>Germany</option>
                        <option>Italy</option>
                        <option>France</option>
                        <option>Spain</option>
                        <option>Holand</option>
                        <option>Poland</option>
                        <option>Sweden</option>
                    </form:select>
                    </p>
                </div>
                <div class="d-flex flex-row justify-content-center align-items-center">
                    <p class="col-sm-3">
                        <form:label path="password" class="ms-2 fw-semibold form-label">Password</form:label>
                    </p>
                    <form:errors path="password" class="errors text-light"/>
                    <form:input path="password" type="password" class="form-control"/>
                </div>
                <div class="d-flex flex-row justify-content-center align-items-center">
                    <p class="col-sm-3">
                        <form:label path="confirm" class="ms-2 fw-semibold form-label">Confirm Password</form:label>
                    </p>
                    <form:errors path="confirm" class="errors text-light"/>
                    <form:input path="confirm" type="password" class="form-control"/>
                </div>
                <p class="d-md-flex justify-content-md-end">
                <input class="col-2 btn  btn-success" type="submit" value="Register">
                </p>
            </form:form>
        </div>
    </div>
</body>
</html>