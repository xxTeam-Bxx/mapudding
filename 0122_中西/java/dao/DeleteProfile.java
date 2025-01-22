package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DeleteProfile")
public class DeleteProfile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // セッションからusernameを取得
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username != null) {
            // データベース接続情報
            String url = "jdbc:mysql://localhost:3306/mydatabase";
            String dbUser = "root";
            String dbPass = "";

            String sql = "DELETE FROM users WHERE username = ?";

            try (Connection con = DriverManager.getConnection(url, dbUser, dbPass);
                 PreparedStatement pstmt = con.prepareStatement(sql)) {

                // usernameをパラメータとして設定
                pstmt.setString(1, username);

                // SQL実行（削除）
                int rowsAffected = pstmt.executeUpdate();

                if (rowsAffected > 0) {
                    // 削除成功した場合
                    session.removeAttribute("username");  // セッションからユーザー情報を削除
                    session.removeAttribute("comment");

                    // 成功メッセージをセットして、プロフィール削除画面にリダイレクト
                    request.setAttribute("message", "プロフィールが削除されました。");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("DeleteMyProfile.jsp");
                    dispatcher.forward(request, response);
                } else {
                    // 削除に失敗した場合
                    request.setAttribute("message", "ユーザーが見つかりませんでした。");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("MyProfile.jsp");
                    dispatcher.forward(request, response);
                }

            } catch (SQLException e) {
                e.printStackTrace();
                // エラーメッセージをリクエストにセット
                request.setAttribute("message", "データベースエラーが発生しました。");
                RequestDispatcher dispatcher = request.getRequestDispatcher("MyProfile.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            // セッションにusernameがない場合
            request.setAttribute("message", "ログイン情報が無効です。");
            RequestDispatcher dispatcher = request.getRequestDispatcher("MyProfile.jsp");
            dispatcher.forward(request, response);
        }
    }
}