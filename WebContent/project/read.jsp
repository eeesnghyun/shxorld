<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/ssi.jsp" %>
<%@ include file="/common/resource.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>::프로젝트::</title>
<%
int p_no = Integer.parseInt(request.getParameter("p_no"));

ProjectVO projectVO = new ProjectVO(); 
projectVO = projectProc.read(p_no, request);
%>
<script type="text/javascript">

</script>

</head>
<body>
<jsp:include page="/common/top.jsp" flush='false' />
<div class="container">
	<div class="content">
	
		<div class="row justify-content-md-center">
	    <div class="col-sm-12" style="text-align: center">
	    	<h1 class="display-4" style="font-weight: bold"><%=projectVO.getP_title() %></h1>
	    </div>
	    <div class="col-sm-12" style="text-align: center">
	    	<% if(projectVO.getP_type().equals("S")) {%>학부프로젝트<%
      		 } else if(projectVO.getP_type().equals("T")) {%>토이프로젝트<%			      			
      		 } else { %>사내프로젝트<% } %>
	    </div>
	    <div class="row">		    
		    <%=projectVO.getP_user() %><span class="bar_basic">|</span>
		    <%=projectVO.getP_ymd().substring(0,16) %>
		    <% if(auth == true) { %>
			    <span class="bar_basic">|</span>
			    <a href="./update.jsp?p_no=<%=projectVO.getP_no() %>">수정</a>
		    <% } %>			    
	    </div>  	    
	  </div>
	  
	  <hr>
	  
	  <div class="row">
	  	<div class="col" style="margin-bottom: 30px">
			<%=projectVO.getP_content() %>
			</div> 
	  </div>
	  
	  <div class="row justify-content-md-center">
		  <div class="card" style="width: 500px">
			  <div class="card-body">
			    GitHub : <%=projectVO.getP_git() %>
			  </div>
			</div> 
	  </div>
	  
  </div>
</div>
<jsp:include page="/common/bottom.jsp" flush='false' />
</body>
</html>