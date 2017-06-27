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
            
          <input type= "search" size="30" placeholder="キーワードを検索してね">
          <a href="search-result2.jsp"><input type= "submit" value = "検索"></a>
          
          </div>
        
<!--           <table>
          	<tr>名前</tr>
          	<tr>場所</tr>
          	<c:forEach var="Lunch" items="${Lunch}">
				<tr>
					<td>${Lunch.lunch_name}</td>
					<td>${Lunch.location}</td>
				</tr>
				</c:forEach>
          </table>
-->
<br>
          <div align="center">
            <table>
          	<tr>
          	<th>名前</th>
          	<th>場所</th>
          	</tr>
 
				<tr>
					<td>吉野家</td>
					<td>右</td>
				</tr>
				<tr>
					<td>吉野家</td>
					<td>右</td>
				</tr>
				<tr>
					<td>吉野家</td>
					<td>右</td>
				</tr>
				<tr>
					<td>吉野家</td>
					<td>右</td>
				</tr>
				<tr>
					<td>吉野家</td>
					<td>右</td>
				</tr>
				
			</table>
			 </div>
        </div>

      </div>

    </div>

    <jsp:include page="page-footer.jsp"></jsp:include>
    
    <jsp:include page="html-footer.jsp"></jsp:include>
  </body>
</html>
