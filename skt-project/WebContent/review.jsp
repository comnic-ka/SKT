<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<c:if test="${!empty param.id && empty error}">
	<sql:query var="rs" dataSource="ds/lunch">
		SELECT * FROM REVIEW WHERE lunch_name LIKE "${param.id}"
	</sql:query>
</c:if>

<c:set var="review" value="${rs.rows[0]}"/>

<h1>${param.title}</h1>
		
<form action="${param.action}" method="post">
	<table class="entry-form">
		<tr>
			<th><label for="Name">Name</label></th>
			<td><input name="name" value="${param.id}" required></td>
		</tr>
		<tr>
			<th><label for="taste">Taste </label></th>
			<td><input name="taste" value="${review.taste}" required></td>
		
		</tr>
	</table>
</form>
<p class="error">${error}</p>