<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Spring06</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<button class="btn btn-success">로그인</button>
	<a href="${cpath}/join.do"><button class="btn btn-info">회원가입</button></a>
	<button id="list" class="btn btn-warning">회원목록</button>
	
	<div id="info">
		
	</div>
	
	<script type="text/javascript">
		let onoff = 0;	// 멤버 정보 on/off 트리거
		
		$('#list').on('click', function(){
			$.ajax({
				url : "${cpath}/memberList.do",
				type : "post",
				dataType : "json",
				success : memberList,
				error : function(e){
					console.log(e);
					alert('통신 실패');
				}
			});
		});
		
		// 비동기 통신으로 멤버정보들을 가져와서 div에 값 넣어주기
		// 다시 클릭하면 div값 비워주기
		function memberList(data){

			if(onoff == 0){
				var result = "<table class='table table-bordered table-hover'>";
				result += "<tr class='info'><td>번호</td><td>ID</td><td>PW</td><td>닉네임</td><td>전화번호</td><td>주소</td></tr>";
				
				data.forEach((item, idx)=>{
					result += "<tr>";
					result += "<td>" + (idx + 1) + "</td>";
					result += "<td>" + item.id + "</td>";
					result += "<td>" + item.pw + "</td>";
					result += "<td>" + item.nick + "</td>";
					result += "<td>" + item.phone + "</td>";
					result += "<td>" + item.addr + "</td>";
					result += "</tr>";
				});
				
				result += "</table>";
				$('#info').html(result);
				
				onoff = 1;	// 트리거 on
				
			} else{
				$('#info').empty();
				onoff = 0;	// 트리거 off
			}
		}
	</script>
</body>
</html>