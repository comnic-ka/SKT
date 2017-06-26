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
                
                  <li class="active"><a href="index2.jsp">ホーム</a></li>
                  <li><a href="lunch2.jsp">お昼ご飯情報</a></li>
                  <li><a href="edit.jsp">情報編集</a></li>

                </ul>
                  <p>Login user: ${loginUsername}
                  <a href="${ctxPath}/logout.do"> － Logout</a>
                  </p>
              </nav>
            </div>
          </div>

          <div class="inner cover">
            <h2 class="cover-heading">そうだ、お昼ご飯を探そう！</h2>
            <p class="lead">今日のお昼ご飯に迷っているあなた。</p>
            <p class="lead">お気に入りのお昼ご飯が見つかるかも。</p>
            <p class="lead">関戸キャップの渾身のシステム！！！</p>
            <p class="lead"><br>
              <a href="today-lunch2.jsp" class="btn btn-lg btn-default">今日のお昼ご飯</a>
            </p>
          </div>
          
        </div>

      </div>

    </div>
    
    <jsp:include page="page-footer.jsp"></jsp:include>
    
    <jsp:include page="html-footer.jsp"></jsp:include>



  </body>
</html>
