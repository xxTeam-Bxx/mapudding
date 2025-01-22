<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.FavoriteInfo" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
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
    
    <h2 class="heading-33">
    <span>ブックマークした店舗</span>
    </h2>
    
    <div class="result-screen">
    <%
        // "favoriteStores" 属性からお気に入りリストを取得
        List<FavoriteInfo> favoriteStores = (List<FavoriteInfo>) session.getAttribute("favoriteStores");

        if (favoriteStores != null && !favoriteStores.isEmpty()) {
    %>
    
                <%
                    // リストをループして店舗情報を表示
                    for (FavoriteInfo store : favoriteStores) {
                %>
                <div class="shop-grp">
                    <a href="ShopLink?name=<%= store.getStoreName() %>"class="link-group">
                        <label class="heading-8"><%= store.getStoreName() %></label>
                        <form action="DeleteFavoriteServlet" method="post" style="margin:0; display:inline;">
                                <input type="hidden" name="storeName" value="<%= store.getStoreName() %>">
                                <button type="submit" class="delete-btn">ブックマークから削除</button>
                            </form>
                            <!--  store.getAddress() %> -->
                            <img src="image3/<%= store.getStoreName() %>.jpg" alt="<%=store.getStoreName() %>の画像" class="result-img">
                            <!-- 削除ボタン -->
                            
                    </a>
                </div>
                <%
                    }
                %>
    <%
        } else {
    %>
        <p>お気に入りの店舗はありません。</p>
    <%
        }
    %>
    
    </div>

    <!-- 画面のトップに行く -->
    <div id="page_top"><a href="ShopSearchResult.jsp"></a></div>
    
    <!-- homeへのリンク -->
    <a href="ShopSearchResult.jsp" class="history-btn">検索結果に戻る</a>
    <!-- homeへのリンク -->
    <a href="Home.jsp" class="history-btn">Home</a>
    
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
</html>