<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
	<div class="masthead clearfix">
            <div class="inner">
              <h1 class="masthead-brand">お昼ご飯評価システム(仮)</h1>
              <nav>
                <ul class="nav masthead-nav">
                
                  <li class="active"><a href="index.html">ホーム</a></li>
                  <li><a href="login.html">ログイン</a></li>
                  <li><a href="lunch.html">お昼ご飯情報</a></li>

                </ul>
                  <p>Login user: ${loginUsername}
                  <a href="${ctxPath}/logout.do"> － Logout</a>
                  </p>
              </nav>
           </div>
    </div>