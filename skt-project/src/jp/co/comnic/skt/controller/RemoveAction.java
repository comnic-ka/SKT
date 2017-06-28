package jp.co.comnic.skt.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.comnic.skt.dao.BaseDao;
import jp.co.comnic.skt.dao.DaoException;


public class RemoveAction implements Action {

	/* (non-Javadoc)
	 * @see jp.co.comnic.javalesson.webapp.ems.controller.Action#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String redirectPath = null;
		String forwardPath = null;
		
		String servletPath = request.getServletPath();
		redirectPath = "lunch2.jsp"; // 正常処理のリダイレクト先（一覧画面）
		forwardPath = "edit.jsp"; // 例外発生時のフォワード先（元の登録画面）
		String lunchName = (request.getParameter("lunchName")); // 削除するレコードのID
		
		try {
			
			// リクエストされたサーブレット・パスから完全修飾クラス名を取得
			String entityClass = ControllerUtils.getFullyQualifiedClassName(servletPath);
			// DAOを使用してエンティティ・オブジェクトを削除
			new BaseDao().remove(Class.forName(entityClass),lunchName);
			
			forwardPath = null;
			response.sendRedirect(redirectPath);
			
		} catch (DaoException e) {
			request.setAttribute("error", "[ERROR]: " + 
                                  ControllerUtils.getShortMessage(e));
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
		return forwardPath;
	}

}
