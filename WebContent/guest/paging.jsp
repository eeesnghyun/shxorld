<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/ssi.jsp" %>
<%@ page import="web.common.Auth" %>

<%
int postCount = guestProc.count();

int pagePerBlock = 10; // 블럭당 페이지 수 
int totalPage = (int)(Math.ceil((double)postCount/pagePost2)); // 전체 페이지  
int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));// 전체 그룹 
int nowGrp = (int)(Math.ceil((double)nowPage2/pagePerBlock));    // 현재 그룹 
int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작  
int endPage = (nowGrp * pagePerBlock);             // 특정 그룹의 페이지 목록 종료   
 
int _nowPage = (nowGrp-1) * pagePerBlock; // 10개 이전 페이지로 이동     
%>

<nav aria-label="...">
	<ul class='pagination2 justify-content-center'>
	<%
	if (nowGrp >= 2){
	%>
		<li class="page-item2">
			<%-- <a class='page-link2' href='./paging.jsp?nowPage2=<%=_nowPage%>&pagePost2=<%=pagePost2 %>'>이전</a> --%>
			<a class='page-link2' onclick="paging(<%=_nowPage %>, <%=pagePost2 %>)">이전</a>
		</li>
	<%    	
	} 
	
	for(int i=startPage; i<=endPage; i++){ 
	  if (i > totalPage){ 
	    break; 
	  }   
	  if (nowPage2 == i){
	%>  	
	  <li class='page-item2 active'>
	  	<a class='page-link2' href='#'><%=i %></a>
	 	</li>
	<%
	  }else{
	%>		  
	  <li class='page-item2'>
	  	<a class='page-link2' onclick="paging(<%=i %>, <%=pagePost2 %>)"><%=i %></a>
	  </li>
	<%
	  } 
	} 
	%>
	
	<%
	if (nowGrp < totalGrp){
		_nowPage = (nowGrp * pagePerBlock)+1; // 10개 다음 페이지로 이동		
	%>
		<li class='page-item2'>
			<%-- <a class='page-link2' href='./paging.jsp?nowPage2=<%=_nowPage %>&pagePost2=<%=pagePost2 %>'>다음</a> --%>
			<a class='page-link2' onclick="paging(<%=_nowPage %>, <%=pagePost2 %>)">다음</a>
		</li>
	<%	
	} 
	%>
	</ul>
</nav>

