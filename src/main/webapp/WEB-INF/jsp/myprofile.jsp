<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <a href="/home">
                <li>Home</li>
            </a>
            <a href="/welcome">
                <li>Welcome</li>
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
        <a href="/logout">Logout</a>
        <a href="/sign">Sign In</a>
        <label>Zalogowano:</label>
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
                <img src="user.png" alt="user">
            </div>
            <div id="user-data">
                <label class="label">Username</label>
                <label class="label">since Date</label>
                <label class="label">Posts [number]</label>
            </div>
        </div>
        <div class="pane" id="right-pane">
            <div id="add-post">
                <textarea id="new-post" name="post" rows="5" form="form-add-post" maxlength="200"></textarea>
                <form id="form-add-post">
                    <input class="button" type="submit" value="Post">
                </form>
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