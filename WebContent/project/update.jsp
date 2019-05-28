<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/ssi.jsp" %>
<%@ include file="/common/resource.jsp" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<%
int p_no = Integer.parseInt(request.getParameter("p_no"));
ProjectVO projectVO = projectProc.read(p_no);
%>
<script type="text/javascript" src="<%=PATH %>/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var type = "<%=projectVO.getP_type() %>";
	var show = "<%=projectVO.getP_show() %>";
	var thumb = "<%=projectVO.getP_img() %>";
	
	if(thumb == "") {
		$('#before_img').val("선택된 파일 없음");
	} else {
		$('#before_img').val(thumb);
	}
	
	$('#p_type').val(type).prop("selected", true);
	$("input:radio[name='customRadioInline1']:input[value="+show+"]").attr("checked", true);
});

function getType(e){
	var type = e.value;
	$('#p_type').val(type);
}

function update_proc(){	
	var showYN = $('input[name="customRadioInline1"]:checked').val();
	var p_type = $('#p_type').val();
	
	$('#p_show').val(showYN);	
	if(p_type == "") { alert("프로젝트 분류를 선택해주세요."); return; }
		
	$('#frm').attr("target","update_frm");
	$('#frm').attr("action","./update_proc.jsp");
	$('#frm').submit();
}

function thumbdown(){	
	var img = $('#before_img').val();
	var url = "<%=request.getContextPath()%>/download?dir=/project/storage&filename=<%=projectVO.getP_img() %>";
	
	if(img == "선택된 파일 없음") {
		alert("선택된 파일이 없습니다.");	
	} else {
		$(location).attr('href', url);
	}	
}
</script>

</head>
<body>
<jsp:include page="/common/top.jsp" flush='false' />
<form id='frm' name='frm' method='POST' action='./update_proc.jsp' enctype="multipart/form-data">
<input type="hidden" id="p_no" name="p_no" value="<%=projectVO.getP_no() %>">
<input type="hidden" id="p_show" name="p_show">

<div class="container">
	<div class="content" style="width: 70%">
	
		<div class="row justify-content-md-center">
			<div class="col-sm-9">
		    <div class="input-group mb-3">
			    <div class="input-group-prepend">
				    <label class="input-group-text">제목</label>
				  </div>		    
				  <input type="text" class="form-control" id="p_title" name="p_title" value="<%=projectVO.getP_title() %>">			  
				</div>
			</div>
			<div class="col-sm-3">
				<div class="input-group mb-3">
					<select class="custom-select" id="p_type" name="p_type" onchange="getType(this)">
				    <option value="" selected>프로젝트 분류</option>
				    <option value="S">학부프로젝트</option>
				    <option value="T">토이프로젝트</option>
				    <option value="C">사내프로젝트</option>
				  </select>  
				</div>
			</div>			
	  </div>
	  
	  <hr>
	  
	  <div class="row justify-content-md-center">
	  	<div class="col_c" style="margin-bottom: 30px">
				<div class="input-group">				 
				  <textarea class="form-control" id="p_content" name="p_content"><%=projectVO.getP_content() %></textarea>
				  <script type="text/javascript">
				  CKEDITOR.replace('p_content'
						  						, {height: 500					  							
				  							    });
				  </script>
				</div>
			</div> 
	  </div>
	  
	  <div class="row justify-content-md-center">
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text">GitHub</span>
			  </div>
			  <input type="text" class="form-control" id="p_git" name="p_git" value="<%=projectVO.getP_git() %>">
			</div>
	  </div>
	  
	  <div class="row justify-content-md-center">
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text">썸네일</span>
			  </div>
			  <div class="col-sm-4 my-1">
		      <div class="input-group">
		        <div class="input-group-prepend">
		          <div class="input-group-text">기존</div>
		        </div>		        
		        <input type="text" readonly class="form-control" style="border: none; background-color: #fff; margin-left: 5px"
		        			 id="before_img" name="before_img" value="" onclick="thumbdown()">		        
		      </div>	        		     
		    </div>
		    <div class="col-sm-5 my-1">		     	
		     	<div class="input-group">
			     	<div class="input-group-prepend">
					    <div class="input-group-text">변경</div>
					  </div>
					  <div class="custom-file" style="margin-left: 10px">
					  	<input type="file" class="form-control-file" id="p_img" name="p_img">
					  </div>		        		       
		      </div>	  		     			     
		    </div>			  
			</div>
	  </div>
	  
	  <div class="row justify-content-md-center">
		  <div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text">공개여부</span>
			  </div>
			  <div class="input-group-prepend" style="margin: 5px 0 0 10px">
				  <div class="custom-control custom-radio custom-control-inline">
					  <input class="custom-control-input" type="radio" id="customRadioInline1" name="customRadioInline1" value="Y">
					  <label class="custom-control-label" for="customRadioInline1">공개</label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
					  <input class="custom-control-input" type="radio" id="customRadioInline2" name="customRadioInline1" value="N">
					  <label class="custom-control-label" for="customRadioInline2">비공개</label>
					</div>
				</div>
			</div>		  
		</div>
	  
	  <div class="row justify-content-md-center">
	    <button type="button" class="btn btn-outline-secondary" style="width: 20%; font-weight: bold" onclick="update_proc()">
			 수   정	  	
			</button>
		</div>
		
		<iframe id="update_frm" name="update_frm" style="display: none"></iframe>
  </div>
</div>
</form>
<jsp:include page="/common/bottom.jsp" flush='false' />
</body>
</html>