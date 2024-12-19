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

@WebServlet("/ShopLink")
public class ShopLink extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // JSPから送信されたパラメータを取得
        String name = request.getParameter("name");

        if (name != null && !name.isEmpty()) {
            // パラメータが存在する場合の処理
            System.out.println("取得した名前: " + name);

            // 必要に応じてリクエストに属性を設定し、新しいJSPページへ転送
            request.setAttribute("storeName", name);
        } else {
            // パラメータがない場合のエラー処理
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "パラメータ 'name' が指定されていません。");
        }
     // データベース接続情報
        String url = "jdbc:mysql://localhost:3306/mydatabase";
        String dbUser = "root";
        String dbPass = "";

     // コメント情報を取得するSQL文
        String sql = "SELECT address FROM store WHERE name = ?";

        try (Connection con = DriverManager.getConnection(url, dbUser, dbPass);
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, name);  // username を SQL にセット

            try (ResultSet res = pstmt.executeQuery()) {
                if (res.next()) {
                    // コメント情報を取得
                    String address = res.getString("address");
                    System.out.println(address);
                    // 取得したコメントをリクエストスコープに設定
                    request.setAttribute("address", address);
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
        RequestDispatcher dispatcher = request.getRequestDispatcher("storeDetails.jsp");
        dispatcher.forward(request, response);
    }
    
}
