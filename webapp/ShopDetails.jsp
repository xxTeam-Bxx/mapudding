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
    <link rel="stylesheet" href="css/style.css"><!-- 個別 -->
    <link rel="stylesheet" href="css/common.css"><!-- 共通 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
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
    <div class="detail-screen">
<!-- メッセージの表示 -->
    <c:if test="${not empty message1}">
        <p style="color: green;">${message1}</p>
    </c:if>
    <c:set var="message" value="${sessionScope.message1}" />
        <c:remove var="sessionScope.message1" />

    <h2 class="heading-33">
    <span>${storeName} のページ</span>
    </h2>
    
    <!-- 画像の表示 -->
    <img src="image3/${storeName}.jpg" alt="${storeName}の画像" class="result-img">
    
    <!-- お店の情報表示 -->
    <p>住所: ${address}</p>
    <p>タグ: ${tags}</p>

    <iframe src="${iframe} }"></iframe>
    <!-- お気に入り追加フォーム -->
    <form action="FavoriteServlet" method="post">
    <input type="hidden" name="storeName" value="${storeName}">
    <input type="hidden" name="address" value="${address}">
    <button type="submit" class="bm-in-btn"><img src="image/on_bookmark.png" class="bm-in-img"></button>

    <!-- 履歴一覧リストへのリンク -->
    <a href="CafeHistoryList" class="history-btn">閲覧履歴一覧へ</a>
    <!-- お気に入りリストへのリンク -->
    <a href="FavoriteList" class="bm-btn">ブックマーク一覧へ</a>
    <!-- 戻りリンク -->
    <a href="ShopSearchResult.jsp" class="top-btn">検索画面に戻る</a><br>
    
    </div>
    
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
            <ul class="nav">
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