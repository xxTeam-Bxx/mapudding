<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="servlet.ShopSearchServlet" %>

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
    <link rel="stylesheet" href="css/common.css"><!-- 共通 -->-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
<
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
    
<!-- セッションからタグを取得してJavaScriptで利用できるように隠しフィールドにセット -->
<% 
    List<String> tagList = (List<String>) session.getAttribute("tagList");
    String sessionTags = tagList != null ? String.join(" ", tagList) : "";
%>
<input type="hidden" id="sessionTags" value="<%= sessionTags %>">
 
 <!-- 検索フォーム -->
<form action="ShopSearch" method="post">   
 <p>検索ワード: 
    <!-- 複数タグを入力するフィールド -->
    <input type="text" name="keyword" id="keyword" placeholder="選択したタグが表示されます" readonly />
  </p>
  
  <!-- タグのリスト表示 -->
  <h3>選択したタグ:<br>※タグをクリックすると選択解除されます。</h3>
  <div id="tagList"></div>
  <!-- <div id="imageContainer"></div> -->

<div class="tagchoice">
  <p>タグを選んでください:</p>
  <button type="button" onclick="addKeyword('コーヒー')"><img src="image/coffee.png" alt="コーヒー" class="checkbox-img"></button>
  <button type="button" onclick="addKeyword('チーズ')"><img src="image/cheese.png" alt="チーズ" class="checkbox-img"></button>
  <button type="button" onclick="addKeyword('抹茶')"><img src="image/macha.png" alt="	抹茶" class="checkbox-img"></button>
  <button type="button" onclick="addKeyword('パフェ')"><img src="image/pafe.png" alt="	パフェ" class="checkbox-img"></button>
  <button type="button" onclick="addKeyword('パンケーキ')"><img src="image/pancake.png" alt="パンケーキ" class="checkbox-img"></button>
  <button type="button" onclick="addKeyword('プリン')"><img src="image/pudding.png" alt="プリン" class="checkbox-img"></button>
  <button type="button" onclick="addKeyword('スコーン')"><img src="image/scorn.png" alt="スコーン" class="checkbox-img"></button>
  <button type="button" onclick="addKeyword('ワッフル')"><img src="image/waff.png" alt="ワッフル" class="checkbox-img"></button>
  
  <button type="button" onclick="addKeyword('小倉')"><img src="image/kokura.png" alt="	小倉" class="checkbox-img"></button>
  <button type="button" onclick="addKeyword('門司')"><img src="image/moji.png" alt="	門司" class="checkbox-img"></button>
  <button type="button" onclick="addKeyword('門司港')"><img src="image/mojiko.png" alt="門司港" class="checkbox-img"></button>
  <button type="button" onclick="addKeyword('下関')"><img src="image/shimonoseki.png" alt="	下関" class="checkbox-img"></button>
  <button type="button" onclick="addKeyword('戸畑')"><img src="image/tobata.png" alt="戸畑" class="checkbox-img"></button>
  <button type="button" onclick="addKeyword('博多')"><img src="image/hakata.png" alt="博多" class="checkbox-img"></button>
  
  <button type="button" onclick="addKeyword('朝から')"><img src="image/morning.png" alt="朝から" class="checkbox-img"></button>
  <button type="button" onclick="addKeyword('昼から')"><img src="image/noon.png" alt="昼から" class="checkbox-img"></button>
  <button type="button" onclick="addKeyword('夕方から')"><img src="image/evning.png" alt="夕方から" class="checkbox-img"></button>
  <button type="button" onclick="addKeyword('夜から')"><img src="image/night.png" alt="夜から" class="checkbox-img"></button>
  <button type="button" onclick="addKeyword('夕方まで')"><img src="image/evening_fin.png" alt="夕方まで" class="checkbox-img"></button>
  <button type="button" onclick="addKeyword('夜まで')"><img src="image/night_fin.png" alt="夜まで" class="checkbox-img"></button>
  <button type="button" onclick="addKeyword('深夜まで')"><img src="image/midnight_fin.png" alt="深夜まで" class="checkbox-img"></button>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<button id="sbtn2" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
</form>

    <% 
        // セッションから 'storeNames' を取得
        List<String> storeNames = (List<String>) session.getAttribute("storeNames"); 
        if (storeNames != null && !storeNames.isEmpty()) {
    %>
        <p>テーブルに保存されているお店のタイトル一覧</p>
        <% for (String name : storeNames) { %>
            <a href="ShopLink?name=<%= name %>" class="link-group">
                <span><%= name %></span>
                <img src="image3/<%= name %>.jpg" alt="<%= name %>の画像">
            </a>
        <% } %>
    <% 
        } else { 
    %>
        <p>検索結果が見つかりませんでした。</p>
    <% } %>

    <br>
    <a href="shopSearch.jsp">検索フォームに戻る</a>
    <br>
    <a href="shopSearch.jsp">トップに戻る</a>
    
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
<script src="js/shopSearch.js"></script>
</body>
</html>
