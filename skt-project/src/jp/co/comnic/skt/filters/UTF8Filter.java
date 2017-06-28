package jp.co.comnic.skt.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * <p>ユーザーがログイン認証済みかどうかを確認するためのFilter。ユーザーが未ログインであればログイン画面に遷移。</p>
 * 
 * @author M.Yoneyama
 * @version 1.0
 *
 */
@WebFilter("utf")// アプリケーションに対するすべてのリクエストに対してこのFilterを適用
public class UTF8Filter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// Nothing to do
	}
	
	/* 
	 * <p>Filter処理の本体。リクエストが処理される直前、およびレスポンスが返送される直前に対する処理を記述。</p>
	 * 
	 * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		// このメソッドが受け取る引数はHTTPに依存しないServletRequestおよびServletResponseであることに注意。
		
//			↑　このメソッドの上の処理はリクエスト・フィルター
			chain.doFilter(request, response);
//			↓　このメソッドの上の処理はレスポンス・フィルター
	}
		

	@Override
	public void destroy() {
		// Nothing to do
	}
}
