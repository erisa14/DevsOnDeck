<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="/css/st.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body class="font-monospace">
<nav class="nav navbar-expand-lg justify-content-between">
    <h3 class="nav-item text-light">DevsOnDeck</h3>
    <div class="nav">
    <li class="nav-item"><a class="nav-link text-light " href="/devs/register">Dev Register</a> </li>
    <li class="nav-item"><a class="nav-link text-light" href="/devs/login">Dev Login </a></li>
    <li class="nav-item"><a class="nav-link  text-light" href="/orgs/register">Org Register </a></li>
    <li class="nav-item"><a class="nav-link  text-light" href="/orgs/login">Org Login</a> </li>
    </div>
</nav>
</body>
</html>
