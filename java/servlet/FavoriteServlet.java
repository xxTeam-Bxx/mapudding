package servlet;

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

@WebServlet("/FavoriteServlet")
public class FavoriteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // セッションからユーザー名、店舗名、住所を取得
        System.out.println("お気に入り登録");
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        
        
        if (username == null || username.isEmpty()) {
            request.setAttribute("message1", "会員登録でこの機能はご利用いただけます。");
            request.getRequestDispatcher("/ShopDetails.jsp").forward(request, response);
            System.out.println("会員登録してね");
            return;
        }
     // リクエストからパラメータを取得
        String storeName = request.getParameter("storeName");
        String address = request.getParameter("address");


        if (storeName == null || storeName.isEmpty() || address == null || address.isEmpty()) {
            request.setAttribute("message1", "店舗名または住所が指定されていません。");
            request.getRequestDispatcher("/ShopDetails.jsp").forward(request, response);
            System.out.println("お店情報がないよ");
            return;
        }

        try {
        // データベース接続情報
        String url = "jdbc:mysql://localhost:3306/mydatabase"; // DB接続URL
        String dbUser = "root";  // データベースユーザー
        String dbPass = "";      // データベースパスワード

        
      //usernameとpasswordが一致するユーザーのidをとってくる
        String sql = "INSERT INTO bookmark (username, storename, address) VALUES (?, ?, ?)";


        System.out.println("a");
        Class.forName("com.mysql.cj.jdbc.Driver");
        try(Connection con = DriverManager.getConnection(url,dbUser,dbPass);
        		PreparedStatement pstmt = con.prepareStatement(sql)){

        	// 同じ店舗名が既に存在するかを確認
            String checkSql = "SELECT COUNT(*) FROM bookmark WHERE username = ? AND storename = ?";
            PreparedStatement stmt = con.prepareStatement(checkSql);
            stmt.setString(1, username);
            stmt.setString(2,storeName);

            ResultSet rest = stmt.executeQuery();
            System.out.println("b");
            if (rest.next()) {
                int count = rest.getInt(1);
               
                if (count > 0) {
                	// 登録失敗の文言を追加する
                    request.setAttribute("message1", "このお店はすでにブックマークに登録されています。");
                    // 登録失敗の文言を追加する
                    RequestDispatcher rd1 = request.getRequestDispatcher("ShopDetails.jsp");
                    rd1.forward(request, response);
                    // 登録に失敗したときはもう一度お店の詳細画面を表示する
                    return;
                }
                
            }
        System.out.println("c");

        //入力されたユーザーIDとパスワードをSQLの条件にする
        pstmt.setString(1,username);
        pstmt.setString(2, storeName);
        pstmt.setString(3, address);

        System.out.println(storeName);
        //SQLの実行
        int res = pstmt.executeUpdate();
        if (res > 0) {
        	request.setAttribute("message1", "ブックマークに登録しました");
            RequestDispatcher rd = request.getRequestDispatcher("ShopDetails.jsp");
            rd.forward(request, response);
        } else {
        	request.setAttribute("message1", "登録に失敗しました。");            
        	}
        }  
        }
        catch(ClassNotFoundException | SQLException e) {
        System.out.println("error");
        e.printStackTrace();
        }
    }
}
    



