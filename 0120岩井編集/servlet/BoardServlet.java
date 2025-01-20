package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.BoardListSearch;
import model.BoardList;

@WebServlet("/Board")
public class BoardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 文字エンコーディングを設定
        request.setCharacterEncoding("UTF-8");
        // 評価値を取得
        String ratingStr = request.getParameter("rating");
        int rating = 0;
        try {
            rating = Integer.parseInt(ratingStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "無効な評価値です");
            return;
        }

        System.out.println("選択された評価: " + rating);
        // セッションからデータを取得
        HttpSession session = request.getSession();
        int id = (int) session.getAttribute("id");
        String username = (String) session.getAttribute("username");
        // コメントを取得
        String comment = request.getParameter("comment");
        if (comment == null) {
        	request.setAttribute("message", "コメントを入力してください");
        	request.getRequestDispatcher("Board.jsp").forward(request, response);
            return;
        }

        System.out.println(id);
        System.out.println(username);
        System.out.println(comment);
        System.out.println(rating);
        // ユーザーがログインしていない場合、ログインページにリダイレクト
        if (username == null || username.isEmpty()) {
            response.sendRedirect("Login.jsp");
            return;
        }
        

        // データベース接続情報
        String url = "jdbc:mysql://localhost:3306/mydatabase";
        String user = "root";
        String pass = "";

        // SQLクエリ
        String sql = "INSERT INTO board (id, username, comment, rating) VALUES (?, ?, ?, ?)";

        // データベース処理
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // JDBCドライバをロード
            try (Connection con = DriverManager.getConnection(url, user, pass);
                 PreparedStatement pstmt = con.prepareStatement(sql)) {

                // SQLパラメータを設定
                pstmt.setInt(1, id);
                pstmt.setString(2, username);
                pstmt.setString(3, comment);
                pstmt.setInt(4,rating);

                // SQLを実行
                int res = pstmt.executeUpdate();

                
                if (res > 0) {
                	 // コメントを取得
                    BoardListSearch boardListSearch = new BoardListSearch();
                    List<BoardList> boardList = boardListSearch.getCommentsByStoreId(con, id);
                    session.setAttribute("BoardList", boardList);
                    session.setAttribute("isEmpty", boardList.isEmpty());
    
                    // 成功時に ShopDetails.jsp にリダイレクト
                    RequestDispatcher rd = request.getRequestDispatcher("ShopDetails.jsp");
                    rd.forward(request, response);
                } else {
                    // 失敗時のエラー処理
                    request.setAttribute("message2", "登録に失敗しました。");
                    request.getRequestDispatcher("ShopDetails.jsp").forward(request, response);
                }
   
            }
            
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "ドライバのロードに失敗しました。");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "データベースエラーが発生しました。");
        }
    }
}
