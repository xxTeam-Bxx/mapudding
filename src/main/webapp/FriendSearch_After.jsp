<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mapudding</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Kiwi+Maru&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css"><!-- 個別 -->
    <link rel="stylesheet" href="css/common.css"><!-- 共通 -->
    
</head>
<body>
    <div class="boxA">
		<div class="box1">
		</div>
		<div class="box2">
	<div class="sp">
		
	<div class="sp-content">
    <header class="header">
        <!-- ロゴ画像 -->
        <img src="image/mapudding_rogo 1.png" alt="ロゴ" class="top-bar-logo">
        <!-- ハンバーガーメニュー -->
        <div class="hamburger-menu" id="hamburger-menu">
           <div class="bar"></div>
           <div class="bar"></div>
           <div class="bar"></div>
        </div>
    </header>
    <main>
    <!-- リクエストスコープからエラーメッセージを受け取る -->
    <p>
        <c:if test="${not empty loginFailure}">
            <span style="color:red">${loginFailure}</span>
        </c:if>
    </p>

    <!-- リクエストスコープからユーザー名を受け取る -->
    <p>
    <form action="Profile" method="POST">
        <c:if test="${not empty username}">
            ユーザー名: ${username}
        </c:if>
    </p>
    
    </form>
    <br>
    <a href="FriendSearch_After.jsp">検索画面に戻る</a>
    <br>
    <a href="home.html">トップに戻る</a>
    
    </main>
    <footer class="footer">
        <p>&copy; 2024 モバイルファーストサイト</p>
    </footer>
    </div>
	</div>
	</div>
	<div class="box3">
		<div class="nav-box">
		<nav>
          <ul>
            <li><a href="NotLoginHome.jsp">home</a></li>
            <li><a href="MyProfile.jsp">MyProfile</a></li>
            <li><a href="#">histry</a></li>
            <li><a href="FavoriteList.jsp">bookmark</a></li>
          </ul>
        </nav>
		</div>
	</div>
	</div>
    
    <div class="menu" id="menu">
          <ul>
            <li><a href="NotLoginHome.jsp">home</a></li>
            <li><a href="MyProfile.jsp">MyProfile</a></li>
            <li><a href="#">histry</a></li>
            <li><a href="FavoriteList.jsp">bookmark</a></li>
          </ul>
    </div>
    
<script src="js/top.js"></script>
</body>
</html>
