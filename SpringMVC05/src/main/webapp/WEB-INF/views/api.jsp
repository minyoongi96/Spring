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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<title>Home</title>
	<script type="text/javascript">
		$(document).ready(function(){
			$('.btn.btn-info').on('click', function(){
				$.ajax({
					url : "${cpath}/bible.do",
					type : "get",
					dataType : "html",	// xml, json, html (default: text)
					success : parseHtml,
					error : function(){
						alert("Error");
					}
				})
			})
		});
		
		function parseHtml(data){
			alert(data);
			$('#api').text = data;
		}
	</script>
</head>
<body>
	<button class="btn btn-info">데이터 요청</button>
	<div id="api">
	
	</div>
</body>
</html>
