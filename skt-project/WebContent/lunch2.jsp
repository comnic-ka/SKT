<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
	 <jsp:include page="html-header.jsp">
	 <jsp:param  name="page" value="header"/>
 	 </jsp:include>

  <body>

    <div class="site-wrapper">
      <div class="site-wrapper-inner">
        <div class="cover-container">

            <div class="inner">
              <h1 class="masthead-brand">お昼ご飯評価システム(仮)</h1>
              <nav>
                <ul class="nav masthead-nav">
                  <li><a href="index2.jsp">ホーム</a></li>
                  <li class="active"><a href="lunch2.jsp">お昼ご飯情報</a></li>
                  <li><a href="edit.jsp">情報編集</a></li>
                </ul>
                
			     
			 	 
              </nav>
              
             
 		 		<div class="search-box">
				<form action="" method="post">
				<input type="search" name="name" size=20 placeholder="店名を入力してね">
				<input type="submit" value="検索">
				</form>
				</div><br>
				
				<jsp:include page="log-header.jsp">
				 <jsp:param  name="page" value="login"/>
			 	 </jsp:include>
				
            </div>
		
            		<jsp:include page="list_table.jsp">
		    		<jsp:param name="sql" value="SELECT * FROM LUNCH  WHERE lunch_name LIKE ?"/>
					<jsp:param name="table" value="Lunch"/>
					</jsp:include>
      		</div>
      		
      				<br>
					<a href="lunch2.jsp">← 一覧へ戻る</a>
					
					<br>
					<div class="inner">
					<p>Copyright © <a href="http://www.comnic.co.jp/">comnic</a>-javalesson 2017</p>
					</div>

   		 </div>
    </div>

    <jsp:include page="html-footer.jsp"></jsp:include>
  </body>
</html>
