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

@WebServlet("/Insert")
public class InsertServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.getRequestDispatcher("NewLogin.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		request.setCharacterEncoding("Windows-31J");
		/*
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		*/
		//yamada
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username);
		try {
			
			// SQLに接続するためのURL
	        String url = "jdbc:mysql://localhost:3306/mydatabase";
	        String user = "root";
	        String pass = "";
			
	        //usernameとpasswordが一致するユーザーのidをとってくる
	        String sql = "INSERT INTO users (username, password,comment) VALUES (?, ?, ?)";
	        String comment="こんにちは";
	        
			System.out.println("a");
			Class.forName("com.mysql.cj.jdbc.Driver");
			try(Connection con = DriverManager.getConnection(url,user,pass);
					PreparedStatement pstmt = con.prepareStatement(sql)){
			
				// 同じメールアドレスが既に存在するかを確認
	            String checkSql = "SELECT COUNT(*) FROM users WHERE username = ?";
	            PreparedStatement stmt = con.prepareStatement(checkSql);
	            stmt.setString(1, username);
	            ResultSet rest = stmt.executeQuery();

	            if (rest.next()) {
	                int count = rest.getInt(1);
	                if (count > 0) {
	                	// 登録失敗の文言を追加する
	                    request.setAttribute("insertFailure", "このユーザー名はすでに使用されています");
	                    // 登録失敗の文言を追加する
	                    RequestDispatcher rd1 = request.getRequestDispatcher("NewLogin.jsp");
	                    rd1.forward(request, response);
	                    // 登録に失敗したときはもう一度ログイン画面を表示する
	                    return;
	                }
	            }
			System.out.println("a");
			
			//入力されたユーザーIDとパスワードをSQLの条件にする
			pstmt.setString(1,username);
			pstmt.setString(2,password);
			pstmt.setString(3,comment);
			
			//SQLの実行
			int res = pstmt.executeUpdate();
            if (res > 0) {
                RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");//登録成功
        	    rd.forward(request, response);
            } else {
            	request.setAttribute("insertFailure", "登録に失敗しました。");            }
			}  
		}catch(ClassNotFoundException | SQLException e) {
			System.out.println("error");
			e.printStackTrace();
		}
		
	}

}