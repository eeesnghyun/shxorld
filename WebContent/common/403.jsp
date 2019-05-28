<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/ssi.jsp" %>
<%@ include file="/common/resource.jsp" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">
body{
  background-image: url(<%=PATH%>/images/403.jpg);
  background-size: cover;
}
</style>
</head>
<body>
<div class="container">
	<div class="content" style="margin-top: 25%">
		<div class="row align-items-center">
			<div class="col_c">
				<img class="img_128" src="<%=PATH %>/images/403.png">
			</div>		
		</div>
		<div class="row">
			<div class="div_panel3">
				ERROR : 잘못된 경로입니다.<br>
				<div style="position: relative; z-index: 999">
				<button type="button" class="btn btn-danger" onclick="location.href='<%=PATH%>/intro/main'">돌아가기</button>
				</div>
			</div>		
		</div>        
	</div>
</div>
</body>
</html>