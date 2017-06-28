package jp.co.comnic.skt.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.comnic.skt.controller.ControllerUtils;
import jp.co.comnic.skt.dao.BaseDao;

public class ReviewAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String servletPath = request.getServletPath();
		String id = request.getParameter("id");
		
//		String redirectPath = "review.jsp";
		String forwardPath = "review.jsp"; 
		
try {
			
			BaseDao dao = new BaseDao();
			
			// リクエスト・パラメーターで渡されたIDからエンティティ・オブジェクトを取得
			System.out.println("out:" + ControllerUtils.getFullyQualifiedClassName(servletPath));
			Object entity = dao.findById(
					Class.forName(ControllerUtils.getFullyQualifiedClassName(servletPath)), id);
			
			// リクエスト・パラメータの値を使用してエンティティ・オブジェクトのフィールド値を設定
			ControllerUtils.populateEntity(request, entity); 
			
		} catch (Exception e) {
			throw new ServletException(e);
		} 
		
		return forwardPath;
	}

}
