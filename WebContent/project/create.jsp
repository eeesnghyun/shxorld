<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/ssi.jsp" %>
<%@ include file="/common/resource.jsp" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript" src="<%=PATH %>/ckeditor/ckeditor.js"></script>

<script type="text/javascript">
function getType(e){
	var type = e.value;
	$('#p_type').val(type);
}

function create_proc(){	
	var showYN = $('input[id="customRadioInline1"]:checked').val();
	var p_type = $('#p_type').val();
	
	$('#p_show').val(showYN);	
	if(p_type == "") { alert("프로젝트 분류를 선택해주세요."); return; }
	
	$('#frm').attr("target","create_frm");
	$('#frm').attr("action","./create_proc.jsp");
	$('#frm').submit();
}
</script>

</head>
<body>
<jsp:include page="/common/top.jsp" flush='false' />
<form id='frm' name='frm' method='POST' action='./create_proc.jsp' enctype="multipart/form-data">
<input type="hidden" id="p_show" name="p_show">

<div class="container">
	<div class="content" style="width: 70%">
	
		<div class="row justify-content-md-center">
			<div class="col-sm-9">
		    <div class="input-group mb-3">
			    <div class="input-group-prepend">
				    <label class="input-group-text">제목</label>
				  </div>		    
				  <input type="text" class="form-control" id="p_title" name="p_title">			  
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
				  <textarea class="form-control" id="p_content" name="p_content"></textarea>
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
			  <input type="text" class="form-control" id="p_git" name="p_git">
			</div>
	  </div>
	  
	  <div class="row justify-content-md-center">
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text">썸네일</span>
			  </div>
			  <div class="custom-file">
			  	&nbsp;<input type="file" class="form-control-file" id="p_img" name="p_img">
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
					  <input class="custom-control-input" type="radio" id="customRadioInline1" name="customRadioInline1" value="Y" checked>
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
	    <button type="button" class="btn btn-outline-secondary" style="width: 20%; font-weight: bold" onclick="create_proc()">
			 등   록	  	
			</button>
		</div>
		
		<iframe id="create_frm" name="create_frm" style="display: none"></iframe>
  </div>
</div>
</form>
<jsp:include page="/common/bottom.jsp" flush='false' />
</body>
</html>