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
    
    <h1>お気に入り店舗リスト</h1>
    <%
        // "favoriteStores" 属性からお気に入りリストを取得
        List<FavoriteInfo> favoriteStores = (List<FavoriteInfo>) session.getAttribute("favoriteStores");

        if (favoriteStores != null && !favoriteStores.isEmpty()) {
    %>
    
                <%
                    // リストをループして店舗情報を表示
                    for (FavoriteInfo store : favoriteStores) {
                %>
                    <a href="ShopLink?name=<%= store.getStoreName() %>"class="link-group">
                        <span><%= store.getStoreName() %></span><br>
                            <%= store.getAddress() %>
                            <img src="image3/<%= store.getStoreName() %>.jpg" alt="<%=store.getStoreName() %>の画像" width="400" heigth="300">
                        
                            <!-- 削除ボタン -->
                            <form action="DeleteFavoriteServlet" method="post" style="margin:0; display:inline;">
                                <input type="hidden" name="storeName" value="<%= store.getStoreName() %>">
                                <input type="submit" value="削除" class="delete-btn">
                            </form>
                        <br>
                    </a>
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

    <br><a href="Home.jsp">ホームに戻る</a>
    
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
               <li><a href="top.html">TOP</a></li>
            <li><a href="Home.jsp">HOME</a></li>
            <li><a href="MyProfile.jsp">MYPROFILE</a></li>
            <li><a href="SearchCafeHistory.jsp">HISTORY</a></li>
            <li><a href="FavoriteList.jsp">BOOKMARK</a></li>
          </ul>
        </nav>
		</div>
	</div>
	</div>
    
    <div class="menu" id="menu">
          <ul>
               <li><a href="top.html">TOP</a></li>
            <li><a href="Home.jsp">HOME</a></li>
            <li><a href="MyProfile.jsp">MYPROFILE</a></li>
            <li><a href="SearchCafeHistory.jsp">HISTORY</a></li>
            <li><a href="FavoriteList.jsp">BOOKMARK</a></li>
          </ul>
    </div>
    
<script src="js/top.js"></script>
</body>
</html>
</html>