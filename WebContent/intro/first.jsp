<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/resource.jsp" %>
<%@ include file="/common/ssi.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<%
visitProc.getIp(request);
%>
<script type="text/javascript">

</script>
</head>
<body>
<div class="section_top">
<nav class="navbar navbar-light" style="float: right">
  <!-- <span style="float: left">※본 사이트는 PC와 크롬(Chrome) 웹브라우저에 최적화되어있습니다.</span> -->
    <div class="cnt_panel">
     TOTAL : <%=visitProc.total_visit() %><br>
     TODAY : <%=visitProc.today_visit() %>
    </div>
</nav>
</div>
<div class="container_1">  
	<div class="row">
		<div class="col">  		
  		<span class="font_first1">PORT</span><span class="font_first2">FOLIO</span>
  	</div>
  </div>
 
  <div class="row">
  	<div class="col">
  		<span style="font-size: 20px; font-weight: bold">:: LEE, SEUNGHYUN ::</span>
  	</div>
  </div>
  
  <div style="position: relative; top: 40%">  
	※ 본 사이트는 PC와 크롬(Chrome) 웹브라우저에 최적화되어있습니다.
	</div>    
</div>
</body>
</html>