package jp.co.comnic.skt.controller;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebListener;

@WebListener
public class ActionFactory implements ServletContextListener{
	
	private static ServletContext context;

	public static Action getAction(String servletPath) throws ServletException{
		
		Action action = null;
		
		// 引数で渡されたServletパスに対応するActionの実装クラス名を取得
		String actionClassName = context.getInitParameter(servletPath);
		System.out.println(actionClassName);
				
		try {
			// 取得したActionの実装クラス名からインスタンスを生成
			action = (Action)Class.forName(actionClassName).newInstance();
		} 
		catch (Exception e) {
			throw new ServletException(e);
		}
				
		// 生成したActionの実装クラスのインスタンスを返す
		return action;
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// コンテナ起動時にServletContextオブジェクトを受け取ってフィールドにセット
		context = arg0.getServletContext();
	}
	
	
}
