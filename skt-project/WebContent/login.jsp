<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
       <jsp:include page="html-header.jsp">
	 <jsp:param  name="page" value="header"/>
 	 </jsp:include>
 	 
  <body>

    <div class="site-wrapper">
      <div class="site-wrapper-inner">
        <div class="cover-container">
          <div class="masthead clearfix">
            <div class="inner">
              <h1 class="masthead-brand">お昼ご飯評価システム(仮)</h1>
              <nav>
                <ul class="nav masthead-nav">
                  <li><a href="index.jsp">ホーム</a></li>
                  <li class="active"><a href="login.jsp">ログイン</a></li>
                  <li><a href="lunch.jsp">お昼ご飯情報</a></li>

                </ul>
			     
              </nav>
            </div>
          </div>
<jsp:include page="log-header.jsp">
				 <jsp:param  name="page" value="login"/>
			 	 </jsp:include>
    <div align="center">
    	<div class="form-border">
      	<form method="post" action= "login.do">
      	<h3>ログイン</h3>
        <table>
         <tr>
          <td bgcolor="#fd5b78">
            <b>Eメール</b>
          </td>
          <td>
            <input name = "email" size="20" placeholder="メールアドレス">
            </td>
         </tr>
         <tr>
            <td bgcolor="#fd5b78">
            <b>パスワード</b>
            </td>
          <td>
          <input type ="password" name = "password" size="20" placeholder="パスワード">
          </td>
        </tr>
       </table>
       <br>
        <input type= "submit" value = "ログイン">
        
     </form>
     <br>
     </div>
     
     <p class="error">${error}</p>
     
      <br>
      <div class="inner cover">
            <p class="lead">
              <a href="signup.jsp" class="btn btn-lg btn-default">新規登録</a>
            </p>
            </div>
     </div>
          </div>

        </div>
        </div>
        
        
        
     <jsp:include page="page-footer.jsp"></jsp:include>
    
    <jsp:include page="html-footer.jsp"></jsp:include>

  </body>
</html>
