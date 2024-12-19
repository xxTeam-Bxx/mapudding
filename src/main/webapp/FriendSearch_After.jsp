<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
    <title>結果</title>
</head>
<body>
    <!-- リクエストスコープからエラーメッセージを受け取る -->
    <p>
        <c:if test="${not empty loginFailure}">
            <span style="color:red">${loginFailure}</span>
        </c:if>
    </p>

    <!-- リクエストスコープからユーザー名を受け取る -->
    <p>
    <form action="Profile" method="POST">
        <c:if test="${not empty username}">
            ユーザー名: ${username}
        </c:if>
    </p>
    
    </form>
    <br>
    <a href="FriendSearch_After.jsp">検索画面に戻る</a>
    <br>
    <a href="home.html">トップに戻る</a>
</body>
</html>
