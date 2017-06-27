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
			     <jsp:include page="log-header.jsp">
				 <jsp:param  name="page" value="login"/>
			 	 </jsp:include>
              </nav>
            </div>
          </div>
		<li>新規</li>
			<div align="center">
      <form method="POST" action= "insertBento.do">
        <table>
         <tr>
          <td>
            <b>店名:</b>
          </td>
          <td>
            <input name = "lunchName" size="20" placeholder="lunchName">
            </td>
         </tr>
         <tr>
            <td>
            <b>住所:</b>
            </td>
          <td>
          <input type ="location" name = "location" size="20" placeholder="location">
          </td>
        </tr>
       </table>
       <br>
        <input type= "submit" value = "登録">
     </form>

          <li>更新</li>
          <li>削除</li>

        </div>

      </div>

    </div>

    <jsp:include page="page-footer.jsp"></jsp:include>
    <jsp:include page="html-footer.jsp"></jsp:include>
  </body>
</html>