<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <form>
            <label class="label">
                Username:
            </label>
            <input id="username" type="text" name="username" />${username}
            <label class="label">
                Password:
            </label>
            <input id="password" type="password" name="password" />${password}
            <label class="label"></label>
            <input id="submit" type="submit" value="Login" />
        </form>
    </div>
    <div id="footer">
        <a href="/admin">Admin Panel</a>
    </div>
</div>
</body>

</html>