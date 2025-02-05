package servlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.BoardList;

public class RatingAverageServlet {

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
    
    // 評価の合計値とリストサイズ
    double rtAvg = 0.0;
    double rta = 0;
    int ListSize = 0;

    public double AvgRating(Connection con, int id) throws SQLException {
        List<BoardList> boardList = new ArrayList<>();
        String sql = "SELECT username, comment, rating  FROM board WHERE id = ?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, id); // 店舗IDをセット
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String username = rs.getString("username");
                    String comment = rs.getString("comment");
                    String rating = rs.getString("rating");  // 評価値（String型）
                    
                    // BoardListにデータを追加
                    boardList.add(new BoardList(id, username, comment, rating));
                    
                    
                    if (rating != null) {
                            double rt = Double.parseDouble(rating);  // 評価を整数に変換
                            rta += rt;  // 合計を加算
                        
                        }
                    }
                
                // リストのサイズを取得
                ListSize = boardList.size();
                
                // リストサイズが0でない場合に平均値を計算
                if (ListSize != 0) {
                    rtAvg = rta / ListSize;
                 // 小数点第２以下を切り捨て
                    rtAvg = rtAvg * 10;
                    rtAvg = Math.round(rtAvg);
                    rtAvg = rtAvg / 10;
             
                    System.out.println("平均評価: " + rtAvg);
                } else {
                    System.out.println("評価データが存在しないため、平均評価を計算できません。");
                }
            }
        }
        return rtAvg;
    }
}
