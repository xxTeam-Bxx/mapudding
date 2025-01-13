<%@ page contentType="text/html; charset=UTF-8" %>
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
    <title>プロフィール</title>
</head>
<body>
<div class="boxA">
		<div class="box1">
		</div>
		<div class="box2">
	<div class="sp">
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
	<div class="sp-content">
    
    <main>
	<div class="profile_box">
	<div class="box-title">プロフィール</div>
	<div class="profile_center">
	<img alt="" src="image2/istockphoto-1139917357-612x612.jpg" class="profile_figure">
	<div class="profile_name"><p>ユーザー名: ${username}</p></div></div>
	<%-- コメントがリクエストスコープに格納されている場合 --%>
	<p>コメント: ${comment}</p>
    <br>
    </div>
    <button class="hensyu"onclick="location.href='UpdateProfile.jsp'">編集</button>
    <button class="logout"onclick="location.href='Logout'">ログアウト</button>
    <script type="text/javascript">
        let clickCount = 0; // クリック回数をカウントする変数

        function confirmDelete(button) {
            clickCount++; // クリック回数をインクリメント

            if (clickCount === 1) {
                // 1度目のクリック：確認アラートを表示
                alert("本当にプロフィールを削除しますか？もう一度クリックしてください。");
                button.value = "もう一度クリックして削除"; // ボタンのラベルを変更
                return false; // 削除をキャンセルし、フォーム送信は行わない
            } else if (clickCount === 2) {
                // 2度目のクリック：削除処理を実行
                return true; // フォームを送信して削除処理を実行
            }
        }
    </script>
     <form action="DeleteProfile" method="post" onsubmit="return confirmDelete(this.elements['submit']);">
        <button class="sakujo">退会</button>   
    </form>
    <%-- エラーメッセージや削除成功メッセージの表示 --%>
    <c:if test="${not empty message}">
        <p style="color: red;">${message}</p>
    </c:if>
    
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