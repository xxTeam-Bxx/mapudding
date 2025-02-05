package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ShopSearch")
public class ShopSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // リクエストの文字コード設定
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        // 検索ワードを取得
        String keywordsParam = request.getParameter("keyword");
        System.out.println(keywordsParam);
        if (keywordsParam == null || keywordsParam.trim().isEmpty()) {
            request.setAttribute("errorMessage", "検索キーワードを入力してください。");
            
            String username = (String) session.getAttribute("username");
            
            
            if (username == null || username.isEmpty()) {
                request.getRequestDispatcher("Home.jsp").forward(request, response);
                return;
            }else {
            	request.getRequestDispatcher("Home.jsp").forward(request, response);
            }
            
            return;
        }
        
     // 現在のタグリストをセッションに保存
        if (keywordsParam != null && !keywordsParam.trim().isEmpty()) {
            List<String> tagList = Arrays.asList(keywordsParam.trim().split("\\s+"));
            session.setAttribute("tagList", tagList); // セッションに保存
        }

        // キーワードを空白で分割してリストに格納
        String[] keywords = keywordsParam.trim().split("\\s+");
        List<String> storeNames = new ArrayList<>();


        // データベース接続情報
        String dbUrl = "jdbc:mysql://localhost:3306/mydatabase";
        String dbUser = "root";
        String dbPassword = "";

        // 動的SQLの生成
        StringBuilder sql = new StringBuilder("SELECT DISTINCT name FROM store WHERE ");
        for (int i = 0; i < keywords.length; i++) {
            sql.append("tags LIKE ?");
            if (i < keywords.length - 1) {
                sql.append(" AND ");
            }
        }

        try {
            // JDBCドライバのロード
            Class.forName("com.mysql.cj.jdbc.Driver");

            // データベース接続とクエリの実行
            try (Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
                 PreparedStatement pstmt = con.prepareStatement(sql.toString())) {

                // キーワードをパラメータにバインド
                for (int i = 0; i < keywords.length; i++) {
                    pstmt.setString(i + 1, "%" + keywords[i] + "%");
                }

                // クエリの実行
                try (ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        storeNames.add(rs.getString("name"));
                    }
                }
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "JDBCドライバのロードに失敗しました。");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "データベースエラーが発生しました。");
        }
        // 結果がない場合のメッセージ設定
        if (storeNames.isEmpty()) {
            request.setAttribute("message", "該当する店舗はありませんでした。");
        }

        // 検索結果をリクエストスコープに設定
        session.setAttribute("storeNames", storeNames);
        
        System.out.println(storeNames);

        // 結果表示ページにフォワード
        RequestDispatcher dispatcher = request.getRequestDispatcher("ShopSearchResult.jsp");
        dispatcher.forward(request, response);
    }
}
