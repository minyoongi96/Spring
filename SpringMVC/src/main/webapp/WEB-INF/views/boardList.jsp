<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<title>Home</title>
</head>
<body>
<div class="container">
	<h2><a href="${cpath }/boardList.do" style="text-decoration: none; color: black;">게시판</a></h2>
	<div class="panel panel-default">
 		<div class="panel-heading">게시판 목록</div>
  		<div class="panel-body">
  			<table class="table table-bordered table-hover">
  				<tr class="info">
  					<td>번호</td>
  					<td>제목</td>
  					<td>조회수</td>
  					<td>작성자</td>
  					<td>작성일</td>
  				</tr>
  				<c:forEach var="vo" items="${requestScope.list}" varStatus="status">
  					<tr>
	  					<td>${vo.idx}</td>
	  					<td><a href="${cpath}/boardView.do?idx=${vo.idx}">${vo.title}</a></td>
	  					<td>${vo.count}</td>
	  					<td>${vo.writer}</td>
	  					<td>${fn:split(vo.indate, " ")[0]}</td>
  					</tr>
  				</c:forEach>
  				<tr>
  					<td colspan="5" align="right"><button class="btn btn-sm btn-primary" onclick="location.href='${cpath}/boardForm.do'">글쓰기</button></td>
  				</tr>
  			</table>
  		</div>
  		<div class="panel-footer">Spring 특화과정 A</div>
  	</div>
</div>
</body>
</html>
