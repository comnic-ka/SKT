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
			     <jsp:include page="log-header.jsp">
				 <jsp:param  name="page" value="login"/>
			 	 </jsp:include>
              </nav>
            </div>
          </div>

    <div align="center">
      <form method="post" action= "login.do">
        <table>
         <tr>
          <td bgcolor="#778899">
            <b>email:</b>
          </td>
          <td>
            <input name = "email" size="20" placeholder="email">
            </td>
         </tr>
         <tr>
            <td bgcolor="#778899">
            <b>pass:</b>
            </td>
          <td>
          <input type ="password" name = "password" size="20" placeholder="pass">
          </td>
        </tr>
       </table>
       <br>
        <input type= "submit" value = "ログイン">
     </form>
     
     <p class="error">${error}</p>
     
      <br><br>
      <a href="signup.jsp">新規登録</a>
     </div>
          </div>

        </div>
        </div>
        
     <jsp:include page="page-footer.jsp"></jsp:include>
    
    <jsp:include page="html-footer.jsp"></jsp:include>

  </body>
</html>
