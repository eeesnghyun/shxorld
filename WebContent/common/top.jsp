<%@ page contentType="text/html; charset=UTF-8" %>
<%
String PATH = request.getContextPath();
%>
<div class="div_top">	
	<nav class="navbar navbar-expand-lg navbar-light" style="height: 130px">	  	  
	  <a class="navbar-brand" href="<%=PATH %>/intro/main">
	  	<img src="<%=PATH %>/images/myimg.jpg" style="width: 64px; height: 64px; border: 2px solid #555555; border-radius: 35px">
	  </a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarText">
	    <ul class="navbar-nav mr-auto">	      
	      <li class="nav-item">
	        <a class="nav-link" href="<%=PATH %>/project/list">프로젝트</a>
	      </li>	      
	      <li class="nav-link">|</li>
	      <li class="nav-item">
	        <a class="nav-link" href="<%=PATH %>/guest/board">방명록</a>
	      </li>	    
	      <li class="nav-link">|</li>  
	      <li class="nav-item">
	        <a class="nav-link" href="<%=PATH %>/help/main">도움</a>
	      </li>
	    </ul>	    
	  </div>
	</nav>
</div>
  
