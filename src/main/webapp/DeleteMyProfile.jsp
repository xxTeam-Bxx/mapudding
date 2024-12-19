<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>プロフィール削除</title>
</head>
<body>
    <h2>プロフィール削除</h2>


    <%-- エラーメッセージや削除成功メッセージの表示 --%>
    <c:if test="${not empty message}">
        <p style="color: red;">${message}</p>
    </c:if>

    <a href="top.html">TOPへ</a>
</body>
</html>
