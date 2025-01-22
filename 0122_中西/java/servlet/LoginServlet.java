
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

@WebServlet("/Login")
public class LoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.getRequestDispatcher("Login.jsp").forward(request, response);
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
		
		 // ログイン認証後に遷移する先を格納する
	    String path = "";
		
		try {
			
			// SQLに接続するためのURL
	        String url = "jdbc:mysql://localhost:3306/mydatabase";
	        String user = "root";
	        String pass = "";
			
	        //usernameとpasswordが一致するユーザーのidをとってくる
	        String sql = "SELECT username FROM users WHERE username=? AND password=?";

	        
			System.out.println("a");
			Class.forName("com.mysql.cj.jdbc.Driver");
			try(Connection con = DriverManager.getConnection(url,user,pass);
					PreparedStatement pstmt = con.prepareStatement(sql)){
				
			
			
			//入力されたユーザーIDとパスワードをSQLの条件にする
			pstmt.setString(1,username);
			pstmt.setString(2,password);
			//追加分
			//セッションスコープからユーザー情報を取得
			//ユーザー情報をセッションスコープに保存
			HttpSession session = request.getSession();
			session.setAttribute("username",username);
			//SQLの実行
			ResultSet res = pstmt.executeQuery();
			
			// ユーザーIDとパスワードが一致するユーザーが存在した時
            if (res.next()) {
                // user_idをリクエストスコープに設定する
                request.setAttribute("username", res.getString("username"));
                // ログイン成功画面に遷移する
                path="Home.jsp";
            } else {
                // ログイン失敗の文言を追加する
                request.setAttribute("loginFailure", "ログインに失敗しました");

             // ログインに失敗したときはもう一度ログイン画面を表示する
                path = "Login.jsp";
            }
			}
			
		}catch(ClassNotFoundException | SQLException e) {
			System.out.println("error");
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(path);
	    rd.forward(request, response);
	}

}
