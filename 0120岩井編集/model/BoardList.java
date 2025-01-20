package model;

public class BoardList {
    
    private int id;
    private String username;
    private String comment;
    private int rating;

    // コンストラクタ
    public BoardList(int id,String username,String comment,int rating) {
    	this.id = id;
    	this.username = username;
    	this.comment = comment;
    	this.rating = rating;
    }

    // 初期化メソッド（HttpServletRequest を処理する）
    public void initializeFromRequest(String idParam, String usernameParam, String commentParam,String ratingParam) {
        // id の型変換とエラーハンドリング
        try {
            this.id = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            this.id = -1; // デフォルト値を設定（必要に応じて変更）
        }
        try {
            this.rating = Integer.parseInt(ratingParam);
        } catch (NumberFormatException e) {
            this.rating = 0; // デフォルト値を設定（必要に応じて変更）
        }

        // username と comment のバリデーション
        this.username = (usernameParam != null && !usernameParam.isEmpty()) ? usernameParam : "名無し";
        this.comment = (commentParam != null && !commentParam.isEmpty()) ? commentParam : "コメントなし";
    }

    // Getter / Setter
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getComment() {
        return comment;
    }
    public void setComment(String comment) {
        this.comment = comment;
    }
    public int getRating() {
        return rating;
    }
    public void setRating(int rating) {
        this.rating = rating;
    }


    @Override
	public String toString() {
		return id+username+comment+rating;
	}

	public static void add(BoardList boardList) {
		// TODO 自動生成されたメソッド・スタブ
		
	}
}
