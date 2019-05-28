<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/ssi.jsp" %>
<%@ include file="/common/resource.jsp" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>:: 방명록 ::</title>
<script type="text/javascript">
$(function() {
  list();  
  paging();
});
	
function paging(nowPage, pagePost){	
  $.ajax({
    url: "./paging.jsp",
    type: "GET",
    cache: false,
    data: "nowPage2="+nowPage+"&pagePost2="+pagePost,
    dataType: "html",
    success: function(data){ // 정상 처리
      $('#paging').html(data);
    	list(nowPage, pagePost);
    },
   
    error: function (request, status, error){        
    	var msg = "ERROR : " + request.status + "<br>"
      msg +=  + "내용 : " + request.responseText + "<br>" + error;
      console.log(msg);   
    }
  }); 
}	
	
function select_img(name){	
	if( $('#g_img').val() == "" ) {		
		$('#'+name).attr('src','../images/'+name+'_s.png');
		$('#g_img').val(name);
	} else {
		$('#'+$('#g_img').val()).attr('src','../images/'+$('#g_img').val()+'.png');
		$('#'+name).attr('src','../images/'+name+'_s.png');
		$('#g_img').val(name);
	}				
}

function showHidden(){
	if($("input:checkbox[id='customControlAutosizing']").is(":checked") == true) {
		$('#g_password').attr('disabled', false);
		$('#g_show').val("N");
		$('#g_password').val("");
	} else {
		$('#g_password').attr('disabled', true);
		$('#g_show').val("Y");
		$('#g_password').val("");
	}	
}

function create_check(){	
	if($('#g_img').val() == "") {
		alert("이미지를 선택해주세요.");		
		return;
	} else if($('#g_name').val() == ""){
		alert("닉네임을 입력해주세요.");
		return;	
	}	else if($('#g_content').val() == ""){
		alert("내용을 입력해주세요.");
		return;
	} else if($("input:checkbox[id='customControlAutosizing']").is(":checked") == true && $('#g_password').val() == ""){
		alert("비밀번호를 입력해주세요.");
		return;	
	}
	create_proc();
}

function create_proc(){
	$.ajax({
		url: "./create_proc.jsp",
    type: "POST",
    cache: false,
    dataType: "json",
    data: $('#frm').serialize(),    
    success: function(data){ // 정상 처리
      alert(data.msgs);
    	reload();
    	list();
    },    
    error: function (request, status, error){        
    	var msg = "ERROR : " + request.status + "<br>"
      msg +=  + "내용 : " + request.responseText + "<br>" + error;
      console.log(msg);   
    }
	});
}

function list(nowPage, pagePost){		
  $.ajax({
    url: "./guest_list.jsp",
    type: "GET",
    cache: false,    
    dataType: "html", 
    data: "nowPage2="+nowPage+"&pagePost2="+pagePost,
    success: function(data){ // 정상 처리
      $('#list').html(data);	    		 
    },
   
    error: function (request, status, error){        
    	var msg = "ERROR : " + request.status + "<br>"
      msg +=  + "내용 : " + request.responseText + "<br>" + error;
      console.log(msg);   
    }
  });
}

function reload(){
	$('#'+$('#g_img').val()).attr('src','../images/'+$('#g_img').val()+'.png');
	$('#g_img').val('');
	$('#g_name').val('');
	$('#g_content').val('');
	$('#g_password').val('');	
	$('#g_password').attr('disabled', true);
	$("input:checkbox[id='customControlAutosizing']").prop("checked", false);	
}

$(function() {
    $('#g_content').keyup(function (e){
        var content = $(this).val();
        //$(this).height(((content.split('\n').length + 1) * 2.0) + 'em');
        $('#counter').html(content.length + '/200');
    });
    $('#g_content').keyup();
});
</script>

</head>
<body>
<jsp:include page="/common/top.jsp" flush='false' />
<form name="frm" id="frm" action='' method='POST'>
<input type="hidden" id="g_show" name="g_show" value="Y">
<input type="hidden" id="g_img" name="g_img" value="">

<div class="container">  
	<div class="row">
		 <div class="col">
			 <div class="jumbotron2 jumbotron-fluid">
			   <div class="container">
			     <h1 class="display-4" style="color: #d56526; font-weight: bold">Hello, Stranger?</h1>
			     <p style="color: #d56526">방문해주신 분들의 다양한 의견을 들어보고 싶습니다.</p>
			     <hr class="my-4" style="border-color: #bf7b56">
			   </div>
			 </div>
		 </div>
	</div>
	
	<div class="row" style="width: 55%; margin: 0px auto">
		<div class="col" style="margin-top: 10px">						
			<div class="form-group">
			  <img src="<%=PATH %>/images/guest1.png" id="guest1" style="width: 64px; height: 64px; cursor:pointer" onclick="select_img('guest1')">
			  <img src="<%=PATH %>/images/guest2.png" id="guest2" style="width: 64px; height: 64px; cursor:pointer" onclick="select_img('guest2')">
			  <img src="<%=PATH %>/images/guest3.png" id="guest3" style="width: 64px; height: 64px; cursor:pointer" onclick="select_img('guest3')">			  
			  <img src="<%=PATH %>/images/guest4.png" id="guest4" style="width: 64px; height: 64px; cursor:pointer" onclick="select_img('guest4')">
			</div>
			
			<div class="form-group">
				<div class="input-group mb-3" style="width: 50%">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="basic-addon1">닉네임</span>
				  </div>
				  <input type="text" class="form-control" aria-label="Username" aria-describedby="basic-addon1" id="g_name" name="g_name" maxlength="7">			  
				</div>						
			</div>
			
		  <div class="form-group">		  	    		   
		    <textarea class="form-control" rows="4" id="g_content" name="g_content" placeholder="여러분의 의견을 자유롭게 작성해주세요." maxlength="200"></textarea>
		    <span class="text_cnt" id="counter">###</span>		    
		  </div>		  		 
		  
		  <div class="form-row align-items-center">
			  <div class="col-sm-4">		      
		      	<input type="password" class="form-control mb-2" id="g_password" name="g_password" placeholder="비밀번호" disabled="disabled" value="">
		   	  </div>	  
			  <div class="col-sm-3" style="margin-bottom: 7px">
			      <div class="custom-control custom-checkbox mr-sm-2">
			        <input type="checkbox" class="custom-control-input" id="customControlAutosizing" onclick="showHidden()">
			        <label class="custom-control-label" for="customControlAutosizing"><span class="font-weight-bold" style="color: #eb475d">비공개</span></label>
			      </div>
		   	  </div>
		   	  <div class="col-sm-5" style="margin-bottom: 7px">
			      <button type="button" class="btn btn-outline-secondary" style="width: 100%; font-weight: bold" onclick="create_check()">
				  	 등   록	  	
				  	</button>
		   	  </div>
		  </div>	  
	  </div>
  </div>
  
  <div class="row">
  	<div class="col">
  		<hr style="border-color: #eb475d">  		
  	</div>
  </div>
  
  <div class="row" style="width: 830px; margin: 0px auto">
    <div class="col">
      <div id="list"></div>
    </div>
  </div>
  
  <div class="row" style="margin-top: 80px">			
		<div class="col">
			<div id="paging"></div>
		</div>
	</div>
</div>
</form>
<jsp:include page="/common/bottom.jsp" flush='false' />
</body>
</html>