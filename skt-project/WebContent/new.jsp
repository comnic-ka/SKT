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
                  <li><a href="index2.jsp">ホーム</a></li>
                  <li><a href="lunch2.jsp">お昼ご飯情報</a></li>
                  <li class="active"><a href="edit.jsp">情報編集</a></li>
                </ul>
			     
              </nav>
            </div>
          </div>
          
          <jsp:include page="log-header.jsp">
				 <jsp:param  name="page" value="login"/>
			 	 </jsp:include>
          
          <div align="center">
        <div class="form-border">
		<h3>新規</h3>
      		<form method="POST" action= "insertBento.do">
        		<table>
         			<tr>
          				<td bgcolor="#fd5b78">店名</td>
          				<td><input name = "lunchName" size="20" placeholder="lunchName"></td>
         			</tr>
         			<tr>
            			<td bgcolor="#fd5b78">住所</td>
          				<td><input name = "location" size="20" placeholder="location"></td>
        			</tr>
       			</table><br>
       			
        		<input type= "submit" value = "登録">
     		</form>
     		<p class="error">${error}</p><br>
     		</div>
          
          <br><a href="edit.jsp">← 編集ページへ戻る</a>
          
          </div>

        </div>

      </div>

    </div>

    <jsp:include page="page-footer.jsp"></jsp:include>
    <jsp:include page="html-footer.jsp"></jsp:include>
  </body>
</html>