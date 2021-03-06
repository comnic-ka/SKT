package jp.co.comnic.skt.controller;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;
import org.apache.commons.beanutils.converters.DateConverter;

/**
 * <p>
 * コントローラーの処理に関連する便利なメソッドをまとめたユーティリティ・クラス。
 * </p>
 * 
 * @author M.Yoneyama
 * @version 1.0
 */
public class ControllerUtils {

	/**
	 * <p>
	 * 渡されたサーブレット・パスからエンティティの完全修飾クラス名を生成して返す。
	 * </p>
	 * <p>
	 * ここで渡されるサーブレット・パスは「/employees/...」のようなものを想定し、この場合、エンティティ・クラス
	 * の完全修飾名は「jp.co.comnic.javalesson.webapp.ems.entity.employee」となる。
	 * したがって、サーブレット・パスとエンティティ・クラスとの対応ルールやパッケージ名を変更する場合にはこのメソッドは機能しない 点に注意。
	 * </p>
	 * 
	 * @param servletPath
	 *            リクエストURLに含まれるサーブレット・パス
	 * @return エンティティ・クラスの完全修飾クラス名
	 */
	public static String getFullyQualifiedClassName(String servletPath) {

		String className = "";
		System.out.println(servletPath);
		if ("/insert.do".equals(servletPath)) {
			className = "Account";
		} else if ("/insertBento.do".equals(servletPath) || "/RemoveBento.do".equals(servletPath) || "/edit.do".equals(servletPath)) {
			className = "Lunch";
		}else if ("/review.do".equals(servletPath)) {
			className = "Review";
		}
		String packageName = "jp.co.comnic.skt.entity.";

		return packageName + className;
	}

	
	/**
	 * <p>
	 * リクエスト・パラメーターの値からエンティティ・オブジェクトを生成して返す。
	 * </p>
	 * 
	 * @param request
	 * @param entity
	 */
	public static void populateEntity(HttpServletRequest request, Object entity) {

		// リクエスト・パラメーターの集合をMapオブジェクトとして取得
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Map<String, String[]> parameterMap = request.getParameterMap();

		// Map<String, String>に変換
		Map<String, String> propertyMap = new HashMap<>();
		for (String key : parameterMap.keySet()) {
			propertyMap.put(key, parameterMap.get(key)[0]);
		}
		if(propertyMap.equals(null)){
			
		}else{

		try {

			// Apache Commons ProjectのBeanUtilsを使用して
			// Mapオブジェクトからエンティティ・オブジェクトへ値をセット
			BeanUtils.populate(entity, propertyMap);

		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	}

	/*
	 * リクエスト・パラメーターとして送られてきたString型のdept_idからDepartmentオブジェクト
	 * に変換するBeanUtils用カスタム・コンバーター
	 */

	/**
	 * <p>
	 * データベースに関連するエラー・メッセージから最も重要な短いメッセージを取り出して返す。
	 * </p>
	 * 
	 * @param e
	 *            例外オブジェクト
	 * @return 例外オブジェクトから取り出した簡略なメッセージ
	 */
	public static String getShortMessage(Throwable e) {

		String errorMessage = e.getCause().getMessage().split(":")[3];

		if (errorMessage.endsWith("Error Code")) {
			errorMessage = errorMessage.replaceAll("Error Code", "");
		}

		return errorMessage;
	}
}
