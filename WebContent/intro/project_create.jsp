<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/ssi.jsp" %>
<%@ include file="/common/resource.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function create_proc(){
	$('#frm').attr("target","create_frm");
	$('#frm').attr("action","./create_proc.jsp");
	$('#frm').submit();
}
</script>

</head>
<body>
<form id='frm' name='frm' method='POST' action='./create_proc.jsp' enctype="multipart/form-data">
<input type="hidden" id="pb_no" name="pb_no" value="<%=request.getParameter("pb_no")%>">
<div class="container" style="margin-top: 30px">
	<div class="content">
		
		<div class="row justify-content-md-center" style="margin-top: 100px">
	  	<div class="col" style="background-color: #efefef; border-radius: 15px">			 
			  <div style="margin-top: 10px">
			  	<input type="file" class="form-control-file" id="pb_img" name="pb_img">
			  </div>			 
			</div> 
			<div class="col">
			  <table class="table table-borderless" style="width: 100%; height: 500px; margin-top: 20px; border-collapse: separate; border-spacing: 0 10px">			  
			    <colgroup>
			    	<col style="width: 25%;" />
			    </colgroup>
			    <tr>
			      <th class="th_basic2">프로젝트명</th>
			      <td colspan="3">
			      	<input type="text" class="form-control" id="pb_title" name="pb_title">
			      </td>			      
			    </tr>			  
			    <tr>
			      <th class="th_basic2">프로젝트 요약</th>
			      <td colspan="3">
			      	<textarea class="form-control" rows="4" id="pb_content" name="pb_content" maxlength="2000"></textarea>			      	
			      </td>
			    </tr>
			    <tr>
			      <th class="th_basic2" rowspan="4">개발 환경</th>
			      <td style="width: 20%">Tool/Framework</td>
			      <td colspan="2">
			      	<input type="text" class="form-control" id="pb_tool" name="pb_tool">
						</td>			      
			    </tr>
			    <tr>			      
			      <td style="width: 20%">OS</td>
			      <td colspan="2">
			      	<input type="text" class="form-control" id="pb_os" name="pb_os">
			      </td>
			    <tr>			      
			      <td style="width: 20%">Server(WAS)</td>			      
			      <td colspan="2">
			      	<input type="text" class="form-control" id="pb_server" name="pb_server">
			      </td>
			    </tr>
			    <tr>			      
			      <td style="width: 20%">Database</td>			      
			      <td colspan="2">
			      	<input type="text" class="form-control" id="pb_db" name="pb_db">
			      </td>
			    </tr>
			    <tr>
			      <th class="th_basic2">언어 및 기술</th>
			      <td colspan="2">
			      	<input type="text" class="form-control" id="pb_skill" name="pb_skill">
			      </td>			      
			    </tr>				
				</table>
			</div> 
	  </div>
	  <div class="row justify-content-md-center" style="margin-top: 30px">
	  	<button type="button" class="btn btn-outline-secondary" style="width: 20%; font-weight: bold" onclick="create_proc()">
			 등   록	  	
			</button>  
	  </div>
	  
	  <iframe id="create_frm" name="create_frm" style="display: none"></iframe>
	</div>
</div>
</form>
</body>
</html>