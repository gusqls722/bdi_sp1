<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>스프링테스트</title>
</head>
<body>
<div>
	<form action="/boards" method="get">
		제목 : <input type="text" name="bititle">
		<button>검색</button>
	</form>
</div>
<table border="1">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>등록일자</th>
			<th>수정일자</th>
			<th>조회수</th>
			<th>게시자</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list }" var="bi">
			<tr>
				<td>${bi.binum}</td>
				<td>${bi.bititle}</td>
				<td>${bi.bicredat}</td>
				<td>${bi.bimoddat}</td>
				<td>${bi.bicnt}</td>
				<td>${bi.uinum}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>