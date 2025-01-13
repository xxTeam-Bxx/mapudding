<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.CafeHistory,servlet.CafeHistoryList,model.ShopBeans" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>閲覧履歴</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Kiwi+Maru&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css"><!-- 個別 -->
    <link rel="stylesheet" href="css/common.css"><!-- 共通 -->
<title>home</title>
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
            <h1>履歴表示</h1>
            <%
            List<CafeHistory> CafeHistoryList = (List<CafeHistory>) session.getAttribute("CafeHistory");

                    if (CafeHistoryList != null && !CafeHistoryList.isEmpty()) {
            %>
        
            <%
                // リストをループして店舗情報を表示
                for (CafeHistory store : CafeHistoryList) {
            %>
                
                    <a href="ShopLink?name=<%= store.getName() %>"class="link-group">
                    <span><%= store.getName() %></span><br>
                    <%= store.getAddress() %>
                    <img src="image3/<%= store.getName() %>.jpg" alt="<%=store.getName() %>の画像" width="400" heigth="300">

                </a>
            <%
                }
            %>
        
    <%
        } else {
    %>
        <p>履歴はありません。</p>
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
            <ul>
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
    
<script src="top.js"></script>
</body>
</html>

</body>
</html>