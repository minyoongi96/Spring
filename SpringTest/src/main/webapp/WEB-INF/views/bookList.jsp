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
	
</head>
<body>
	<h2>보유 도서 현황</h2>
	<div id="list">
		<table class='table table-bordered table-hover'>
			<tr class='info'><td>번호</td><td>제목</td><td>작가</td><td>출판사</td><td>ISBN</td><td>보유도서수</td></tr>
			<c:forEach var="vo" items="${requestScope.list}">
	  			<tr>
		  			<td>${vo.num}</td>
		  			<td>${vo.title}</td>
		  			<td>${vo.author}</td>
		  			<td>${vo.company}</td>
		  			<td>${vo.isbn}</td>
		  			<td>${vo.count}</td>
	  			</tr>
	  		</c:forEach>
		</table>
	</div>
	
	<div id="register">
		<h2>도서 입력</h2>
			<form action="${cpath}/bookInsert.do" method="post">
	    		<table class="table table-bordered table-hover">
	    			<tr>
	    				<td>제목</td>
	    				<td><input type="text" name="title" class="form-control"/></td>
	    			</tr>
	    			<tr>
	    				<td>작가</td>
	    				<td><input type="text" name="author" class="form-control"/></td>
	    			</tr>
	    			<tr>
	    				<td>출판사</td>
	    				<td><input type="text" name="company" class="form-control"/></td>
	    			</tr>
	    			<tr>
	    				<td>ISBN</td>
	    				<td><input type="text" name="isbn" class="form-control"/></td>
	    			</tr>
	    			<tr>
	    				<td>보유도서 수</td>
	    				<td><input type="text" name="count" class="form-control"/></td>
	    			</tr>
	    			
	    			
	    			<tr>
	    			<td colspan="2" align="right">
	    				<button type="submit" class="btn btn-primary btn-sm">등록</button>
	    			</td>
	    			</tr>
	    		</table>
	    	</form>
	</div>
	
</body>
</html>