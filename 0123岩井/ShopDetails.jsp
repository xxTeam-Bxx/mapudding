<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="model.BoardList" %>
<%@ page import="java.util.List" %>
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
    <!-- タグリストの表示 -->
    <div id="tags-container">
        <% 
            // セッションからタグリストを取得
            List<String> tagsList = (List<String>) session.getAttribute("tagsList");

            // タグリストが存在する場合
            if (tagsList != null && !tagsList.isEmpty()) {
        %>
            <% for (String tag : tagsList) { %>
                <div class="tag-item" id="tag-<%= tag %>">
                    <img src="" alt="<%= tag %>" id="image-<%= tag %>">
                </div>
            <% } %>
        <%
            } else {
        %>
            <p>タグリストがありません。</p>
        <%
            }
        %>
    </div>


    <iframe src="${iframe} }"></iframe>
    
    <!-- <form action="Board" method="post"> -->
     <form onsubmit="handleSubmit(event)" method="post">
     
    <!-- お気に入り追加フォーム -->
    <!-- <form action="FavoriteServlet" method="post"> -->
    <input type="hidden" name="storeName" value="${storeName}">
    <input type="hidden" name="address" value="${address}">
    <button type="submit" name="favorite" class="bm-in-btn"><img src="image/on_bookmark.png" class="bm-in-img"></button>
    
    <div class="review">
    <label>${storeName}のレビュー</label>
    
    <div class="cmt-box">
    
        <p>cafe: ${storeName}</p>
        <div class="my-cmt-box">
        <p>user: ${sessionScope.username}</p>
        <select name="rating"id="rating" class="rating">
        	<option value="★1">★1</option>
        	<option value="★2">★2</option>
        	<option value="★3">★3</option>
        	<option value="★4">★4</option>
        	<option value="★5">★5</option>
        </select>
        <div class="cmt-box-ta">
        	<label for="comment">comments:</label>
        	<textarea id="comment" name="comment" class="my-ta" rows="1" cols="30"></textarea>
        </div>
        	<button type="submit"name="comment" class="cmt-up-btn">投稿</button>
        </div>
    <!-- <a href="Board.jsp">コメントする</a> -->
     <!-- コメント表示 -->
     

    <%
    List<BoardList> boardList = (List<BoardList>) session.getAttribute("BoardList");
    if (boardList != null && !boardList.isEmpty()) {
    %>
    
    <div class="cp_box1">
    <input id="cp01" type="checkbox">
    <label for="cp01"></label>
    <div class="cp_container">	
    
    <%
        for (BoardList board : boardList) {
           
	%>
	
	<div class="cmt-see-box">
            <cmt-user>user: <%= board.getUsername() %></cmt-user>
            <cmt-comment><%= board.getComment() %></cmt-comment>
            <cmt-rating><%= board.getRating() %></cmt-rating>
    </div>
    
<%
        }
%>

</div>
</div>

<%
    } else {
%>
        <p>他のコメントはありません。</p>
<%
    }
%>

     </div>
     </div>
    </form>

</div>
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
<script src="js/TagList.js"></script>
<script src="js/handlesubmit.js"></script>   
<script src="js/top.js"></script>
</body>
</html>