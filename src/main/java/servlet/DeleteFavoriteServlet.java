package servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.FavoriteInfo;

@WebServlet("/DeleteFavoriteServlet")
public class DeleteFavoriteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 画面から店舗名と住所を取得
        String storeName = request.getParameter("storeName");
        String address = request.getParameter("address");

        // セッションからusernameを取得
        HttpSession session = request.getSession();
        List<FavoriteInfo> favoriteStores = (List<FavoriteInfo>) session.getAttribute("favoriteStores");
        String username = (String) session.getAttribute("username");

        // デバッグ情報
        System.out.println("現在のお気に入り登録: " + favoriteStores);
        System.out.println("お気に入り解除: " + username + ", " + storeName);

        if (username != null) {
            // データベース接続情報
            String url = "jdbc:mysql://localhost:3306/mydatabase";
            String dbUser = "root";
            String dbPass = "";

            String sql = "DELETE FROM bookmark WHERE username = ? AND storename = ?";

            try (Connection con = DriverManager.getConnection(url, dbUser, dbPass);
                 PreparedStatement pstmt = con.prepareStatement(sql)) {

                // パラメータを設定
                pstmt.setString(1, username);
                pstmt.setString(2, storeName);

                // SQL実行（削除）
                int rowsAffected = pstmt.executeUpdate();

                if (rowsAffected > 0) {
                    // 成功メッセージをセットして、お気に入りリスト画面にリダイレクト
                    session.setAttribute("message", "お気に入り登録が解除されました。");

                    if (favoriteStores != null && !favoriteStores.isEmpty()) {
                        // 店舗名と住所で一致する店舗をリストから削除
                        boolean removed = favoriteStores.removeIf(store -> 
                            store.getStoreName().equals(storeName) && store.getAddress().equals(address));

                        // 店舗が削除されたかどうかを確認
                        if (removed) {
                            // 更新されたリストをセッションに保存
                            session.setAttribute("favoriteStores", favoriteStores);
                            System.out.println("更新された方: " + favoriteStores);
                        } 
                    } else {
                        session.setAttribute("message", "お気に入りリストが空です。");
                    }

                    // リストを表示するページにリダイレクト
                    response.sendRedirect("FavoriteList"); // リダイレクトして最新のデータを表示

                } else {
                    // 削除に失敗した場合
                    session.setAttribute("message", "店舗情報が見つかりませんでした。");
                    response.sendRedirect("FavoriteList"); // リダイレクトしてメッセージを表示
                }

            } catch (SQLException e) {
                e.printStackTrace();
                // エラーメッセージをセッションにセット
                session.setAttribute("message", "データベースエラーが発生しました。");
                response.sendRedirect("FavoriteList"); // リダイレクトしてエラーメッセージを表示
            }
        } else {
            // セッションにお店の情報がない場合
            session.setAttribute("message", "ログイン情報が無効です。");
            response.sendRedirect("FavoriteList"); // リダイレクトしてメッセージを表示
        }
    }
}
