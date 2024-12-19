package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.FavoriteInfo;

@WebServlet("/FavoriteList")
public class FavoriteList extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // セッションから username を取得
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        // ユーザーがログインしていない場合、ログインページにリダイレクト
        if (username == null || username.isEmpty()) {
            response.sendRedirect("Login.jsp");
            return;
        }
        List<FavoriteInfo> favoriteStores = new ArrayList<>();

        // データベース接続情報
        String url = "jdbc:mysql://localhost:3306/mydatabase"; // DB接続URL
        String dbUser = "root";  // データベースユーザー
        String dbPass = "";      // データベースパスワード

        // SQL文
        String sql = "SELECT  storename, address FROM bookmark WHERE username = ?";

        try (Connection con = DriverManager.getConnection(url, dbUser, dbPass);
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            // パラメータを設定
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();

            // ResultSetからデータを取り出してListに格納
            while (rs.next()) {
                String storeName = rs.getString("storename");
                String address = rs.getString("address");
                favoriteStores.add(new FavoriteInfo(storeName, address));
            }
            System.out.println(favoriteStores);

            // リクエストにfavoriteStoresをセット
            request.setAttribute("favoriteStores", favoriteStores);
            
            // お気に入りリストが空かどうかを判定し、その結果も渡す
            request.setAttribute("isEmpty", favoriteStores.isEmpty());


            // お気に入りリストを表示するJSPに転送
            request.getRequestDispatcher("/favoriteList.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace(); // エラーがあればログに記録
            request.setAttribute("message", "データベースエラーが発生しました。");
            request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
        }
    }
}
