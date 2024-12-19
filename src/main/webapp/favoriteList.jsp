<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.FavoriteInfo" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <title>お気に入り店舗リスト</title>
</head>
<body>
    <h1>お気に入り店舗リスト</h1>

    <%
        List<FavoriteInfo> favoriteStores = (List<FavoriteInfo>) request.getAttribute("favoriteStores");

        if (favoriteStores != null && !favoriteStores.isEmpty()) {
    %>
        <ul>
            <%
                // リストをループして店舗情報を表示
                for (FavoriteInfo store : favoriteStores) {
            %>
                <li>
                    <%= store %>  <!-- toString() メソッドで店舗情報を表示 -->
                </li>
            <%
                }
            %>
        </ul>
    <%
        } else {
    %>
        <p>お気に入りの店舗はありません。</p>
    <%
        }
    %>

    <br><a href="home.html">ホームに戻る</a>
</body>
</html>