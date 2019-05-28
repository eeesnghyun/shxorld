<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/ssi.jsp" %>
<%@ include file="/common/resource.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<%
int pb_no = Integer.parseInt(request.getParameter("pb_no"));
int total = Integer.parseInt(request.getParameter("total_pb"));

ProjectBrVO projectbrVO = new ProjectBrVO(); 
projectbrVO = projectbrProc.read(pb_no); 
%>
<script type="text/javascript">
function onDetail(pb_no){
	var path = "<%=PATH %>";
	var option = "width=1200, height=500, left=50, top=50, resizable=no, scrollbars=yes, status=no, location=no, directories=yes;"; 
	window.open(path+"/project/read?p_no="+pb_no, "pop1", option);
}
</script>

</head>
<body>
<div class="container">
	<div class="content">
		<div class="row justify-content-md-center">
	    <div class="col-sm-12" style="text-align: center">
	    	<h1 class="display-4" style="font-weight: bold">[ <%=projectbrVO.getPb_title() %> ]</h1>
	    </div>
	    <div class="col-sm-12" style="text-align: center">
	    	
	    </div>
	  </div>
	  
		<div class="row justify-content-md-center" style="margin-top: 20px">
	  	<div class="col">			 
	  	<%
	  	if(projectbrVO.getPb_img() != null) {
	  	%>
			  <img class="rounded" src="./storage/<%=projectbrVO.getPb_img() %>" style="margin-top: 10px; width: 500px; height: 500px; cursor: pointer" onclick="onDetail('<%=pb_no %>')">			 
			<%
	  	} else {
			%>
			  <img class="rounded" src="<%=PATH %>/images/noimage.png" style="margin-top: 10px; width: 500px; height: 500px; cursor: pointer" onclick="onDetail('<%=pb_no %>')">
			<%
	  	}
			%>
			</div> 
			<div class="col">
			  <table class="table table-borderless" style="width: 100%; height: 500px; border-collapse: separate; border-spacing: 0 10px">			  
			    <colgroup>
			    	<col style="width: 25%;" />
			    </colgroup>
			    <tr>
			      <th class="th_basic2">프로젝트명</th>
			      <td colspan="3"><input type="text" readonly class="form-control-plaintext" value="<%=projectbrVO.getPb_title() %>"></td>			      
			    </tr>			  
			    <tr>
			      <th class="th_basic2">프로젝트 요약</th>
			      <td colspan="3"><textarea readonly class="form-control-plaintext" rows="4"><%=projectbrVO.getPb_content() %></textarea></td>
			    </tr>
			    <tr>
			      <th class="th_basic2" rowspan="4">개발 환경</th>
			      <td style="width: 20%">Tool/Framework</td>
			      <td colspan="2"><input type="text" readonly class="form-control-plaintext" value="<%=projectbrVO.getPb_tool() %>"></td>			      
			    </tr>
			    <tr>			      
			      <td style="width: 20%">OS</td>
			      <td colspan="2"><input type="text" readonly class="form-control-plaintext" value="<%=projectbrVO.getPb_os() %>"></td>
			    <tr>			      
			      <td style="width: 20%">Server(WAS)</td>			      
			      <td colspan="2"><input type="text" readonly class="form-control-plaintext" value="<%=projectbrVO.getPb_server() %>"></td>
			    </tr>
			    <tr>			      
			      <td style="width: 20%">Database</td>			      
			      <td colspan="2"><input type="text" readonly class="form-control-plaintext" value="<%=projectbrVO.getPb_db() %>"></td>
			    </tr>
			    <tr>
			      <th class="th_basic2">언어 및 기술</th>
			      <td colspan="2"><input type="text" readonly class="form-control-plaintext" value="<%=projectbrVO.getPb_skill() %>"></td>			      
			    </tr>				
				</table>
			</div> 
	  </div>
	  
	  <hr>
	  <div class="row justify-content-md-center" style="margin-top: 20px">
	  	<div class="col-sm-12" style="text-align: center">
	    	- <%=pb_no %> / <%=total %> -
	    </div>
	    <div class="col-sm-12" style="text-align: center">
	    	<a href="<%=PATH%>/project/list" target="_blank">(전체보기)</a>
	    </div>
	  </div>
	  
	</div>
</div>
</body>
</html>