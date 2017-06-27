<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

     <jsp:include page="html-header.jsp">
	 <jsp:param  name="page" value="header"/>
 	 </jsp:include>
 	  
   <body>
   
   <!--
     <jsp:include page="page-header.jsp">
	 <jsp:param  name="page" value="header"/>
 	 </jsp:include>
 	   -->
  
	<div class="site-wrapper">
      <div class="site-wrapper-inner">
        <div class="cover-container">
          <div class="masthead clearfix">
            <div class="inner">
              <h1 class="masthead-brand">お昼ご飯評価システム(仮)</h1>
              <nav>
                <ul class="nav masthead-nav">
                
                  <li class="active"><a href="index.html">ホーム</a></li>
                  <li><a href="login.jsp">ログイン</a></li>
                  <li><a href="lunch.jsp">お昼ご飯情報</a></li>

                </ul>
                
			     <jsp:include page="log-header.jsp">
				 <jsp:param  name="page" value="login"/>
			 	 </jsp:include>
                  
              </nav>
            </div>
          </div>

          <div class="inner cover">
            <h2>今日のお昼ご飯</h2>
          </div>
          
        </div>

      </div>

    </div>
    
    <jsp:include page="page-footer.jsp"></jsp:include>
    
    <jsp:include page="html-footer.jsp"></jsp:include>



  </body>
</html>
