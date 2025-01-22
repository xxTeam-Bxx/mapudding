
package dao;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.BoardList;

@WebServlet("/ShopLink")
public class ShopLink extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	// JSPから送信されたパラメータを取得
        String name = request.getParameter("name");
        // セッションから username を取得
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        
        
     
        if (name != null && !name.isEmpty()) {
            // パラメータが存在する場合の処理
            System.out.println("取得した名前: " + name);

            // 必要に応じてリクエストに属性を設定し、新しいJSPページへ転送
            request.setAttribute("storeName", name);
          //店舗名をセッションスコープに保存
			session.setAttribute("storeName",name);
        } else {
            // パラメータがない場合のエラー処理
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "パラメータ 'name' が指定されていません。");
        }
     // データベース接続情報
        String url = "jdbc:mysql://localhost:3306/mydatabase";
        String dbUser = "root";
        String dbPass = "";
        int id =0;

     // コメント情報を取得するSQL文
        String sql = "SELECT id,address,tags,iframe FROM store WHERE name = ?";

        try (Connection con = DriverManager.getConnection(url, dbUser, dbPass);
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, name);  // username を SQL にセット

            try (ResultSet res = pstmt.executeQuery()) {
                if (res.next()) {
                	// 店舗の住所情報を取得
                    id = res.getInt("id");
                    System.out.println(id);
                    // 店舗の住所情報を取得
                    String address = res.getString("address");
                    System.out.println(address);
                    // 店舗のタグ情報を取得
                    String tags = res.getString("tags");
                    System.out.println(tags);
                    // 店舗の住所情報を取得
                    String iframe = res.getString("iframe");
                    System.out.println(iframe);
                    // 取得した店舗の住所と地図をリクエストスコープに設定
                    request.setAttribute("address", address);
                    request.setAttribute("tags", tags);
                    request.setAttribute("iframe", iframe);
                  //店舗名をセッションスコープに保存
                    session.setAttribute("id",id);
        			session.setAttribute("address",address);
        			session.setAttribute("tags", tags);
        			session.setAttribute("iframe", iframe);
        			System.out.println(address);
                } else {
                    // 住所が存在しない場合の処理
                    request.setAttribute("error", "店舗情報が見つかりませんでした。");
                }
                
                
             // ユーザーがログインしている場合、履歴を登録
                if (username != null) {
                	//履歴を登録するコードを追加
                    String sql2 = "INSERT INTO view_history (username, id) VALUES (?, ?)";
                    PreparedStatement stmt = con.prepareStatement(sql2);
                  //入力されたユーザーIDとパスワードをSQLの条件にする
                    stmt.setString(1,username);
                    stmt.setInt(2, id);
                    stmt.executeUpdate();
                    
                    System.out.println(username);
                    
                    System.out.println(id);
                    request.setAttribute("username", "username");
                    request.setAttribute("id", "id");  
                }    
                }
         // コメントを取得
            BoardListSearch boardListSearch = new BoardListSearch();
            List<BoardList> boardList = boardListSearch.getCommentsByStoreId(con, id);
            session.setAttribute("BoardList", boardList);
            session.setAttribute("isEmpty", boardList.isEmpty());
        } catch (SQLException e) {
            e.printStackTrace();
            
            request.setAttribute("error", "データベース接続エラーが発生しました。");
        }
        
     // profile.jsp へフォワード
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("ShopDetails.jsp");
        dispatcher.forward(request, response);
    }
    
}
