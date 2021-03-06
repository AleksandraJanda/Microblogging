<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
        }

        body{
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-size: 12px;
        }

        /* NAVIGATION */
        #menu a {
            text-decoration: none;
            color: #000000;
            transition: color 0.5s ease;
        }

        #menu a:hover {
            color: rgb(255, 111, 15);
        }

        #nav {
            font-size: 14px;
            float: left;
            z-index: 1;
        }

        #nav input {
            display: block;
            width: 40px;
            height: 32px;
            position: absolute;
            top: -7px;
            left: -5px;
            cursor: pointer;
            opacity: 0;
            z-index: 2;
            -webkit-touch-callout: none;
        }

        #nav span {
            display: block;
            width: 25px;
            height: 4px;
            margin-bottom: 3px;
            margin-right: 10px;
            background: #000000;
            border-radius: 3px;
            position: relative;
            z-index: 1;
            transform-origin: 4px 0;
            transition: transform 0.5s cubic-bezier(0.77,0.2,0.05,1.0),
            background 0.5s cubic-bezier(0.77,0.2,0.05,1.0),
            opacity 0.55s ease;
        }

        #nav span:first-child {
            transform-origin: 0 0;
        }

        #nav span:nth-last-child(2) {
            transform-origin: 0 100%;
        }

        /* Transform all the slices of hamburger into a crossmark. */
        #nav input:checked ~ span {
            opacity: 1;
            transform: rotate(45deg) translate(-1px, 1px);
            background: #000000;
        }

        /* But let's hide the middle one. */
        #nav input:checked ~ span:nth-last-child(3) {
            opacity: 0;
            transform: rotate(0deg) scale(0.2, 0.2);
        }

        #nav input:checked ~ span:nth-last-child(2) {
            transform: rotate(-45deg) translate(0, -1px);
        }

        #menu {
            position: fixed;
            min-width: 180px;
            width: 25%;
            max-width: 200px;
            height: 480px;
            margin: -100px 0 0 -50px;
            padding: 50px;
            padding-top: 125px;
            background-image: linear-gradient(#fffffff3 50%,transparent);
            border-right: 1px solid;
            border-bottom: none;
            border-image:
                    linear-gradient(
                            to bottom, #000000, rgba(0, 0, 0, 0)
                    ) 1 100%;
            list-style-type: none;
            -webkit-font-smoothing: antialiased;
            /* to stop flickering of text in safari */
            transform-origin: 0 0;
            transform: translate(-100%, 0);
            transition: transform 0.5s cubic-bezier(0.77,0.2,0.05,1.0);
        }

        #menu li {
            padding: 10px 0;
        }

        /* slide it in from the left */
        #nav input:checked ~ ul {
            transform: none;
        }
        /* NAVIGATION */

        /* SCROLLBAR */
        *::-webkit-scrollbar {
            width: 6px;
            background-color: wheat;
        }

        *::-webkit-scrollbar-thumb {
            background-color: rgba(0, 0, 0, 0.8);
            border-radius: 5px;
        }
        /* SCROLLBAR */

        #top {
            position: fixed;
            top: 0;
            left: 0;
            padding: 10px;
            width: 100%;
            color: white;
            background: rgb(255, 111, 15);
            z-index: 2;
        }

        .top-item {
            display: block;
        }

        a {
            text-decoration: none;
            color: #ffffff;
            transition: color 0.5s ease;
        }

        a:hover {
            color: rgb(0, 0, 0);
        }

        #panel a{
            margin-right: 20px;
        }

        #footer {
            position: fixed;
            bottom: 0;
            left: 0;
            font-size: 10px;
            padding: 5px;
            height: 20px;
            width: 100%;
            color: white;
            background: rgb(255, 111, 15);
            z-index: 3;
        }

        #title {
            font-size: 14px;
            float: left;
        }


        #title li{
            text-decoration: none;
        }

        #panel {
            float: right;
        }

        #page {
            display: block;
            position: relative;
            top: 60px;
            left: 0;
            right: 0;
            bottom: 0;
            margin: 0;
            width: 100%;
            border: none;

        }
        .container {
            margin: 5px;
            display: block;
            margin-bottom: 5px;
            padding: 5px;
        }

        #search {
            float: start;
            text-align: center;
        }

        #search-field {
            border: 5px solid  rgb(223, 223, 223);
            background-color: rgb(223, 223, 223);
            border-radius: 20px;
            width: 400px;
            text-align: center;
        }

        #search-button {
            display: inline-block;
            height: 30px;
            border: none;
            background-color: rgba(255, 111, 15, 0.8);
            border-radius: 20px;
            color: rgba(255, 111, 15, 0.8);
        }

        #content {
            float: start;
            padding-top: 15px;
            text-align: center;
            margin-bottom: 15px;
        }

        #content a {
            display: inline-block;
            background-color: rgb(255, 111, 15);
            width: 100px;
            padding: 10px;
            text-align: center;
            border-radius: 20px;
        }

        /* posts */
        #header{
            margin-bottom: 10px;
        }

        .post {
            display: inline-block;
            width: 32.5%;
            margin-bottom: 5px;
            padding: 5px;
            border: 1px solid rgba(255, 111, 15, 0.5);
            border-radius: 5px;
        }

        .post-header {
            display: block;
            margin-bottom: 5px;
            margin-top: 5px;
        }

        .post-header-item {
            display: inline;
            padding: 10px;
        }

        .post-content {
            display: block;
            padding: 10px;
        }

        .likes {
            float: right;
            margin: 5px;
        }

        /* login */
        .label, #username, #password, #submit, #email, #passwordConfirm{
            display: block;
            margin: 7px;
            font-size: 16px;
        }

        #username, #password, #email, #passwordConfirm {
            display: inline;
            border: none;
            padding: 5px;
            text-align: center;
            border-bottom: 1px solid rgb(255, 111, 15);
            background-image: linear-gradient(rgba(223, 223, 223, 0.158) 10%,transparent);
        }

        #submit {
            display: inline-block;
            width: 100px;
            height: 30px;
            border: none;
            background-color: rgb(255, 111, 15);
            border-radius: 20px;
            color: rgb(255, 255, 255);
        }

        /*profile*/
        .pane {
            display: inline;
            border: 1px solid rgba(0, 0, 0, 0.226);
            margin: 2px;
            padding: 5px;
        }

        #left-pane {
            float: left;
            width: 28%;
        }

        #right-pane {
            float: left;
            width: 70.7%;
        }

        #image {
            margin-bottom: 10px;
        }

        #image img {
            width: 50%;
            height: auto;
        }

        #add-post, #my-posts {
            display: block;
            border-top: 1px solid rgb(255, 111, 15);
            padding: 10px;
        }

        #add-post {
            margin-bottom: 10px;
        }

        #new-post {
            width: 100%;
            resize: none;
            border: none;
            font-size: 16px;
            background-color: rgb(247, 245, 245);
        }

        .button {
            display: inline-block;
            background-color: rgb(255, 111, 15);
            width: 100px;
            padding: 10px;
            text-align: center;
            border: none;
            border-radius: 20px;
            color: #ffffff;
        }

        .mini-button{
            display: inline-block;
            background-color: rgb(255, 111, 15);
            width: 50px;
            padding: 5px;
            text-align: center;
            border: none;
            border-radius: 5px;
            color: #ffffff;
            font-size: 11px;
        }

        /*ADMIN*/
        #stats {
            display: block;
            margin: 5px;
            padding: 5px;
        }

        #stats-users {
            float: left;
            width: 35%;
            border-right: 1px solid rgb(255, 111, 15);
        }

        #stats-posts {
            float: right;
            width: 65%;
        }

        .stats-item {
            display: block;
            margin: 2px;
            padding: 2px;
            /*border-top: 1px solid rgb(255, 111, 15);*/
        }

        .stats-item-container {
            display: inline-block;
            width: 100%;
            margin-bottom: 2px;
            padding: 2px;
            padding-left: 10px;
            border: 1px solid rgb(220, 220, 220);
            border-radius: 5px;
            text-align: left;
        }

        .stats-item-header-left {
            display: inline-block;
            margin-bottom: 2px;
            margin-top: 2px;
            width: auto;
            height: auto;
        }

        .stats-item-header-right {
            display: inline-block;
            margin-bottom: 2px;
            margin-top: 2px;
            float: right;
            width: 150px;
            height: auto;
        }

        .stats-item-header-item {
            display: inline-block;
            padding: 2px;
        }

        @media screen and (max-width: 1200px){
            #item-in-users {
                width: 100%;
            }
        }

        @media screen and (max-width:800px) {
            .post {
                width:100%;
                margin-bottom: 5px;
            }
            #search-field {
                width: 80%;
            }
            #left-pane, #right-pane {
                width: 100%;
            }
            #image img {
                width: 30%;
                height: auto;
            }

            #add-post, #my-posts, #stats-users, #stats-posts {
                width: 100%;
            }

            #stats-users {
                border: none;
                border-bottom: 1px solid rgb(255, 111, 15);
            }

            #item-in-users {
                width: 150px;
            }
        }
        @media screen and (max-width:400px) {
            #panel {
                width: 100%;
                float: right;
            }
            .stats-item-header-item, .stats-item-header-left, .stats-item-header-right  {
                width: 100%;
            }
            #item-in-users {
                width: 100%;
            }
        }
    </style>
</head>
<body>

</body>
</html>
