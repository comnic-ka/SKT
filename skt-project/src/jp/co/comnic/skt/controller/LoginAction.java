package jp.co.comnic.skt.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.comnic.skt.dao.AccountDao;
import jp.co.comnic.skt.dao.DaoException;
import jp.co.comnic.skt.entity.Account;

public class LoginAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String forwardPath = "login";
		
		try {
			// クライアントから送られてきたメール・アドレスとパスワードを使用して認証処理をAccountDaoに委譲し、
			// 結果をAccountオブジェクトとして取得
			Account account = new AccountDao().loginAuthenticate(email, password);
			
			if (account != null) { // テーブルにマッチするレコードが存在する場合認証成功
				
				// セッション管理を開始し、セッションのスコープ・オブジェクトとなるHttpSessionに
				// 認証済みを表すboolean値とログイン・ユーザー名をセット
				request.getSession().setAttribute("isAuthenticated", "AUTHENTICATED");
				request.getSession().setAttribute("loginUsername", account.getUsername());
							
				// トップページにリダイレクト
				forwardPath = null;
				response.sendRedirect("/" + request.getServletContext().getServletContextName() + "/index2.jsp");
				
			} else {
				request.setAttribute("error", "ログインができません");
				forwardPath = "login";
			}
		} catch (DaoException e) {
			throw new ServletException(e);
		}
		
		return forwardPath;
	}

}
