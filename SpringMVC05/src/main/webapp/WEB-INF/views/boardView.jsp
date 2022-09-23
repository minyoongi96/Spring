<%@page import="com.gjai.entity.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<% pageContext.setAttribute("newLineChar", "\n"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Board View</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script>
		function goList(){
			location.href = "${cpath}/boardList.do?page=${pageMaker.cri.page}";
		}
		function goDelete(idx){
			location.href = "${cpath}/boardDelete.do/" + idx;
		}
		function goUpdate(idx){
			location.href = "${cpath}/boardUpdate.do/" + idx;
		}
		function goReply(idx){
			location.href = "${cpath}/boardReply.do/" + idx;
		}
	</script>
</head>
<body>
	<div class="container">
	  <h2><a href="${cpath }/boardList.do" style="text-decoration: none; color: black;">게시판</a></h2>
	  <div class="panel panel-info">
	    <div class="panel-heading">게시물 상세보기</div>
	    <div class="panel-body">
	    	<table class="table table-striped table-hover">
	    		<tr>
	    			<td>제목</td>
	    			<td>${vo.title }</td>
	    		</tr>
	    		<tr>
	    			<td>작성자</td>
	    			<td>${vo.writer }</td>
	    		</tr>
	    		<tr>
	    			<td>내용</td>
	    			<td><textarea style="resize: none;" rows="15" readonly="readonly" class="form-control">${vo.contents }</textarea></td>
	    		</tr>
	    		<tr>
	    			<td>작성일</td>
	    			<td>${fn:split(vo.indate, " ")[0]}</td>
	    		</tr>
	    		<tr>
	    		<td colspan="2" align="right">
		    		<c:if test="${!empty mvo}">
		    			<button class="btn btn-sm btn-info" onclick="goReply(${vo.idx})">답글 작성</button>
		    		</c:if>
		    		<c:if test="${mvo.memId eq vo.memId}">	    		
		    			<button class="btn btn-sm btn-primary" onclick="goUpdate(${vo.idx})">수정</button>
		    			<button class="btn btn-sm btn-warning" onclick="goDelete(${vo.idx})">삭제</button>
		    			
		    		</c:if>
		    		<button class="btn btn-sm btn-info" onclick="goList()">이전</button>
	    		</td>
	    		</tr>
	    	</table>
	    </div>
	    <div class="panel-footer">Spring 특화과정 A</div>
	  </div>
	</div>
</body>
</html>