<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="model.BoardList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mapudding</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.1/normalize.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Kiwi+Maru&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css"><!-- 個別 -->
    <link rel="stylesheet" href="css/common.css"><!-- 共通 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.css">

</head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
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
    <span>cafe info</span>
    </h2>
    
    <div class="carousel-container">
        <div class="carousel">
            <div class="carousel-item"><img src="image3/${storeName}.jpg" alt="${storeName}の画像" class="result-img"></div>
            <div class="carousel-item"><img src="image3/${storeName}1.jpg" alt="${storeName}の画像" class="result-img"></div>
            <div class="carousel-item"><img src="image3/${storeName}.jpg" alt="${storeName}の画像" class="result-img"></div>
            <div class="carousel-item"><img src="image3/${storeName}.jpg" alt="${storeName}の画像" class="result-img"></div>
        </div>
        <button class="prev" onclick="moveSlide(-1)">&#10094;</button>
        <button class="next" onclick="moveSlide(1)">&#10095;</button>
    </div>
    
    <div class="cafe-info-box">
    

    <!-- 画像の表示 
    	<img src="image3/${storeName}.jpg" alt="${storeName}の画像" class="result-img">
    -->
    	<div class="cafe-info">
    		<!-- お店の情報表示 -->
    		<a href="Map.jsp">
        	<img src="image/lets_go.png" alt="ここに行く" class="map-img">
    		</a>
    		<h3 class="cafe-info-name">${storeName}</h3>
    		<label class="cafe-info-open">Open:${open}</label><br>
    		<label class="cafe-info-address">Address:${address}</label><br>
    		<!-- タグリストの表示 -->
    		<div id="tags-container">
    		<label class="cafe-info-tag">Tag:</label><br>
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
    	</div>
    	
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
    <h3 class="heading-33">
    <span>${storeName}のレビュー</span>
    </h3>
    
<%
    List<BoardList> boardList = (List<BoardList>) session.getAttribute("BoardList");
    if (boardList != null && !boardList.isEmpty()) {
%>
    <div class="avg-rating">
    <label>平均★${sessionScope.avgRating}</label>
    </div>
<%
    } 
%>
    
    <div class="cmt-box">
    
        <p>cafe: ${storeName}</p>
        <div class="my-cmt-box">
        <p>user: ${sessionScope.username}</p>
        <select name="rating"id="rating" class="rating">
        	<option value="1">★1</option>
        	<option value="2">★2</option>
        	<option value="3">★3</option>
        	<option value="4">★4</option>
        	<option value="5">★5</option>
        </select>
        <div class="cmt-box-ta">
        	<!-- <label for="comment">comments:</label>  -->
        	<textarea id="comment" name="comment" class="my-ta" rows="1" cols="30"></textarea>
        	<button type="submit"name="comment" class="cmt-up-btn">投稿</button>
        </div>
        </div>
    <!-- <a href="Board.jsp">コメントする</a> -->
     <!-- コメント表示 -->
    

    <%
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
            <cmt-user><%= board.getUsername() %>さん</cmt-user>
            <cmt-rating>★<%= board.getRating() %></cmt-rating>
            <cmt-comment><%= board.getComment() %></cmt-comment>
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
            <li><a href="Map.jsp">MAP</a></li>
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
            <li><a href="Map.jsp">MAP</a></li>
            <li><a href="Profile">MYPROFILE</a></li>
            <li><a href="CafeHistoryList">HISTORY</a></li>
            <li><a href="FavoriteList">BOOKMARK</a></li>
          </ul>
    </div>
    
    

<!-- カスタムスクリプトを最後に読み込む -->
<script src="js/TagList.js"></script>
<script src="js/handlesubmit.js"></script>   
<script src="js/top.js"></script>
<script src="js/slider.js"></script>

</body>
</html>