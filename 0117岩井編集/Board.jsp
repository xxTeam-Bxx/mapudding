<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // セッションから "username" 属性を取得
    String username = (String) session.getAttribute("username");

    // "username" が null の場合、ログインページにリダイレクト
    if (username == null) {
        response.sendRedirect("Login.jsp"); // ログイン画面に遷移
        return; // 現在のJSPページの処理を終了
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>投稿画面</title>
</head>
<body>
    <h1>投稿</h1>
    <form action="Board" method="post">
        <p>店舗名: ${storeName}</p>
        <p>ユーザー名: ${username}</p><br>
        <form action="Board" method="post">
        <label for="comment">コメント:</label><br>
        <textarea id="comment" name="comment" rows="4" cols="50"></textarea><br><br>
        <button type="submit">投稿</button>
    </form>

</body>
</html>
