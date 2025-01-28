<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mapudding</title>
    <link href="css/sampleStyle.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Kiwi+Maru&display=swap" rel="stylesheet">
	<!-- HERE API -->
    <link rel="stylesheet" type="text/css" href="https://js.api.here.com/v3/3.1/mapsjs-ui.css" />
    <script type="text/javascript" src="https://js.api.here.com/v3/3.1/mapsjs-core.js"></script>
    <script type="text/javascript" src="https://js.api.here.com/v3/3.1/mapsjs-service.js"></script>
    <script type="text/javascript" src="https://js.api.here.com/v3/3.1/mapsjs-ui.js"></script>
    <script type="text/javascript" src="https://js.api.here.com/v3/3.1/mapsjs-mapevents.js"></script>

    <link rel="stylesheet" href="css/style.css"><!-- 個別 -->
    <link rel="stylesheet" href="css/common.css"><!-- 共通 -->
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
						<p>経路検索</p>
						<input type="text" id="start" /><br>
						<input type="text"value="${address}" id="goal" />
						<button onclick="getRouting()">検索</button>
						
						<!-- 地図表示エリア -->
						<div id="mapContainer" style="height: 400px; margin-top: 20px;"></div>
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
						<li><a href="caferesult.html">MAP</a></li>
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
			<li><a href="caferesult.html">MAP</a></li>
			<li><a href="Profile">MYPROFILE</a></li>
			<li><a href="CafeHistoryList">HISTORY</a></li>
			<li><a href="FavoriteList">BOOKMARK</a></li>
		</ul>
	</div>
	
	<script src="Maps1.js"></script>
</body>
</html>
