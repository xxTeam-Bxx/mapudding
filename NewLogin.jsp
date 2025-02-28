<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ユーザー登録</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.1/normalize.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Kiwi+Maru&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css"><!-- 個別 -->
    <link rel="stylesheet" href="css/common.css"><!-- 共通 -->
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
            <div class="newlogin-container">
            
            <img src="image/signup.png" alt="サインイン" class="signin-logo">
    
               <!-- リクエストスコープからエラーメッセージを受け取る -->
               <%String failureMessage = (String)request.getAttribute("insertFailure"); %>

               <!-- エラーメッセージが存在するときだけ表示する -->
               <% if (failureMessage != null) {%>
               <div class="error"><%=failureMessage %></div>
               <%} %>
               
               <form action="Insert" method="post">
               
               <div class="newloginform">
                 <label for="username">ID</label>
                 <input type="text" id="username" name="username" required><br><br>
               </div>
               <div class="newloginform">
                 <label for="password">PASSWORD</label>
                 <input type="password" id="password" name="password" required><br><br>
               </div>
               <div class="newlogin-btn"><button type="submit"><label>Signup</label></button></div>
               </form>
            </div>
</main>
    <!--<footer class="footer">
        <p>&copy; 2024 モバイルファーストサイト</p>
    </footer>-->
    </div>
	</div>
	</div>
	<div class="box3">
		<div class="nav-box">
		<nav>
            <ul class="nav">
            <li><a href="top.html">TOP</a></li>
            <li><a href="Home.jsp">HOME</a></li>
          </ul>
        </nav>
		</div>
	</div>
	</div>
    
    <div class="menu" id="menu">
          <ul>
            <li><a href="top.html">TOP</a></li>
			<li><a href="Home.jsp">HOME</a></li>
          </ul>
    </div>
    
<script src="js/top.js"></script>
</body>
</html>