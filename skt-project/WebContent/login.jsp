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
              <p>Login user: ${loginUsername}
              <a href="${ctxPath}/logout.do"> － Logout</a>
              </p>
              </nav>
            </div>
          </div>

    <div align="center">
      <form method="POST" action= "index2.jsp">
        <table>
         <tr>
          <td>
            <b>email:</b>
          </td>
          <td>
            <input name = "email" size="20" placeholder="email">
            </td>
         </tr>
         <tr>
            <td>
            <b>pass:</b>
            </td>
          <td>
          <input type ="password" name = "pass" size="20" placeholder="pass">
          </td>
        </tr>
       </table>
       <br>
        <input type= "submit" value = "ログイン">
     </form>
     
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
