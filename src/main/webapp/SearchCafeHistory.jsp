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
    <link rel="stylesheet" href="style.css"><!-- 個別 -->
    <link rel="stylesheet" href="common.css"><!-- 共通 -->
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
        <ul>
            <%
                // リストをループして店舗情報を表示
                for (CafeHistory store : CafeHistoryList) {
            %>
                <li>
                    <%= store.getId() %><br>
                    <%= store.getName() %><br>
                    <%= store.getAddress() %><br>
                    <%= store.getTags() %><br>
                    <%= store.getImage() %><br>

                </li>
            <%
                }
            %>
        </ul>
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
            <ul>
            <li><a href="top.html">Top</a></li>
            <li><a href="home.html">Home</a></li>
            <li><a href="MyProfile.jsp">Profile</a></li>
          </ul>
        </nav>
		</div>
	</div>
	</div>
    
    <div class="menu" id="menu">
          <ul>
            <li><a href="top.html">Top</a></li>
            <li><a href="home.html">Home</a></li>
            <li><a href="MyProfile.jsp">Profile</a></li>
          </ul>
    </div>
    
<script src="top.js"></script>
</body>
</html>

</body>
</html>