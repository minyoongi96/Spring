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
	<div class="panel panel-default">
		<div class="panel-heading">회원가입</div>
		<div class="panel-body">
			<form class="form-horizontal" action="" method="post">
				<!-- id -->
				<div class="form-group">
			    	<label class="control-label col-sm-2" for="id">ID:</label>
			    	<div class="col-sm-10">
			      		<input type="text" name="id" class="form-control" id="id" placeholder="Enter id"/>
			      		<button id="idCheck" class="btn btn-sm btn-info" type="button">중복</button>
			      		<span id="idResult"></span>
			    	</div>
			  	</div>
			  	<!-- password -->
			  	<div class="form-group">
			    	<label class="control-label col-sm-2" for="pw">Password:</label>
			    	<div class="col-sm-10">
			      		<input type="password" name="pw" class="form-control join" id="pw" placeholder="Enter password" readonly="readonly"/>
			    	</div>
			  	</div>
			  	<!-- nickname -->
			  	<div class="form-group">
			    	<label class="control-label col-sm-2" for="nick">Nickname:</label>
			    	<div class="col-sm-10">
			      		<input type="text" name="nick" class="form-control join" id="nick" placeholder="Enter nickname" readonly="readonly"/>
			    	</div>
			  	</div>
			  	<!-- phone number -->
			  	<div class="form-group">
			    	<label class="control-label col-sm-2" for="phone">Phone number:</label>
			    	<div class="col-sm-10">
			      		<input type="tel" name="phone" class="form-control join" id="phone" placeholder="Enter phone number" readonly="readonly"/>
			    	</div>
			  	</div>
			  	<!-- address -->
			  	<div class="form-group">
			    	<label class="control-label col-sm-2" for="addr">Address:</label>
			    	<div class="col-sm-10">
			      		<input type="text" name="addr" class="form-control join" id="addr" placeholder="Enter address" readonly="readonly"/>
			    	</div>
			  	</div>
			  	<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
			    		<div class="checkbox">
			        		<label><input type="checkbox"> Remember me</label>
			      		</div>
			   		</div>
				</div>
  				<div class="form-group">
    				<div class="col-sm-offset-2 col-sm-10">
      					<button type="submit" class="btn btn-default">Submit</button>
      					<button type="button" class="btn btn-warning" onclick="location.href='${cpath}/main.do'">Cancel</button>
    				</div>
  				</div>
			</form>
		</div>
	</div>
	
	<script type="text/javascript">
		// 중복체크 안하고 다른 input 클릭 시 알람 설정 
		$('.join').on('click', function(){
			if ($(this).attr('readonly') == 'readonly'){
				alert("아이디 중복 확인이 필요합니다.");
				$('#id').focus();	// id로 커서 이동
			}
			
		});
		
		// 중복확인 기능
		$('#idCheck').on('click', function(){
			var id = $('#id').val();
			
			$.ajax({
				url: "${cpath}/idCheck.do",
				data: {id : id},
				type: "POST",
				dataType: "json",
				success: idCheck,
				error: function(e){
					alert("Error");
					console.log(e);
				}
			});
		})
		
		function idCheck(data){
			if(data.id == "null"){
				$('#idResult').text("사용 가능한 아이디입니다.");
				$('#idResult').css('color', 'blue');
				$('.join').removeAttr('readonly');
				
			} else {
				$('#idResult').text("사용 불가능한 아이디입니다.");
				$('#idResult').css('color', 'red');
			}
		}
	</script>
</body>
</html>