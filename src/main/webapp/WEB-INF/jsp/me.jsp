<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../../resources/css/styles.jsp"%>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile</title>
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
        <security:authorize access="!isAuthenticated()">
            <a href="/login">Login</a>
            <a href="/sign">Sign In</a>
            <label>Not logged</label>
        </security:authorize>
        <security:authorize access="isAuthenticated()">
            <a href="/logout">Logout</a>
            <label>Logged user: ${username}</label>
        </security:authorize>
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
        <div class="pane" id="left-pane">
            <div id="image">
                <img src="../../resources/images/user.png" alt="user">
            </div>
            <div id="user-data">
                <label class="label">${username}</label>
                <label class="label">since: ${since}</label>
                <label class="label">posts: ${postsNumber}</label>
            </div>
        </div>
        <div class="pane" id="right-pane">
            <div id="add-post">
                <form:form action="/me" method="post" modelAttribute="new-post">
                    <form:textarea id="new-post" path="content" rows="5"/>
                    <input class="button" type="submit" value="Post">
                </form:form>
                <!--<textarea id="new-post" name="post" rows="5" form="form-add-post" maxlength="200"></textarea>
                <form id="form-add-post" action="/me" method="post">
                    <input class="button" type="submit" value="Post">
                </form>-->
            </div>
            <div id="my-posts">
                my posts
            </div>
        </div>
    </div>
    <div id="footer">
        <a href="/admin">Admin Panel</a>
    </div>
</div>
</body>

</html>