<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/ssi.jsp"%>
<%@ include file="/common/resource.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<%
String uid = request.getParameter("uid");
String upasswd = request.getParameter("upasswd");
%>
<title>LOGIN</title>
<script type="text/javascript">

</script>
</head>
<body>
	<div class="row">
		<div class="col" style="text-align: center">
		<%
		  int count = adminProc.login(uid, upasswd);
		  String utype = adminProc.read(uid).getU_type();
	  	
		  if(count == 1 && utype.equals( "S")) {			  		
	  		session.setAttribute("uid", uid);
		  	session.setAttribute("upasswd", upasswd);
	  		session.setAttribute("utype", utype);			  		
		  %>
			<img src="<%=PATH %>/images/unlocked.png" style="margin: 20px auto">
		 <%
		  } else {	     
	     %>
	       <img src="<%=PATH %>/images/warning.png" style="margin: 20px auto">
	     <%
		  }
		 %>
		</div>
	</div>

	<div class="row">
		<div class="col">
			<div class="row">
				<div class="col" style="text-align: center">
					<%
					if(count == 1 && utype.equals( "S")) {			  	
		  		    %>		 	
					<button type="button" class="btn btn-outline-secondary"
						style="width: 300px; height: 130px; margin: 15px auto; font-weight: bold"
						onclick="location.href='<%=PATH%>/guest/board'">
						관리자	모드로 시작합니다.
					</button>
					<%
					} else if(count == 1 ) {
					%>
					<button type="button" class="btn btn-outline-danger"
						style="width: 300px; height: 130px; margin: 15px auto; font-weight: bold"
						onclick="location.href='<%=PATH%>/guest/board'">
						권한이 없습니다.
					</button>
					<%
					} else {
					%>
					<button type="button" class="btn btn-outline-danger"
						style="width: 300px; height: 130px; margin: 15px auto; font-weight: bold"
						onclick="location.href='<%=PATH%>/guest/board'">
						아이디와 패스워드가 일치하지 않습니다.<br> 확인후 다시 로그인해주세요.
					</button>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>