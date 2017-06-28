package jp.co.comnic.skt.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.comnic.skt.dao.BaseDao;
import jp.co.comnic.skt.dao.DaoException;



/**
 * <p>レコードの更新処理を実行するActionインターフェイスの実装。</p>
 * 
 * @author M.Yoneyama
 * @version 1.0
 */
public class UpdateAction implements Action {

	/* (non-Javadoc)
	 * @see jp.co.comnic.javalesson.webapp.ems.controller.Action#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String redirectPath = null;
		String forwardPath = null;
		
		String servletPath = request.getServletPath();
		forwardPath = "update.jsp"; // 例外発生時のフォワード先（元の登録画面）
		String lunchName = (request.getParameter("id")); // 削除するレコードのID
		System.out.println(lunchName);
		
		try {
			
			BaseDao dao = new BaseDao();
			
			// リクエスト・パラメーターで渡されたIDからエンティティ・オブジェクトを取得
			Object entity = dao.findById(
					Class.forName(ControllerUtils.getFullyQualifiedClassName(servletPath)), lunchName);
			
			// リクエスト・パラメータの値を使用してエンティティ・オブジェクトのフィールド値を設定
			ControllerUtils.populateEntity(request, entity);
			
			new BaseDao().update(entity);
			
		} catch (DaoException e) {
			request.setAttribute("error", "[ERROR]: " + 
			                      ControllerUtils.getShortMessage(e));
		} catch (Exception e) {
			throw new ServletException(e);
		} 
		
		return forwardPath;
	}
}
