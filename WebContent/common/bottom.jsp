<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="web.common.Auth" %>
<%
String PATH = request.getContextPath();
%>

<div style="text-align: center; clear: both; padding-top: 30px">	
	※본 사이트는 개인 포트폴리오 용도로 개발하였습니다.
	<div class="form-group" style="margin: 10px auto; text-align: center; border-top: 1px solid #a6a6a6">  
		<div style="margin-top: 10px">
		<%	    
    if( Auth.adminYN(request) ) {
    %>
      <a href="<%=PATH %>/admin/logout.jsp">
      	<img class="img_32" src="<%=PATH %>/images/logout.png">
      </a>
    <%
    } else {
    %>
      <a href="<%=PATH %>/admin/login">
      	<img class="img_32" src="<%=PATH %>/images/login.png">
      </a>
    <% 
    }
    %>
    	<span class="bar_basic">|</span>
		<a href="https://shxrecord.tistory.com/" target="_blank"><img class="img_32" src='<%=PATH %>/images/blog.png' title="blog"></a>
		<span class="bar_basic">|</span>
		<a href="<%=PATH %>/guest/board"><img class="img_32" src='<%=PATH %>/images/myweb.png' title="guest book"></a>
		</div>
  </div> 
</div>