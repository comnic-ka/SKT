<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:query var="table" dataSource="ds/lunch">
    ${param.sql}
	<sql:param value="%${param.name}%" />
</sql:query>

	<div class="inner cover">
            <p class="lead">
              <a href="new.jsp" class="btn btn-lg btn-default">新規登録</a>
            </p>
            </div>
            <br>

	<div class="list-table" align="center">
		<table>
			<tr>
			<!--  
				<c:forEach var="columnName" items="${table.columnNames}">
					<th>${columnName}</th>
				</c:forEach>
				-->
				<th>店名</th>
				<th>場所</th>
				</tr>	
			<c:forEach var="record" items="${table.rowsByIndex}">
				<tr>
					<c:forEach var="data" items="${record}" varStatus="loop">
						<c:if test="${loop.count == 1}">
							<c:set var="id" value="${data}" />
						</c:if>
						<td><a href="review.do?id=${id}">${data}</a></td>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
</div>