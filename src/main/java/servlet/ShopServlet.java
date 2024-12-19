package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ShopServlet")
public class ShopServlet extends HttpServlet{
		private static final long serialVersionUID = 1L;
		protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			request.setCharacterEncoding("Windows-31J");
			/*
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			*/
			
			System.out.println("なんで");
			String id = "";
			String name = "";
			String address = "";
			String tags = "";
			String image = "";
			
			try {
				System.out.println("a");
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "");
				StringBuffer sql = new StringBuffer();
				sql.append("select * from store ");
				
				if(id != "") {
					sql.append("where name ='" + id + "'");
				}
				if(name != "") {
					sql.append("and password ='" + name + "'");
				}
				if(address != "") {
					sql.append("and password ='" + address + "'");
				}
				if(tags != "") {
					sql.append("and password ='" + tags + "'");
				}
				if(image != "") {
					sql.append("and password ='" + image + "'");
				}
				
				System.out.println("なんで２");
				System.out.println(sql);
				pstmt = conn.prepareStatement(new String(sql));
				pstmt.execute();
				rset = pstmt.executeQuery(new String(sql));
				System.out.println("なんで３");

				
				request.setAttribute("kekka",rset);
				//セッションスコープからユーザー情報を取得
				HttpSession session = request.getSession();
	            session.setAttribute("kekka", rset);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/Home.jsp");
				System.out.println("なんで４");
				dispatcher.forward(request,response);
				pstmt.close();
				conn.close();
			}catch(Exception e) {
				System.out.println("error");
				e.printStackTrace();
			}
		}

	}
	/*
		private static final long serialVersionUID = 1L;
		
		
		protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
			request.setCharacterEncoding("Windows-31J");
			
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			//yamada
			System.out.println("ee");
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String address = request.getParameter("address");
			String tag = request.getParameter("tag");
			
			 // ログイン認証後に遷移する先を格納する
		    String path = "";
			
			try {
				
				// PostgreSQLに接続するためのURL
		        String url = "jdbc:mysql://localhost:3306/shop";
		        String user = "root";
		        String pass = "";
				
		        //usernameとpasswordが一致するユーザーのidをとってくる
		        String sql = "SELECT store FROM store WHERE id=?";

		        
				System.out.println("ee");
				Class.forName("com.mysql.cj.jdbc.Driver");
				try(Connection con = DriverManager.getConnection(url,user,pass);
						PreparedStatement pstmt = con.prepareStatement(sql)){
					
				
				
				//入力されたユーザーIDとパスワードをSQLの条件にする
				pstmt.setString(1,id);
				pstmt.setString(2,name);
				pstmt.setString(3,address);
				pstmt.setString(4,tag);
				
				//SQLの実行
				ResultSet res = pstmt.executeQuery();
				
				// ユーザーIDとパスワードが一致するユーザーが存在した時
	            if (res.next()) {
	                // user_idをリクエストスコープに設定する
	                request.setAttribute("name", res.getString("name"));
	                System.out.println("name");
	               
	            } else {
	                // ログイン失敗の文言を追加する
	                request.setAttribute("loginFailure", "ログインに失敗しました");

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
	*/