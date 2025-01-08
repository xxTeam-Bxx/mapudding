
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
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
         <div class="login-container">
         
         <img src="image/Login.png" alt="ログイン" class="login-logo">
         
         <!-- リクエストスコープからエラーメッセージを受け取る -->
         <%String failureMessage = (String)request.getAttribute("loginFailure"); %>

         <!-- エラーメッセージが存在するときだけ表示する -->
         <% if (failureMessage != null) {%>
         <div class="error"><%=failureMessage %></div>
         <%} %>
         
         <!-- ログインフォーム。ユーザーIDとパスワードの入力を行う -->
         <form action="Login" method="post">
         
           <div class="loginform">
             <label for="id-text">ID</label>
             <input type="text" name="username">
           </div>
           <div class="loginform">
             <label for="pw-text">PASSWORD</label>
             <input type="password" name="password">
           </div>
           <div class="login-btn"><button type="submit"><label>Login</label></button></div>
         </form>

         </div>

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
            <li><a href="#">map</a></li>
            <li><a href="MyProfile.jsp">MyProfile</a></li>
          </ul>
        </nav>
		</div>
	</div>
	</div>
    
    <div class="menu" id="menu">
          <ul>
            <li><a href="notloginhome.html">home</a></li>
            <li><a href="#">map</a></li>
            <li><a href="MyProfile.jsp">MyProfile</a></li>s
          </ul>
    </div>
    
<script src="js/top.js"></script>
</body>
</html>
