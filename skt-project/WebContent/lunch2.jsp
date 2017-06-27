<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html lang="en">
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
                  <li class="active"><a href="lunch2.jsp">お昼ご飯情報</a></li>
                  <li><a href="edit.jsp">情報編集</a></li>
                  
                </ul>
                
			     <jsp:include page="log-header.jsp">
				 <jsp:param  name="page" value="login"/>
			 	 </jsp:include>
              </nav>
            </div>
          </div>
             
         <input type= "search" size="30" placeholder="キーワードを検索してね">
         <a href="search-result2.jsp"><input type= "submit" value = "検索"></a> 
         
        <jsp:include page="list_table.jsp">
		    <jsp:param name="sql" value="SELECT * FROM LUNCH  WHERE lunch_name LIKE ?"/>
			<jsp:param name="table" value="Lunch"/>
		</jsp:include>
		
		<p class="error">${error}</p>

        </div>

      </div>

    </div>

    <jsp:include page="page-footer.jsp"></jsp:include>
    
    <jsp:include page="html-footer.jsp"></jsp:include>
  </body>
</html>
