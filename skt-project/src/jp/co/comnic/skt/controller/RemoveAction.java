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
		
		String servletPath = request.getServletPath();
		String forwardPath = "./";
		String redirectPath = "./";
		Integer id = Integer.parseInt(request.getParameter("id")); // 削除するレコードのID
		
		try {
			
			// リクエストされたサーブレット・パスから完全修飾クラス名を取得
			String entityClass = ControllerUtils.getFullyQualifiedClassName(servletPath);
			// DAOを使用してエンティティ・オブジェクトを削除
			new BaseDao().remove(Class.forName(entityClass));
			
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
