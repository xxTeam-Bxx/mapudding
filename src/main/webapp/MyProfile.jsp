<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mapudding</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Kiwi+Maru&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css"><!-- 個別 -->
    <link rel="stylesheet" href="common.css"><!-- 共通 -->
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
    <h2>プロフィール情報</h2>

    <p>ユーザー名: ${username}</p>

    <%-- コメントがリクエストスコープに格納されている場合 --%>
    <p>コメント: ${comment}</p>

    <%-- エラーメッセージがリクエストスコープに格納されている場合 --%>
    <c:if test="${not empty error}">
        <p style="color: red;">${error}</p>
    </c:if>
     <br>
    <a href="UpdateProfile.jsp">プロフィールを編集する</a>
    <br>
    <a href="Home.jsp">トップに戻る</a>
    <br>
    <a href="Logout">ログアウト</a>
    <br>
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
        <input type="submit" name="submit" value="退会">
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
            <li><a href="Home.jsp">home</a></li>
            <li><a href="#">map</a></li>
            <li><a href="MyProfile.jsp">MyProfile</a></li>
          </ul>
        </nav>
		</div>
	</div>
	</div>
    
    <div class="menu" id="menu">
          <ul>
            <li><a href="Home.jsp">home</a></li>
            <li><a href="#">map</a></li>
            <li><a href="MyProfile.jsp">MyProfile</a></li>
          </ul>
    </div>
    
<script src="top.js"></script>
</body>
</html>
