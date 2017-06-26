package jp.co.comnic.skt.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
			
			request.getSession().invalidate(); // セッション管理を無効にする(HttpSessionオブジェクトの破棄)
			response.sendRedirect("login"); // ログイン画面にリダイレクト
			
		return null;
	}

}
