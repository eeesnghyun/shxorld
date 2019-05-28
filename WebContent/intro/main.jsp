<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="web.project_br.*" %>
<%@ include file="/common/resource.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>포트폴리오 :: 이승현</title>
<!-- fullpage.js -->
<link rel="stylesheet" type="text/css" href="<%=PATH %>/css/fullpage.css" />

<script type="text/javascript">
window.onload = function(){
	//alert("브라우저는 ? " +navigator.userAgent);
	var browse = navigator.userAgent.toLowerCase(); 
		
	if( (navigator.appName == 'Netscape' && browse.indexOf('trident') != -1) || (browse.indexOf("msie") != -1)) {
	     alert("본 사이트는 Chrome에 최적화되어있습니다.\nPDF 파일로 다운받아보실 수 있도록 이동합니다.");	    
	     window.location.href = "<%=PATH %>/intro/portfolio";
	}	
};
</script>
</head>
<body>
<div class="container_m">
	<div id="fullpage">
		<!-- 첫번째 페이지 -->
		<div class="section " id="section0">				
			<jsp:include page="/intro/first.jsp" flush='false' />
		</div>
		
		<!-- 두번째 페이지 -->
		<div class="section" id="section1">
			<jsp:include page="/intro/profile.jsp" flush='false' />
		</div>
		
		<!-- 세번째 페이지 -->
		<div class="section" id="section2">		
			<div class="banner">
				<img src="<%=PATH %>/images/project.png" style="width: 24px; height: 24px; margin-bottom: 5px"> PROJECT
				<hr style="width: 400px">
			</div>		
			<%
			ProjectBrProc projectbrProc = new ProjectBrProc();
			int count = projectbrProc.count();
			
			for(int i=1; i<=count; i++){
			%>
			<div class="slide" id="slide<%=i %>">
				<jsp:include page="/intro/project.jsp" flush='false'>
					<jsp:param name="pb_no" value="<%=i %>" />
					<jsp:param name="total_pb" value="<%=count %>" />		
				</jsp:include>
			</div>
			<%
			}
			%>								
			<div class="fp-slidesNav fp-bottom"></div>
		</div>
		
		<!-- 네번째 페이지 -->
		<div class="section" id="section3">
			<jsp:include page="/intro/contact.jsp" flush='false' /> 				
	  </div>
	</div>
</div>	

	
<script type="text/javascript" src="<%=PATH %>/js/fullpage.js"></script>
<script type="text/javascript">
var myFullpage = new fullpage('#fullpage', {
		anchors: ['intro', 'profile', 'project', 'contact'],
    licensekey: 'OPEN-SOURCE-GPLV3-LICENSE',
    autoScrolling: true,
		verticalCentered: false,
		
		navigation: true,
    navigationPosition: 'right',
    navigationTooltips: ['MAIN', 'PROFILE', 'PROJECT', 'CONTACT'],
    //to avoid problems with css3 transforms and fixed elements in Chrome, as detailed here: https://github.com/alvarotrigo/fullPage.js/issues/208
    css3:false
});
</script>

</body>
</html>