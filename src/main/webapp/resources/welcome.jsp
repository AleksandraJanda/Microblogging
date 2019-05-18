<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="css/styles.jsp"%>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
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
        <a href="/logout">Logout</a>
        <a href="/sign">Sign In</a>
        <label>Zalogowano: ${username}</label>
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
        <!--
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
        </div> -->
    </div>
    <div id="footer">
        <a href="/admin">Admin Panel</a>
    </div>
</div>
</body>

</html>