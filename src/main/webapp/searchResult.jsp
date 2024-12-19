<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>検索結果</title>
</head>
<body>
<form action="ShopLink" method="get">
    <% 
        List<String> storeNames = (List<String>) request.getAttribute("storeNames"); 
        if (storeNames != null && !storeNames.isEmpty()) {
    %>
        <p>テーブルに保存されているお店のタイトル一覧</p>
        <% for (String name : storeNames) { %>
            <a href="ShopLink?name=<%= name %>" class="link-group">
                <span><%= name %></span>
                <img src="image3/<%= name %>.jpg" alt="<%= name %>の画像">
            </a>
        <% } %>
    <% 
        } else { 
    %>
        <p>検索結果が見つかりませんでした。</p>
    <% } %>
</form>
    <br>
    <a href="shopSearch.jsp">検索フォームに戻る</a>
    <br>
    <a href="top.html">トップに戻る</a>
</body>
</html>
