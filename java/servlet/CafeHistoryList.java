package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.CafeHistory;


//リストの表示
@WebServlet("/CafeHistoryList")
public class CafeHistoryList extends HttpServlet {
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

        List<CafeHistory> CafeHistoryList = new ArrayList<>();

        // データベース接続情報
        String url = "jdbc:mysql://localhost:3306/mydatabase"; // DB接続URL
        String dbUser = "root";  // データベースユーザー
        String dbPass = "";      // データベースパスワード

        // SQL文
        String sql = "SELECT * FROM store INNER JOIN view_history  on store.id=view_history.id WHERE username = ?";

        try (Connection con = DriverManager.getConnection(url, dbUser, dbPass);
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            // パラメータを設定
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();

            // 重複を排除するためのセット（HashSet）
            Set<String> seenIds = new HashSet<>();

            // ResultSetからデータを取り出してListに格納
            while (rs.next()) {
                String id = rs.getString("id");
                // idがすでにセットに存在する場合はスキップ
                if (!seenIds.contains(id)) {
                    String name = rs.getString("name");
                    String address = rs.getString("address");
                    String tags = rs.getString("tags");
                    String image = rs.getString("image");
                    String iframe = rs.getString("iframe");

                    // 新しいidのCafeHistoryをリストに追加
                    CafeHistoryList.add(new CafeHistory(id, name, address, tags, image, iframe));

                    // idをセットに追加して重複を防ぐ
                    seenIds.add(id);
                }
            }

            // セッションにCafeHistoryをセット
            session.setAttribute("CafeHistory", CafeHistoryList);
            session.setAttribute("isEmpty", CafeHistoryList.isEmpty());

            // お気に入りリストを表示するJSPに転送
            request.getRequestDispatcher("/SearchCafeHistory.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace(); // エラーがあればログに記録
            request.setAttribute("message", "データベースエラーが発生しました。");
            request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
        }
    }
}
