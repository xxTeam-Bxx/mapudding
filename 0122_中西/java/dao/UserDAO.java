
package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/User")
public class UserDAO extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // セッションから username を取得
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        // username がセッションに格納されていない場合、ログイン画面にリダイレクト
        if (username == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        // データベース接続情報
        String url = "jdbc:mysql://localhost:3306/mydatabase";
        String dbUser = "root";
        String dbPass = "";

        // コメント情報を取得するSQL文
        String sql = "SELECT comment FROM users WHERE username = ?";

        try (Connection con = DriverManager.getConnection(url, dbUser, dbPass);
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, username);  // username を SQL にセット

            try (ResultSet res = pstmt.executeQuery()) {
                if (res.next()) {
                    // コメント情報を取得
                    String comment = res.getString("comment");

                    // 取得したコメントをリクエストスコープに設定
                    request.setAttribute("comment", comment);
                } else {
                    // ユーザーが存在しない場合の処理
                    request.setAttribute("error", "ユーザーが見つかりませんでした。");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "データベース接続エラーが発生しました。");
        }

        // profile.jsp へフォワード
        RequestDispatcher dispatcher = request.getRequestDispatcher("MyProfile.jsp");
        dispatcher.forward(request, response);
    }
}
