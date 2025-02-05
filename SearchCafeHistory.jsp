<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.CafeHistory,servlet.CafeHistoryList,model.ShopBeans" %>
<%@ page import="java.util.List, java.util.Collections" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>閲覧履歴</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.1/normalize.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kiwi+Maru&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <title>home</title>
</head>
<body>
<div class="boxA">
    <div class="box1">
    </div>
    <div class="box2">
        <div class="sp">
            <div class="sp-content">
                <header class="header">
                    <img src="image/mapudding_rogo 1.png" alt="ロゴ" class="top-bar-logo">
                    <div class="hamburger-menu" id="hamburger-menu">
                        <div class="bar"></div>
                        <div class="bar"></div>
                        <div class="bar"></div>
                    </div>
                </header>
                <main>
                    <h2 class="heading-33">
                        <span>履歴表示</span>
                    </h2>
                    <div class="result-screen">
                        <%
                        List<CafeHistory> CafeHistoryList = (List<CafeHistory>) session.getAttribute("CafeHistory");

                        if (CafeHistoryList != null && !CafeHistoryList.isEmpty()) {
                            // リストを逆順にソート
                            Collections.reverse(CafeHistoryList);
                        %>
                        <%
                            // ソート後のリストをループして表示
                            for (CafeHistory store : CafeHistoryList) {
                        %>
                            <div class="shop-grp">
                                <a href="ShopLink?name=<%= store.getName() %>" class="link-group">
                                    <label class="heading-8"><%= store.getName() %></label>
                                    <img src="image3/<%= store.getName() %>.jpg" alt="<%= store.getName() %>の画像" class="result-img">
                                </a>
                            </div>
                        <%
                            }
                        %>
                        <%
                        } else {
                        %>
                            <p>履歴はありません。</p>
                        <%
                        }
                        %>
                    </div>
                    <div id="page_top"><a href="SearchCafeHistory.jsp"></a></div>
                    <a href="Home.jsp" class="history-btn">Home</a>
                </main>
            </div>
        </div>
    </div>
    <div class="box3">
        <div class="nav-box">
            <nav>
                <ul class="nav">
                    <li><a href="top.html">TOP</a></li>
                    <li><a href="Home.jsp">HOME</a></li>
                    <li><a href="Map.jsp">MAP</a></li>
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
        <li><a href="Map.jsp">MAP</a></li>
        <li><a href="Profile">MYPROFILE</a></li>
        <li><a href="CafeHistoryList">HISTORY</a></li>
        <li><a href="FavoriteList">BOOKMARK</a></li>
    </ul>
</div>
<script src="top.js"></script>
</body>
</html>
