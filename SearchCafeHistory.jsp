<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cafe Search and History</title>
</head>
<body>
<%  
    // データベース接続用のパラメータを初期化
    String jdbcURL = "jdbc:mysql://localhost:3306/cafe_db";
    String dbUser = "root";
    String dbPassword = "password";
    
    Connection connection = null;
    PreparedStatement pstmt = null;
    
    try {
        // リクエストパラメータからカフェIDを取得
        String cafeId = request.getParameter("cafeId");
        // セッションからユーザーIDを取得
        String userId = (String) session.getAttribute("userId");

        if (cafeId != null && userId != null) {
            // データベース接続を確立
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // ユーザーのカフェ閲覧履歴をデータベースに挿入または更新
            String sql = "INSERT INTO cafe_view_history (user_id, cafe_id, view_time) VALUES (?, ?, NOW()) ON DUPLICATE KEY UPDATE view_time = NOW();";
            pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, userId);
            pstmt.setString(2, cafeId);
            pstmt.executeUpdate();
        }

        // ユーザーのカフェ閲覧履歴を取得
        if (userId != null) {
            String historySql = "SELECT c.name, c.address, h.view_time FROM cafe_view_history h JOIN cafes c ON h.cafe_id = c.id WHERE h.user_id = ? ORDER BY h.view_time DESC";
            pstmt = connection.prepareStatement(historySql);
            pstmt.setString(1, userId);
            ResultSet rs = pstmt.executeQuery();
%>
            <h1>カフェ閲覧履歴</h1>
            <table border="1">
                <tr>
                    <th>カフェ名</th>
                    <th>住所</th>
                    <th>最終閲覧日時</th>
                </tr>
<%          // 結果セットをループして各履歴レコードを表示
            while (rs.next()) { %>
                <tr>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("address") %></td>
                    <td><%= rs.getTimestamp("view_time") %></td>
                </tr>
<%          } %>
            </table>
<%      }
    } catch (Exception e) {
        // デバッグ用に例外を出力
        e.printStackTrace(out);
    } finally {
        // 開いたPreparedStatementを閉じる
        try { if (pstmt != null) pstmt.close(); } catch (SQLException ignored) {}
        // 開いたデータベース接続を閉じる
        try { if (connection != null) connection.close(); } catch (SQLException ignored) {}
    }
%>
</body>
</html>
