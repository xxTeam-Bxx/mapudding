package servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MapSearch extends HttpServlet {
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     // フォームデータを取得
     String address= request.getParameter("address");

     // データをリクエストスコープに保存
     request.setAttribute("address", address);

     // 別のJSPページにリダイレクト（転送）
     RequestDispatcher dispatcher = request.getRequestDispatcher("Map.jsp");
     dispatcher.forward(request, response);
 }
}
