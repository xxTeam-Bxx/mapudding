
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <%-- 現在のusernameとcommentを表示 --%>
    <div class="profile_box">
	<div class="box-title">プロフィール</div>
	<div class="profile_center">
	<img alt="" src="image2/istockphoto-1139917357-612x612.jpg" class="profile_figure">
	<div class="profile_name">
	<form action="UpdateProfile" method="post">
	<label for="username">ユーザー名:</label>
    <input type="text" id="username" name="username" value="${username}">
    </div>
	<label for="comment">コメント:</label>
	<br>
    <textarea id="comment" name="comment" rows="4" cols="20">${comment}</textarea>
    <br>
	<!--ゆりか編集(下記削除、上記追加
        <label for="username">ユーザー名:</label>
        <input type="text" id="username" name="username" value="${username}"><br><br>

        <label for="comment">コメント:</label>
        <textarea id="comment" name="comment" rows="4" cols="50">${comment}</textarea><br><br>
	-->
	</div>
    </div>
        <button class="update">更新</button>
    </form>
    <%-- ログアウトボタン --%>
    <button class="logout"onclick="location.href='Logout'">ログアウト</button>
    
    <%-- エラーメッセージ --%>
    <c:if test="${not empty errorMessage}">
        <p style="color: red;">${errorMessage}</p>
    </c:if>
    
    </main>
    <!--<footer class="footer">
        <p>&copy; 2024 モバイルファーストサイト</p>
    </footer>-->
    </div>
	</div>
	</div>
	<div class="box3">
		<div class="nav-box">
		<nav>
          <ul>
            <li><a href="top.html">TOP</a></li>
            <li><a href="Home.jsp">HOME</a></li>
            <li><a href="Profile">MYPROFILE</a></li>
            <li><a href="CafeHistoryList">HISTORY</a></li>
            <li><a href="FavoriteList">BOOKMARK</a></li>
          </ul>
        </nav>
		</div>
	</div>
	</div>
    
    <div class="menu" id="menu">
          <ul>
            <li><a href="top.html">TOP</a></li>
            <li><a href="Home.jsp">HOME</a></li>
            <li><a href="Profile">MYPROFILE</a></li>
            <li><a href="CafeHistoryList">HISTORY</a></li>
            <li><a href="FavoriteList">BOOKMARK</a></li>
          </ul>
    </div>
    
<script src="js/top.js"></script>
</body>
</html>
