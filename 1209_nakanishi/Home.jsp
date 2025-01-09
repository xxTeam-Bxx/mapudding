<!--ゆうな用プロジェクト-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<div class="search-container">
<img src="image/home.png" alt="ロゴ" class="home-img">
<!-- 検索フォーム -->
<form action="ShopSearch" method="post">
    <!-- 複数タグを入力するフィールド -->
    <input type="text" name="keyword" id="keyword" placeholder="選択したタグが表示されます" readonly style="display:none;" />
  
  <div class="tag-screen">
  
  <!-- タグのリスト表示 
  <label>選択中のタグ:</label>-->
  <div class="search-box">
  <div class="choise-list">
  <div id="tagList"></div>
  </div>
  <button id="sbtn2" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
  </div>

<div class="tagchoice">
  <div class="tag-txt"><label>メニュー:</label></div>
  <img src="image/coffee.png" alt="コーヒー" class="checkbox-img" onclick="addKeyword('コーヒー')">
  <img src="image/cheese.png" alt="チーズ" class="checkbox-img" onclick="addKeyword('チーズ')">
  <img src="image/macha.png" alt="	抹茶" class="checkbox-img" onclick="addKeyword('抹茶')">
  <img src="image/pafe.png" alt="	パフェ" class="checkbox-img" onclick="addKeyword('パフェ')">
  <img src="image/pancake.png" alt="パンケーキ" class="checkbox-img" onclick="addKeyword('パンケーキ')">
  <img src="image/pudding.png" alt="プリン" class="checkbox-img"onclick="addKeyword('プリン')">
  <img src="image/scorn.png" alt="スコーン" class="checkbox-img"onclick="addKeyword('スコーン')">
  <img src="image/waff.png" alt="ワッフル" class="checkbox-img"onclick="addKeyword('ワッフル')">
  </div>
<div class="tagchoice">
  <div class="tag-txt"><label>駅:</label></div>
  <img src="image/kokura.png" alt="	小倉" class="checkbox-img" onclick="addKeyword('小倉')">
  <img src="image/moji.png" alt="	門司" class="checkbox-img"onclick="addKeyword('門司')">
  <img src="image/mojiko.png" alt="門司港" class="checkbox-img" onclick="addKeyword('門司港')">
  <img src="image/shimonoseki.png" alt="	下関" class="checkbox-img" onclick="addKeyword('下関')">
  <img src="image/tobata.png" alt="戸畑" class="checkbox-img" onclick="addKeyword('戸畑')">
  <img src="image/hakata.png" alt="博多" class="checkbox-img" onclick="addKeyword('博多')">
  </div>
<div class="tagchoice">
  <div class="tag-txt"><label>時間:</label></div>
  <img src="image/morning.png" alt="朝から" class="checkbox-img" onclick="addKeyword('朝から')">
  <img src="image/noon.png" alt="昼から" class="checkbox-img" onclick="addKeyword('昼から')">
  <img src="image/evning.png" alt="夕方から" class="checkbox-img" onclick="addKeyword('夕方から')">
  <img src="image/night.png" alt="夜から" class="checkbox-img" onclick="addKeyword('夜から')">
  <img src="image/evening_fin.png" alt="夕方まで" class="checkbox-img" onclick="addKeyword('夕方まで')">
  <img src="image/night_fin.png" alt="夜まで" class="checkbox-img" onclick="addKeyword('夜まで')">
  <img src="image/midnight_fin.png" alt="深夜まで" class="checkbox-img" onclick="addKeyword('深夜まで')">
</div>

</div>


  <!-- <p><input type="submit" value="検索" /></p> -->

</form>
</div>

<!-- エラーメッセージを表示 -->
<% String failureMessage = (String) request.getAttribute("errorMessage"); %>
<% if (failureMessage != null) { %>
  <div><%= failureMessage %></div>
<% } %>

			<a href="CafeHistoryList" class="history-btn">閲覧履歴一覧へ</a>
			<a href="#" class="bm-btn">ブックマーク一覧へ</a>
			
			<!--<div class="home-footermenu">
				<a href="like" class="like-link">
				<img src="image/home.png" alt="ロゴ" class="home-img">
				</a>
				<a href="dm.html" class="dm-link">
				<img src="image/home.png" alt="ロゴ" class="home-img">
				</a>
			</div>
            </main>
     <footer class="footer">
        <p>&copy; 2024 モバイルファーストサイト</p>
    </footer> -->
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
    
<script src="js/top.js"></script>
<script src="js/shopSearch.js"></script>
</body>
</html>

</body>
</html>
