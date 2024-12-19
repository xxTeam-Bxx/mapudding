<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mapudding</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Kiwi+Maru&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css"><!-- 個別 -->
    <link rel="stylesheet" href="common.css"><!-- 共通 -->
    
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
    <h1>${storeName} の詳細</h1>
    <p>ここにお店の情報を表示します。</p>

    <!-- お店の情報表示 -->
    <p>住所: ${address}</p>
    <!-- 画像の表示 -->
    <img src="image3/${storeName}.jpg" alt="${storeName}の画像">

    <!-- メッセージの表示 -->
    <%
        String message = (String) session.getAttribute("message");
        if (message != null && !message.isEmpty()) {
    %>
        <p style="color: green;"><%= message %></p>
        <% 
            // メッセージを表示した後、セッションから削除
            session.removeAttribute("message");
        }
    %>

<iframe src=""></iframe>

    <!-- お気に入り追加フォーム -->
    <form action="FavoriteServlet" method="post">
        <input type="hidden" name="storeName" value="${storeName}">
        <input type="hidden" name="address" value="${address}">
        <button type="submit">お気に入りに追加</button>
    </form>

    <!-- お気に入りリストへのリンク -->
    <a href="FavoriteList">お気に入りリストの表示</a><br>

    <!-- 戻りリンク -->
    <a href="searchResult.jsp">検索結果に戻る</a><br>
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
            <li><a href="#">home</a></li>
            <li><a href="#">map</a></li>
            <li><a href="MyProfile.jsp">MyProfile</a></li>
          </ul>
        </nav>
		</div>
	</div>
	</div>
    
    <div class="menu" id="menu">
          <ul>
            <li><a href="#">home</a></li>
            <li><a href="#">map</a></li>
            <li><a href="MyProfile.jsp">MyProfile</a></li>
          </ul>
    </div>
    
<script src="top.js"></script>
</body>
</html>
