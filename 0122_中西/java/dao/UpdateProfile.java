
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

@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // セッションからusernameを取得
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        // フォームから送信されたcommentを取得
        String comment = request.getParameter("comment");
        String user = request.getParameter("username");
        if (username != null && comment != null) {
            // データベース接続
            String url = "jdbc:mysql://localhost:3306/mydatabase";
            String dbUser = "root";
            String dbPass = "";

            String sql = "UPDATE users SET username = ?,comment = ? WHERE username = ?";

            try (Connection con = DriverManager.getConnection(url, dbUser, dbPass);
                 PreparedStatement pstmt = con.prepareStatement(sql)) {

                // パラメータをセット
            	pstmt.setString(1, user);
                pstmt.setString(2, comment);
                pstmt.setString(3, username);

                // 更新を実行
                int rowsUpdated = pstmt.executeUpdate();

                if (rowsUpdated > 0) {
                    // 更新成功した場合、セッションに更新したcommentを再設定
                    session.setAttribute("comment", comment);
                    session.setAttribute("username", user);

                    // プロフィールページへリダイレクト
                    response.sendRedirect("MyProfile.jsp");
                } else {
                    // 更新失敗した場合
                    request.setAttribute("errorMessage", "コメントの更新に失敗しました。");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("UpdateProfile.jsp");
                    dispatcher.forward(request, response);
                }

            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "データベースエラーが発生しました。");
                RequestDispatcher dispatcher = request.getRequestDispatcher("UpdateProfile.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            // usernameやcommentがnullの場合
            request.setAttribute("errorMessage", "無効な入力がありました。");
            RequestDispatcher dispatcher = request.getRequestDispatcher("UpdateProfile.jsp");
            dispatcher.forward(request, response);
        }
    }
}
