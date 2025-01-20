package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.BoardList;

public class BoardListSearch {

    /**
     * コメントを取得するメソッド
     * 
     * @param con データベース接続オブジェクト
     * @param id 店舗ID
     * @return コメントリスト
     * @throws SQLException SQL例外
     */
	// データベース接続情報
    String url = "jdbc:mysql://localhost:3306/mydatabase";
    String dbUser = "root";
    String dbPass = "";
    
    public List<BoardList> getCommentsByStoreId(Connection con, int id) throws SQLException {
        List<BoardList> boardList = new ArrayList<>();
        String sql = "SELECT username, comment, rating  FROM board WHERE id = ?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, id); // 店舗IDをセット
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String username = rs.getString("username");
                    String comment = rs.getString("comment");
                    int rating = rs.getInt("rating");
                    boardList.add(new BoardList(id, username, comment,rating));
                    System.out.println(comment+"3");
                }
            }
        }
        return boardList;
    }
}
