<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../resources/css/styles.jsp"%>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>

<body>
<div id="top">
    <div class="top-item" id="nav">
        <input type="checkbox" />
        <span></span>
        <span></span>
        <span></span>
        <ul id="menu">
            <a href="/">
                <li>Home</li>
            </a>
            <a href="/me">
                <li>My Profile</li>
            </a>
            <a href="xxx.html">
                <li>..</li>
            </a>
            <a href="xxx.html">
                <li>..</li>
            </a>
            <a href="xxx.html">
                <li>..</li>
            </a>
        </ul>
    </div>
    <div class="top-item" id="title">
        Microblogging
    </div>
    <div class="top-item" id="panel">
        <a href="/login">Login</a>
        <a href="/sign">Sign In</a>
        <label>Not logged</label>
    </div>
</div>
<div id="page">
    <div class="container" id="search">
        <form>
            <label>
                <input id="search-field" type="search" name="search">
            </label>
            <label>
                <input id="search-button" type="submit" value=".....">
            </label>
        </form>
    </div>
    <div class="container" id="content">
        <form:form action="/login" method="post" modelAttribute="user">
            <form:label class="label" path="username">Username:</form:label>
            <form:input path="username"/>
            <br>
            <form:label class="label" path="password">Password:</form:label>
            <form:password path="password"/>
            <br>
            <input id="submit" type="submit" value="Login" />
        </form:form>
        <c:if test="${param.error != null}">
            <label class="label">Invalid username or password</label>
        </c:if>
    </div>
    <div id="footer">
        <a href="/admin">Admin Panel</a>
    </div>
</div>
</body>

</html>