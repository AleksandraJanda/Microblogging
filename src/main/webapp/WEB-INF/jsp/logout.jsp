<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../../resources/css/styles.jsp"%>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout</title>
</head>

<body>
<div id="top">
    <div class="top-item" id="nav">
        <input type="checkbox" />
        <span></span>
        <span></span>
        <span></span>
        <ul id="menu">
            <a href="/home">
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
        User is logged out
    </div>
    <div id="footer">
        <a href="/admin">Admin Panel</a>
    </div>
</div>
</body>

</html>