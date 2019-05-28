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

ProjectBrVO projectbrVO = new ProjectBrVO();
projectbrVO = projectbrProc.read(pb_no);
%>

<script type="text/javascript">
$(document).ready(function(){
	var thumb = "<%=projectbrVO.getPb_img() %>";
	
	if(thumb == "") {
		$('#before_img').val("선택된 파일 없음");
	} else {
		$('#before_img').val(thumb);
	}
});

function update_proc(){
	$('#frm').attr("target","update_frm");
	$('#frm').attr("action","./update_proc.jsp");
	$('#frm').submit();
}

function thumbdown(){	
	var img = $('#before_img').val();
	var url = "<%=request.getContextPath()%>/download?dir=/intro/storage&filename=<%=projectbrVO.getPb_img() %>";
	
	if(img == "선택된 파일 없음") {
		alert("선택된 파일이 없습니다.");	
	} else {
		$(location).attr('href', url);
	}	
}
</script>

</head>
<body>
<form id='frm' name='frm' method='POST' action='./update_proc.jsp' enctype="multipart/form-data">
<input type="hidden" id="pb_no" name="pb_no" value="<%=pb_no %>">
<div class="container" style="margin-top: 30px">
	<div class="content">
		
		<div class="row justify-content-md-center" style="margin-top: 100px">
	  	<div class="col" style="background-color: #efefef; border-radius: 15px">			 
			  <div style="margin-top: 10px">
			  	<!-- <input type="file" class="form-control-file" id="pb_img" name="pb_img"> -->
			  	<div class="input-group">
		        <div class="input-group-prepend">
		          <div class="input-group-text">기존</div>
		        </div>		        
		        <input type="text" readonly class="form-control" id="before_img" name="before_img" value="" onclick="thumbdown()">		        
		      </div>	
		      <div class="input-group">
			     	<div class="input-group-prepend">
					    <div class="input-group-text">변경</div>
					  </div>
					  <div class="custom-file" style="margin-left: 10px">
					  	<input type="file" class="form-control-file" id="pb_img" name="pb_img">
					  </div>		        		       
		      </div>
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
			      	<input type="text" class="form-control" id="pb_title" name="pb_title" value="<%=projectbrVO.getPb_title()%>">
			      </td>			      
			    </tr>			  
			    <tr>
			      <th class="th_basic2">프로젝트 요약</th>
			      <td colspan="3">
			      	<textarea class="form-control" rows="4" id="pb_content" name="pb_content" maxlength="2000"><%=projectbrVO.getPb_content()%></textarea>			      	
			      </td>
			    </tr>
			    <tr>
			      <th class="th_basic2" rowspan="4">개발 환경</th>
			      <td style="width: 20%">Tool/Framework</td>
			      <td colspan="2">
			      	<input type="text" class="form-control" id="pb_tool" name="pb_tool" value="<%=projectbrVO.getPb_tool()%>">
						</td>			      
			    </tr>
			    <tr>			      
			      <td style="width: 20%">OS</td>
			      <td colspan="2">
			      	<input type="text" class="form-control" id="pb_os" name="pb_os" value="<%=projectbrVO.getPb_os()%>">
			      </td>
			    <tr>			      
			      <td style="width: 20%">Server(WAS)</td>			      
			      <td colspan="2">
			      	<input type="text" class="form-control" id="pb_server" name="pb_server" value="<%=projectbrVO.getPb_server()%>">
			      </td>
			    </tr>
			    <tr>			      
			      <td style="width: 20%">Database</td>			      
			      <td colspan="2">
			      	<input type="text" class="form-control" id="pb_db" name="pb_db" value="<%=projectbrVO.getPb_db()%>">
			      </td>
			    </tr>
			    <tr>
			      <th class="th_basic2">언어 및 기술</th>
			      <td colspan="2">
			      	<input type="text" class="form-control" id="pb_skill" name="pb_skill" value="<%=projectbrVO.getPb_skill()%>">
			      </td>			      
			    </tr>				
				</table>
			</div> 
	  </div>
	  <div class="row justify-content-md-center" style="margin-top: 30px">
	  	<button type="button" class="btn btn-outline-secondary" style="width: 20%; font-weight: bold" onclick="update_proc()">
			 수   정	  	
			</button>  
	  </div>
	  
	  <iframe id="update_frm" name="update_frm" style="display: none"></iframe>
	</div>
</div>
</form>
</body>
</html>