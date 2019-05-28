<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/ssi.jsp" %>
<%@ include file="/common/resource.jsp" %>

<table class="table table-hover" style="margin-top: 10px">
 <colgroup>
 	<col width="5%">
 	<col width="15%">
 	<col width="36%">
 	<col width="15%">
 	<col width="5%">
 	<% if(auth == true) { %>
 	<col width="10%">
 	<col width="7%">
 	<col width="7%">
 	<% } %>
 </colgroup>
 <thead>
   <tr class="tr_basic" style="background-color: #e9b914">
     <th scope="col" style="color: #1d375d">NO</th>
     <th scope="col" style="color: #1d375d">분류</th>
     <th scope="col" style="color: #1d375d">프로젝트명</th>
     <th scope="col" style="color: #1d375d">등록일</th>
     <th scope="col" style="color: #1d375d">조회</th>
     <% if(auth == true) { %>
     <th scope="col" style="color: #1d375d">관리자</th>
     <th scope="col" style="color: #1d375d">공개</th>
     <th scope="col" style="color: #1d375d">요약</th>
     <% } %>
   </tr>
 </thead>
 <tbody>
 <%
 ArrayList<ProjectVO> list = new ArrayList<ProjectVO>();
 String adminYN = "";
 
 if(auth == true) {
 	adminYN = "Y";			  	
 } else {
 	adminYN = "N";			  
 }
 list = projectProc.list(nowPage, pagePost, adminYN);
 
 for(int i=0; i<list.size(); i++){
 	ProjectVO projectVO = list.get(i);
 %>
   <tr class="tr_basic">
     <th scope="row"><%=projectVO.getRnum() %></th>
     <td><% if(projectVO.getP_type().equals("S")) {%>학부프로젝트<%
     		 } else if(projectVO.getP_type().equals("T")) {%>토이프로젝트<%			      			
     		 } else { %>사내프로젝트<% } %>			      
     </td>
     <td>
     	<a id="p_title" href="./read?p_no=<%=projectVO.getP_no() %>">
     	<%=projectVO.getP_title() %>
     	</a>
     </td>
     <td><%=projectVO.getP_ymd().substring(0,10) %></td>
     <td><%=projectVO.getP_cnt() %></td>
     <% if(auth == true) { %>
     <td>
     	<a href="./update.jsp?p_no=<%=projectVO.getP_no() %>">수정</a>			      	
     </td>			      			      
     <td>
     	<select id="p_show" name="p_show" onchange="update_show(<%=projectVO.getP_no()%>)">						    
		    <option value="Y" <%if(projectVO.getP_show().equals("Y")) { %> selected <% } %>>Y</option>
		    <option value="N" <%if(projectVO.getP_show().equals("N")) { %> selected <% } %>>N</option>						    
		  </select>			   			     
     </td>
     <td>
     	 <% if(projectVO.getP_brief().equals("N")) { %>
     	 	 <a href="<%=PATH %>/intro/project_create.jsp?pb_no=<%=projectVO.getP_no() %>">등록</a>
     	 <% } else {%>
     	 	 <a href="<%=PATH %>/intro/project_update.jsp?pb_no=<%=projectVO.getP_no() %>">수정</a>
     	 <% } %>	      				      
     </td>
     <% } %>
   </tr>
 <%
 } 
 %>
  </tbody>
</table>