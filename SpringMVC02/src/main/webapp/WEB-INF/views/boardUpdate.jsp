<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>  

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Main Board</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	  <h2><a href="${cpath }/boardList.do" style="text-decoration: none; color: black;">게시판</a></h2>
	  <div class="panel panel-info">
	    <div class="panel-heading">게시물 수정</div>
	    <div class="panel-body">
	    	<form action="${cpath}/boardUpdate.do" method="post">
	    		<input type="hidden" name="idx" value="${vo.idx }"/>
		    	<table class="table table-striped table-hover">
		    		<tr>
		    			<td>제목</td>
		    			<td><input type="text" name="title" class="form-control" value="${vo.title }"/></td>
		    		</tr>
		    		<tr>
		    			<td>작성자</td>
		    			<td>${vo.writer }</td>
		    		</tr>
		    		<tr>
		    			<td>내용</td>
		    			<td><textarea name="contents" rows="15" class="form-control" style="resize: none;">${vo.contents }</textarea></td>
		    		</tr>
		    		<tr>
		    			<td colspan="2" align="right">
		    				<button type="submit" class="btn btn-success btn-primary btn-sm" onclick="location.href='${cpath}/boardUpdate.do'">수정</button>
		    				<button type="button" class="btn btn-warning btn-sm" onclick="location.href='${cpath}/boardView.do?idx=${vo.idx}'">취소</button>
		    			</td>
		    			
		    		</tr>
		    	</table>
	    	</form>
	    </div>
	    <div class="panel-footer">Spring 특화과정 A</div>
	  </div>
	</div>
</body>
</html>