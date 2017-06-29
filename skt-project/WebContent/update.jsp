<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>

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
                  <li><a href="lunch2.jsp">お昼ご飯情報</a></li>
                  <li class="active"><a href="edit.jsp">情報編集</a></li>
                </ul>
                
			     <jsp:include page="log-header.jsp">
				 <jsp:param  name="page" value="login"/>
			 	 </jsp:include>
              </nav>
             
<!-- ------------------------------------------------------------------------- -->
		<c:if test="${!empty param.id && empty error}">
			<sql:query var="rs" dataSource="ds/lunch">
				SELECT * FROM REVIEW WHERE lunch_name LIKE "${param.id}"
			</sql:query>
		</c:if>
		
		<c:set var="review" value="${rs.rows[0]}"/>
		
		<div align="center">
			<div class="form-border1">
				<h3>更新</h3>
				<form action="${param.action}" method="post">
					<table>
						<tr>
							<th><label for="name">Lunch Name </label></th>
							<td><input name="name" value="${review.lunch_name}" required></td>
						</tr>
						
						<tr>
							<th><label for="name">Taste </label></th>
							<td><input name="name" value="${review.taste}" required></td>
						</tr>
						<tr>
							<th><label for="name">Price </label></th>
							<td><input name="name" value="${review.price}" required></td>
						</tr>
						<tr>
							<th><label for="name">Volume </label></th>
							<td><input name="name" value="${review.volume}" required></td>
						</tr>
						<tr>
							<th><label for="name">Distances </label></th>
							<td><input name="name" value="${review.distances}" required></td>
						</tr>
						<tr>
							<th><label for="name">Variety </label></th>
							<td><input name="name" value="${review.variety}" required></td>
						</tr>
						<tr>
							<th><label for="name">Review </label></th>
							<td><input name="name" value="${review.review}" required></td>
						</tr>
				</table>
				<br>
				<input type="reset" value="Reset">
				<input type="submit" value="Entry">
			</form>
			<br>
					<p class="error">${error}</p>
		</div>
	</div>

<!-- ------------------------------------------------------------------------- -->
              
              <br>
              <a href="edit.jsp">←　編集ページへ戻る</a>
              
            </div>	
		</div>		
			<div class="inner">
			<p>Copyright © <a href="http://www.comnic.co.jp/">comnic</a>-javalesson 2017</p>
			</div>
		</div>
	</div>
		 <jsp:include page="html-footer.jsp"></jsp:include>
  </body>
</html>