<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/ssi.jsp" %>
<%@ include file="/common/resource.jsp" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>:: PDF DOWNLOAD ::</title>
<script type="text/javascript">

</script>
<style type="text/css">
body {
  background-image: url(<%=PATH %>/images/port_back.png);
  background-size: cover;
}
</style>
</head>
<body>
<div class="container" style="text-align: center; margin: 0px auto">
	<div style="width: 100%; height: 150px; position: relative; top: 100%; background-color: #efefef">
		<div class="row" style="margin-top: 10px">
			<div class="col">		  
				Chrome으로 접속하시면 웹 화면으로 확인하실 수 있습니다 :)
			</div>
		</div>
		<div class="row" style="margin-top: 10px">
			<div class="col">		  
				<a href="<%=request.getContextPath()%>/download?dir=/intro/file&filename=portfolio.pdf">
					<img src="<%=PATH %>/images/pdffile.png"><br>portfolio.pdf			
				</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>