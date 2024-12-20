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
        String userName ="";
        String id="";
        String name="";
        String address="";
        String tags="";
        String image="";
        String iframe="";

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
        System.out.println(username);
        try (Connection con = DriverManager.getConnection(url, dbUser, dbPass);
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            // パラメータを設定
            pstmt.setString(1, username);
            System.out.println(pstmt);
            ResultSet rs = pstmt.executeQuery();

            // ResultSetからデータを取り出してListに格納
            while (rs.next()) {
            	
                id = rs.getString("id");
                name = rs.getString("name");
                address = rs.getString("address");
                tags = rs.getString("tags");
                image = rs.getString("image");
                iframe = rs.getString("iframe");
                CafeHistoryList.add(new CafeHistory(id,name,address,tags,image,iframe));
            }
            System.out.println(CafeHistoryList);
            System.out.println(userName);
            
           
            // リクエストにCafeHistoryをセット
            session.setAttribute("CafeHistory", CafeHistoryList);
            
            // お気に入りリストが空かどうかを判定し、その結果も渡す
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
