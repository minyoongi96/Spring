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
			// 페이지 번호를 클릭했을 때 감지
			// 페이지 번호 a태그들을 가져와 클릭하면 함수에 해당 a태그를 e 매개변수로 받음
			$('.pagination a').click(function(e){
				e.preventDefault();
				var page = $(this).attr("href");
				document.frm.page.value = page;	// name이 frm인 요소의 page의 value에 접근
				document.frm.submit();	// form 태그를 전송
			})
		});
	</script>
</head>
<body>
<div class="container">
	<h2><a href="${cpath }/boardList.do" style="text-decoration: none; color: black;">게시판</a></h2>
	<div class="panel panel-default">
 		<div class="panel-heading">
 			<c:if test="${empty mvo}">
		    	<form class="form-inline" action="${cpath}/login.do" method="post">
				  <div class="form-group">
				    <label for="memId">ID:</label>
				    <input type="text" class="form-control" name="memId">
				  </div>
				  <div class="form-group">
				    <label for="memPwd">Password:</label>
				    <input type="password" class="form-control" name="memPwd">
				  </div>
				  <button type="submit" class="btn btn-default">Login</button>
				</form>
			</c:if>
			<c:if test="${!empty mvo}">
				<form class="form-inline" action="${cpath}/logout.do">
				  <div class="form-group">
				    <label>${mvo.memName}님 방문을 환영합니다.</label>
				  </div>
				  <button type="submit" class="btn btn-default">Logout</button>
				</form>
			</c:if>
 		</div>
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
	  					<td>
	  						<c:if test="${vo.boardLevel > 0}">
	  						<c:forEach begin="0" end="${vo.boardLevel}">
	  							<span style="padding-left: 1em";</span>
	  						</c:forEach>
	  						</c:if>
	  						<c:if test="${vo.boardLevel > 0}">
	  							<c:if test="${vo.boardAvailable == 1}">
		  							<a href="${cpath}/boardView.do?idx=${vo.idx}"><span class="bi bi-reply" style="color: red;"></span>${vo.title}</a>	  								
	  							</c:if>
	  							<c:if test="${vo.boardAvailable == 0}">
		  							삭제된 게시물입니다.	  								
	  							</c:if>
	  						</c:if>
	  						<c:if test="${vo.boardLevel == 0}">
	  							<c:if test="${vo.boardAvailable == 1}">
		  							<a href="${cpath}/boardView.do?idx=${vo.idx}">${vo.title}</a>	  								
	  							</c:if>
	  							<c:if test="${vo.boardAvailable == 0}">
		  							삭제된 게시물입니다.	  								
	  							</c:if>
	  						</c:if>
	  					</td>
	  					<td>${vo.count}</td>
	  					<td>${vo.writer}</td>
	  					<td>${fn:split(vo.indate, " ")[0]}</td>
  					</tr>
  				</c:forEach>
  				<c:if test="${!empty mvo}">  					
	  				<tr>
	  					<td colspan="5" align="right"><button class="btn btn-sm btn-primary" onclick="location.href='${cpath}/boardWrite.do'">글쓰기</button></td>
	  				</tr>
  				</c:if>
  			</table>
  			<form action="${cpath}/boardList.do" method="post">
	  			<table class="table">
					<tr>
					  <td style="text-align: center;">
					     <select name="type" class="form-control">
					       <option value="writer" ${pageMaker.cri.type == 'writer' ? 'selected' : ''}>작성자</option>
					       <option value="title" ${pageMaker.cri.type == 'title' ? 'selected' : ''}>제목</option>
					       <option value="contents" ${pageMaker.cri.type == 'contents' ? 'selected' : ''}>내용</option>
					     </select>
					  </td>
					  <td>
					     <input type="text" name="keyword" class="form-control" value="${pageMaker.cri.keyword}"/>
					  </td>
					  <td>
					     <button class="btn btn-sm btn-success" type="submit">검색</button>
					  </td>
					</tr>			
		    	</table>
	    	</form>
  			<!-- 페이징 처리 -->
  			<form name="frm" action="${cpath}/boardList.do" method="post">
	  			<div style="text-align: center;">
	  				<ul class="btn-group pagination">
	  					<!-- 이전 페이지 버튼 -->
	  					<c:if test="${pageMaker.prev}">
	  						<li><i class="fa"><a href="${pageMaker.startPage - 1}">◀</a></i></li>
	  					</c:if>
						<c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<c:if test="${pageMaker.cri.page == pageNum}">	<!-- 현재 페이지와 같은 페이지번호 일때 -->
								<li><i class="fa" style="color: black;">${pageNum}</i></li>
							</c:if>
							<c:if test="${pageMaker.cri.page != pageNum}">	<!-- 현재 페이지와 다른 페이지번호 일때 -->
								<li><i class="fa"><a href="${pageNum}">${pageNum}</a></i></li>
							</c:if>
						</c:forEach>
						<!-- 다음 페이지 버튼 -->
						<c:if test="${pageMaker.next}">
	  						<li><i class="fa"><a href="${pageMaker.endPage + 1}">▶</a></i></li>
	  					</c:if>
					</ul>
	  			</div>
	  			<input type="hidden" name="page" value="${pageMaker.cri.page}">
	  			<input type="hidden" name="type" value="${pageMaker.cri.type}">
	  			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
  			</form>
  		</div>
  		<div class="panel-footer">Spring 특화과정 A</div>
  	</div>
</div>
</body>
</html>
