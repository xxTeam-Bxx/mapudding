<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>プロフィール更新</title>
</head>
<body>
    <h2>プロフィール更新</h2>
    
    <%-- 現在のusernameとcommentを表示 --%>
    <form action="UpdateProfile" method="post">
        <label for="username">ユーザー名:</label>
        <input type="text" id="username" name="username" value="${username}"><br><br>

        <label for="comment">コメント:</label>
        <textarea id="comment" name="comment" rows="4" cols="50">${comment}</textarea><br><br>

        <input type="submit" value="更新">
    </form>

    <%-- エラーメッセージ --%>
    <c:if test="${not empty errorMessage}">
        <p style="color: red;">${errorMessage}</p>
    </c:if>
    
    <%-- ログアウトボタン 
    <a href="logout.jsp">ログアウト</a>
    --%>
</body>
</html>
