<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>스프링테스트</title>
</head>
<body>
<table border="1">
	<thead>
		<tr>
			<th>번호</th> 
			<th>이름</th>
			<th>설명</th>
			<th>수정/삭제</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty jList }">
		 <tr> <td colspan="4">japan 리스트 없다.</td> </tr>
		</c:if>	
		<c:forEach items="${jList}" var="j">
			<tr>
				<td>${j.jpnum}</td>
				<td><input type="text" name="jpname${j.jpnum}" value="${j.jpname}"></td>
				<td><input type="text" name="jpdesc${j.jpnum}" value="${j.jpdesc}"></td>
				<td>
					<button onclick="japanUpdate(${j.jpnum})">수정</button>
					<button onclick="japanDelete(${j.jpnum})">삭제</button>
				</td>
			</tr>
	</c:forEach>
	</tbody>
</table>
	<button onclick="japanAdd()">JAPAN추가</button>
<script>
	function japanUpdate(jpnum){
		var jpname = document.querySelector('input[name=jpname' + jpnum + ']').value;
		var jpdesc = document.querySelector('input[name=jpdesc' + jpnum + ']').value;
		//alert("수정: " +jpnum +jpname + jpdesc);
		var param = {jpnum:jpnum,jpname:jpname,jpdesc:jpdesc};
		var xhr = new XMLHttpRequest(); 
		var url = "/japan";
		xhr.open('PUT',url);
		xhr.setRequestHeader('Content-Type','application/json')
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4){
				if(xhr.status==200){
					if(xhr.responseText=='1'){
						alert('수정성공!')
						location.href='/japan';
					}
				}else{
					alert('수정실패');
				}
			}
		}
		alert(JSON.stringify(param));
		xhr.send(JSON.stringify(param));
	}
	
	
	
	function japanDelete(jpnum){
		var xhr = new XMLHttpRequest();
		var url = "/japan/" + jpnum;
		xhr.open('DELETE',url);
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4){
				if(xhr.status==200){
					if(xhr.responseText=='1'){
						alert('삭제성공!')
						location.href='/japan';
					}
				}else{
					alert('삭제실패');
				}
			}
		}
		xhr.send();
	}
	
	function japanAdd(){
		var html = '<tr>';
			html += '<td>&nbsp</td>';
			html += '<td><input type="text" name="jpname"></td>';
			html += '<td><input type="text" name="jpdesc"></td>';
			html += '<td><button onclick="japanInsert()">저장</button></td>';
			html += '</tr>';
			document.querySelector('tbody').insertAdjacentHTML('beforeend',html);
	}
</script>
</body>
</html>