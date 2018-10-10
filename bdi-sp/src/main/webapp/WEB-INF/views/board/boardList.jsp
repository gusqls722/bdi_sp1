<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>스프링테스트</title>
</head>
<script>
window.addEventListener('load',function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/board');
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4){
			if(xhr.status==200){
				var res = JSON.parse(xhr.responseText);
				var html = '';
				for(var bi of res){
					html += '<tr>';
					html += '<td>'+ bi.binum +'</td>';
					html += '<td><input type="text" name="bititle'+ bi.binum +'" value="'+bi.bititle+'"></td>';
					html += '<td><input type="text" name="bitext'+ bi.binum +'" value="'+ bi.bitext +'"></td>';
					html += '<td><input type="text" name="bifile'+ bi.binum +'" value="'+ bi.bifile +'"></td>';
					html += '<td><input type="text" name="bicredat'+ bi.binum +'" value="'+ bi.bicredat +'"></td>';
					html += '<td><input type="text" name="bimoddat'+ bi.binum +'" value="'+ bi.bimoddat +'"></td>';
					html += '<td><input type="text" name="bicnt'+ bi.binum +'" value="'+ bi.bicnt +'"></td>';
					html += '<td><input type="text" name="biactive'+ bi.binum +'" value="'+ bi.biactive +'"></td>';
					html += '<td><input type="text" name="uinum' +bi.binum+'" value="'+ bi.uinum +'"></td>';
					html += '<td><button onclick="boardUpdate('+bi.binum+')">수정</button>';
					html += '<button onclick="boardDelete('+bi.binum+')">삭제</button></td>';
					html += '</tr>';
				}
				
				document.querySelector('#biBody').insertAdjacentHTML('beforeend',html);
			}else{
				
			}
		}
	}
	xhr.send();
})
</script>
<body>
	<div>
		<form action="/boards" method="get">
			제목 : <input type="text" name="bititle2">
			<button>검색</button>
		</form>
	</div>
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>파일</th>
				<th>credat</th>
				<th>moddat</th>
				<th>조회수</th>
				<th>활동</th>
				<th>작성자</th>
			</tr>
		</thead>
		<tbody id='biBody'>
		</tbody>
	</table>
	<button onclick="boardAdd()">데이터 추가</button>
	<script>

	function boardDelete(binum){
		var xhr = new XMLHttpRequest();
		var url = "/board/"+binum;
		xhr.open('DELETE',url);
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4){
				if(xhr.status==200){
					if(xhr.responseText=='1'){
						alert('삭제성공!')
						location.href='/uri/board/boardList';
					}
				}else{
					alert('삭제 실패');
				}
			}
		}
		xhr.send();
	}
	
	function boardUpdate(binum){
		var bititle = document.querySelector('input[name=bititle' + binum + ']').value;
		var bitext = document.querySelector('input[name=bitext' + binum + ']').value;
		var bifile = document.querySelector('input[name=bifile' + binum + ']').value;
		var bicredat = document.querySelector('input[name=bicredat' + binum + ']').value;
		var param = {binum:binum,bititle:bititle,bitext:bitext,bifile:bifile};
		var xhr = new XMLHttpRequest(); 
		var url = "/board";
		xhr.open('PUT',url);
		xhr.setRequestHeader('Content-Type','application/json')
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4){
				if(xhr.status==200){
					if(xhr.responseText=='1'){
						alert('수정성공!')
						location.href='/uri/board/boardList';
					}
				}else{
					alert('수정실패');
				}
			}
		}
		xhr.send(JSON.stringify(param));
	}
	
	function boardAdd(){
		var html = '<tr>';
			html += '<td>&nbsp</td>';
			html += '<td><input type="text" name="bititle"></td>';
			html += '<td><input type="text" name="bitext"></td>';
			html += '<td><input type="text" name="bifile"></td>';
			html += '<td><input type="text" name="bicredat"></td>';
			html += '<td><input type="text" name="bimoddat"></td>';
			html += '<td><input type="text" name="bicnt"></td>';
			html += '<td><input type="text" name="biactive"></td>';
			html += '<td><input type="text" name="uinum"></td>';
			html += '<td><button onclick="boardInsert()">저장</button></td>';
			html += '</tr>';
			document.querySelector('tbody').insertAdjacentHTML('beforeend',html);
	}
	
	function boardInsert(){
		var bititle = document.querySelector('input[name=bititle]').value;
		var bitext = document.querySelector('input[name=bitext]').value;
		var bifile = document.querySelector('input[name=bifile]').value;
		var bicredat = document.querySelector('input[name=bicredat]').value;
		var bimoddat = document.querySelector('input[name=bimoddat]').value;
		var bicnt = document.querySelector('input[name=bicnt]').value;
		var biactive = document.querySelector('input[name=biactive]').value;
		var uinum = document.querySelector('input[name=uinum]').value
		var param = {bititle:bititle,bitext:bitext,bifile:bifile,bicredat:bicredat,bimoddat:bimoddat,bicnt:bicnt,biactive:biactive,uinum:uinum};
		var xhr = new XMLHttpRequest(); 
		var url = "/board";
		xhr.open('POST',url);
		xhr.setRequestHeader('Content-Type','application/json')
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4){
				if(xhr.status==200){
					if(xhr.responseText=='1'){
						alert('추가성공!')
						location.href='/uri/board/boardList';
					}
				}else{
					alert('추가실패');
				}
			}
		}
		alert(JSON.stringify(param));
		xhr.send(JSON.stringify(param));
	}
</script>
</body>
</html>