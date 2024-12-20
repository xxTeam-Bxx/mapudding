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
    
<!-- メッセージの表示 -->
    <c:if test="${not empty message1}">
        <p style="color: green;">${message1}</p>
    </c:if>
    <c:set var="message" value="${sessionScope.message1}" />
        <c:remove var="sessionScope.message1" />

    <h1>${storeName} の詳細</h1>
    <!-- お店の情報表示 -->
    <p>住所: ${address}</p>
    <!-- 画像の表示 -->
    <img src="image3/${storeName}.jpg" alt="${storeName}の画像">

    <iframe src="${iframe} }"></iframe>
    <!-- お気に入り追加フォーム -->
    <form action="FavoriteServlet" method="post">
        <input type="hidden" name="storeName" value="${storeName}">
        <input type="hidden" name="address" value="${address}">
        <button type="submit">お気に入りに追加</button>
    </form>

    <!-- お気に入りリストへのリンク -->
    <a href="FavoriteList">お気に入りリストの表示</a><br>
    <!-- 戻りリンク -->
    <a href="ShopSearch.jsp">検索画面に戻る</a><br>
    
    
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
            <ul class="nav">
               <li><a href="notloginhome.html">home</a></li>
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
               <li><a href="notloginhome.html">home</a></li>
               <li><a href="MyProfile.jsp">MyProfile</a></li>
               <li><a href="#">histry</a></li>
               <li><a href="FavoriteList.jsp">bookmark</a></li>
          </ul>
    </div>
    
<script src="js/top.js"></script>
</body>
</html>
