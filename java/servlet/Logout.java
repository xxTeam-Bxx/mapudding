package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Logout")
public class Logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // セッションを取得（存在しない場合はnullを返す）
        HttpSession session = request.getSession(false);

        // セッションに "username" 属性が存在する場合のみ破棄
        if (session != null && session.getAttribute("username") != null) {
            session.invalidate(); // セッションを破棄
            System.out.println("ログアウトしました。セッションが無効化されました。");
            response.sendRedirect("top.html");
        } else {
            System.out.println("セッションが存在しないか、'username' 属性が設定されていません。");
        }

    }
}
