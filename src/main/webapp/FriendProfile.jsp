<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>プロフィール</title>
</head>
<body>
    <h2>プロフィール情報</h2>

    <p>ユーザー名: ${username}</p>

    <%-- コメントがリクエストスコープに格納されている場合 --%>
    <p>コメント: ${comment}</p>

    <%-- エラーメッセージがリクエストスコープに格納されている場合 --%>
    <c:if test="${not empty error}">
        <p style="color: red;">${error}</p>
    </c:if>
    <a href="./loginSuccess.jsp">検索画面に戻る</a>
    <br>
    <a href="./login.jsp">トップに戻る</a>
    <br>
    <a href="logout.jsp">ログアウト</a>
</body>
</html>
