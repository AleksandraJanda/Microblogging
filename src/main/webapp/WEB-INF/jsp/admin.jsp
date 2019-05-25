<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../resources/css/styles.jsp" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
</head>

<body>
<div id="top">
    <div class="top-item" id="nav">
        <input type="checkbox"/>
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
        <div id="stats">
            <div id="stats-users">
                <div class="stats-item">
                    Number of Users: ${numberOfUsers}
                </div>
                <div class="stats-item">
                    <c:forEach items="${users}" var="user">
                        <div class="stats-item-container">
                            <div class="stats-item-header-left">
                                <div class="stats-item-header-item">${user.username}</div>
                                <div class="stats-item-header-item">since: ${user.since.toLocalDate()}</div>
                                <div class="stats-item-header-item">posts: ${user.posts.size()}</div>
                            </div>
                            <div class="stats-item-header-right" id="item-in-users">
                                <button class="mini-button">Warn</button>
                                <button class="mini-button">Delete</button>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div id="stats-posts">
                <div class="stats-item">
                    Number of Posts: ${numberOfPosts}
                </div>
                <div class="stats-item">
                    <c:forEach items="${posts}" var="post">
                        <div class="stats-item-container">
                            <div class="stats-item-header-left">
                                <div class="stats-item-header-item">${post.user.username}: </div>
                            </div>
                            <div class="stats-item-header-left">
                                <div class="stats-item-header-item">${post.content}</div>
                            </div>
                            <div class="stats-item-header-right">
                                <button class="mini-button">Warn</button>
                                <button class="mini-button">Delete</button>
                            </div>

                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <div id="footer">
        <a href="/admin">Admin Panel</a>
    </div>
</div>
</body>

</html>
