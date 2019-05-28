<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/ssi.jsp"%>
<%@ include file="/common/resource.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
<script type="text/javascript">
function login(){
  var frmData = $('#frm').serialize();	 
  $('#login_form').remove();
  
  $.ajax({
     url: "./login_proc",
     type: "POST",
     cache: false,
     dataType: "html",
     data: frmData,
     success: function(data){
    	 $('#login_proc').css("display", "");
    	 $('#login_proc').html(data);
     },
    
     error: function (request, status, error){        
    	 var msg = "ERROR : " + request.status + "<br>"
       msg +=  + "내용 : " + request.responseText + "<br>" + error;
       console.log(msg);              
     }
   });
}
</script>
<style>
body {
	background-image: url('<%=PATH %>/images/login.jpg');
	background-repeat: no-repeat;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	max-width: 100%;
}
</style>
</head>
<body>
	<form id='frm' name='frm' method='POST' action=''>
		<div class="container_login">
			<div class="row_login">
				<div id="login_form">
					<div class="row">
						<div class="col" style="text-align: center">
							<img src="../images/locked.png" style="margin: 20px auto">
							<br>※ 관리자 전용 페이지입니다.
						</div>
					</div>

					<div class="row">
						<div class="col">
							<input type="text" class="form-control"
								style="width: 250px; margin: 10px auto" name="uid" id="uid"
								placeholder="아이디">
						</div>
					</div>

					<div class="row">
						<div class="col">
							<input type="password" class="form-control"
								style="width: 250px; margin: 10px auto" name="upasswd"
								id="upasswd" placeholder="비밀번호">
						</div>
					</div>

					<div class="row">
						<div class="col" style="text-align: center">
							<button type="button" class="btn btn-outline-secondary"
								style="width: 250px; margin: 10px auto" onclick="login()">로그인
							</button>							
						</div>
					</div>
				</div>
				<div id="login_proc" style="display: none"></div>
			</div>

		</div>
	</form>
</body>
</html>