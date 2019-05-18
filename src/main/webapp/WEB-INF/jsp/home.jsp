<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../../resources/css/styles.jsp"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <security:authorize access="!isAuthenticated()">
        <title>Home</title>
    </security:authorize>
    <security:authorize access="isAuthenticated()">
        <title>Welcome</title>
    </security:authorize>
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
        <security:authorize access="!isAuthenticated()">
            <a href="/login">Login</a>
            or
            <a href="/sign">Sign In</a>
            to see posts.
        </security:authorize>
        <security:authorize access="isAuthenticated()">
            <div id="header">
                Recently added posts:
            </div>
            <div id="posts-container">
                <div class="row">
                    <div class="post">
                        <div class="post-header">
                            <div class="post-header-item">user</div>
                            <div class="post-header-item">date</div>
                        </div>
                        <div class="post-content">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ac sollicitudin metus.
                            Aenean eu efficitur dui. Sed diam dui, blandita </div>
                        <div class="likes">Likes</div>
                    </div>
                    <div class="post">
                        <div class="post-header">
                            <div class="post-header-item">user</div>
                            <div class="post-header-item">date</div>
                        </div>
                        <div class="post-content">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ac sollicitudin metus.
                            Aenean eu efficitur dui. Sed diam dui, blandita </div>
                        <div class="likes">Likes</div>
                    </div>
                    <div class="post">
                        <div class="post-header">
                            <div class="post-header-item">user</div>
                            <div class="post-header-item">date</div>
                        </div>
                        <div class="post-content">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ac sollicitudin metus.
                            Aenean eu efficitur dui. Sed diam dui, blandita </div>
                        <div class="likes">Likes</div>
                    </div>
                </div>
                <div class="row">
                    <div class="post">
                        <div class="post-header">
                            <div class="post-header-item">user</div>
                            <div class="post-header-item">date</div>
                        </div>
                        <div class="post-content">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ac sollicitudin metus.
                            Aenean eu efficitur dui. Sed diam dui, blandita </div>
                        <div class="likes">Likes</div>
                    </div>
                    <div class="post">
                        <div class="post-header">
                            <div class="post-header-item">user</div>
                            <div class="post-header-item">date</div>
                        </div>
                        <div class="post-content">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ac sollicitudin metus.
                            Aenean eu efficitur dui. Sed diam dui, blandita </div>
                        <div class="likes">Likes</div>
                    </div>
                    <div class="post">
                        <div class="post-header">
                            <div class="post-header-item">user</div>
                            <div class="post-header-item">date</div>
                        </div>
                        <div class="post-content">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ac sollicitudin metus.
                            Aenean eu efficitur dui. Sed diam dui, blandita </div>
                        <div class="likes">Likes</div>
                    </div>
                </div>
                <div class="row">
                    <div class="post">
                        <div class="post-header">
                            <div class="post-header-item">user</div>
                            <div class="post-header-item">date</div>
                        </div>
                        <div class="post-content">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ac sollicitudin metus.
                            Aenean eu efficitur dui. Sed diam dui, blandita </div>
                        <div class="likes">Likes</div>
                    </div>
                    <div class="post">
                        <div class="post-header">
                            <div class="post-header-item">user</div>
                            <div class="post-header-item">date</div>
                        </div>
                        <div class="post-content">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ac sollicitudin metus.
                            Aenean eu efficitur dui. Sed diam dui, blandita </div>
                        <div class="likes">Likes</div>
                    </div>
                    <div class="post">
                        <div class="post-header">
                            <div class="post-header-item">user</div>
                            <div class="post-header-item">date</div>
                        </div>
                        <div class="post-content">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ac sollicitudin metus.
                            Aenean eu efficitur dui. Sed diam dui, blandita </div>
                        <div class="likes">Likes</div>
                    </div>
                </div>
            </div>
        </security:authorize>
    </div>
    <div id="footer">
        <a href="/admin">Admin Panel</a>
    </div>
</div>
</body>

</html>