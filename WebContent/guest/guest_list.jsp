<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/ssi.jsp" %>
<%@ include file="/common/resource.jsp" %>

<script type="text/javascript">
function show_content(auth, g_no){	
	var guestImg = $('#guest_'+g_no);		
	var frm = $('#frm_panel');
	$('#input_pw',frm).val('');
	
	$.ajax({
    url: "./guest_read.jsp",
    type: "GET",
    cache: false,
    dataType: "json",
    data: "g_no=" + g_no,
    success: function(data){
    	var name = data.g_name + "(" + data.g_ip + ".***.***.***)";	 
    	
    	$('.div_panel',frm).css("display","");
    	/*$('.div_panel',frm).css({
    		   "position" : "absolute",
    		   "top" : guestImg.offset().top - 600,
    		   "left" : guestImg.offset().left - 300,    		  
    		   "z-index" : 999
    		});*/
    	$('#h_no',frm).val(data.g_no);	
    	var password = data.g_password;
    	
    	if(auth == true){				// 관리자는 모든 방명록 조회 가능 
    		$('#panel_A',frm).css("display","");
    		$('#panel_B',frm).css("display","none");		
    		$('#g_name',frm).val(name);
    		$('#g_ymd',frm).val(data.g_ymd);
    		$('#g_content',frm).html(data.g_content);
    		$('#g_password',frm).val(password);
    	} else {
    		$('#g_password',frm).css("display","none");
    		if(password != ""){    			
    			$('#panel_A',frm).css("display","none");
    			$('#panel_B',frm).css("display","");		
    		} else {			
    			$('#panel_A',frm).css("display","");
    			$('#panel_B',frm).css("display","none");		
    			$('#g_name',frm).val(name);
    			$('#g_ymd',frm).val(data.g_ymd);
    			$('#g_content',frm).html(data.g_content);
    		}	
    	}	    
    },
    
    error: function (request, status, error){        
    	var msg = "ERROR : " + request.status + "<br>"
      msg +=  + "내용 : " + request.responseText + "<br>" + error;
      console.log(msg);              
    }
  });	
}

function hide_content(){
	$('.div_panel').css("display","none");
}

function pword_check(){		
	var frm = $('#frm_panel');
	var i_pw = $('#input_pw',frm).val();
	var g_no = $('#h_no',frm).val();
	
	$.ajax({
    url: "./pword_check.jsp",
    type: "GET",
    cache: false,
    dataType: "json",
    data: "g_no=" + g_no + "&i_pw=" + i_pw,
    success: function(data){    	
    	if(data.cnt == 0){
    		$('#input_pw',frm).val('');
    		alert("비밀번호가 틀립니다.\n다시 확인해주세요.");    		
    	} else {
    		$('#input_pw',frm).val('');
    		hidden_content(g_no);
    	}
    },
    
    error: function (request, status, error){        
    	var msg = "ERROR : " + request.status + "<br>"
      msg +=  + "내용 : " + request.responseText + "<br>" + error;
      console.log(msg);              
    }
  });		
}

/* 비밀번호가 설정되어있는 방명록 보기 */
function hidden_content(g_no){
	var frm = $('#frm_panel');
	var guestImg = $('#guest_'+g_no);	

	$.ajax({
    url: "./guest_read.jsp",
    type: "GET",
    cache: false,
    dataType: "json",
    data: "g_no=" + g_no,
    success: function(data){    	
    	var name = data.g_name + "(" + data.g_ip + ".***.***.***)";	 
    	
    	$('.div_panel',frm).css("display","");
    	/*$('.div_panel',frm).css({
    		   "position" : "absolute",
    		   "top" : guestImg.offset().top - 600,
    		   "left" : guestImg.offset().left - 450
    		});*/
    	$('#panel_A',frm).css("display","");
    	$('#panel_B',frm).css("display","none");
    	$('#g_name',frm).val(name);
    	$('#g_ymd',frm).val(data.g_ymd);
    	$('#g_content',frm).html(data.g_content);	
    },
    
    error: function (request, status, error){        
    	var msg = "ERROR : " + request.status + "<br>"
      msg +=  + "내용 : " + request.responseText + "<br>" + error;
      console.log(msg);              
    }
  });		
}

function delete_proc(g_no){
	var delete_yn = confirm("정말 삭제하시겠습니까?");
	
	if(delete_yn == true) {
		$.ajax({
		    url: "./delete_proc.jsp",
		    type: "GET",
		    cache: false,
		    dataType: "json",
		    data: "g_no=" + g_no,
		    success: function(data){
			  	alert(data.msgs);
			  	window.location.reload();
		    },
		   
		    error: function (request, status, error){        
		   	 var msg = "ERROR : " + request.status + "<br>"
		      msg +=  + "내용 : " + request.responseText + "<br>" + error;
		      console.log(msg);              
		    }
		  });	
	} else {
		return;
	}	
}
</script>
<ul class="ul_inline">
<%
 ArrayList<GuestVO> list = guestProc.list(nowPage2, pagePost2);
 
 for(int i=0; i < list.size(); i++){
 	GuestVO guestVO = list.get(i);      	      
%>
 		<li class="li_inline">
 			<p style="text-align: center; cursor: pointer" onclick="show_content(<%=auth %>,<%=guestVO.getG_no()%>)">
 				<img id="guest_<%=guestVO.getG_no()%>" src="../images/<%=guestVO.getG_img() %>.png"> 				
 			</p>
 			<p style="text-align: center"><%=guestVO.getG_name() %> 님 
 			<% if(auth == true) { %>
 			<img src="<%=PATH %>/images/close.png" style="width: 16px; height: 16px; cursor: pointer" onclick="delete_proc(<%=guestVO.getG_no()%>)">
 			<% } %> 			
 			</p> 	 		  		
 		</li>
 <%
 }
 %>
</ul>

<form id="frm_panel" name="frm_panel">
<div class="div_panel" style="display: none; position: absolute; top: 50%; left: 50%; z-index: 999">
<span style="float: left; margin: 15px 0 0 15px"><img src="<%=PATH %>/images/message.png" style="width: 32px; height: 32px"></span>
<span style="float: right; margin: 15px 15px 0 0"><img src="<%=PATH %>/images/close.png" style="width: 32px; height: 32px; cursor: pointer" onclick="hide_content()"></span>

	<!-- 방명록 레이어 창 -->		
	<div class="container" id="panel_A">
		<div class="row" style="width: 100%; margin: 0px auto">
			<div class="col" style="margin-top: 10px">
				
				<div class="form">
					<div class="row">
						<div class="col-md-7">
							<div class="input-group mb-3">
							  <div class="input-group-prepend">
							    <span class="input-group-text">닉네임</span>
							  </div>
							  	<input type="text" class="form-control" id="g_name" name="g_name" value="" readonly="readonly">	
							</div>					
						</div>
						<div class="col-md-5">
							<div class="input-group mb-3">							  
							  <input type="text" class="form-control" id="g_password" name="g_password" value="" readonly="readonly">	
							</div>	
						</div>
					</div>	
				</div>
				
				<div class="form-group">
					<div class="input-group mb-3" style="width: 50%">
					  <div class="input-group-prepend">
					    <span class="input-group-text">작성일</span>
					  </div>
					  <input type="text" class="form-control" id="g_ymd" name="g_ymd" value="" style="text-align: center" readonly="readonly">				  				  			
					</div>						
				</div>
						
				<div class="form-group">    				
					<span class="form-control" id="g_content" style="height: 100px; overflow: scroll"></span>	    
		 	  </div>
		 	  
			</div>
		</div>		  
	</div>
	
	<!-- 방명록 레이어 창(잠금) -->
	<div class="container" id="panel_B" style="display: none">
		<div class="row" style="width: 100%; margin: 0px auto">
			<div class="col" style="margin-top: 50px">
				
				<div class="form-group">	
					<input type="hidden" id="h_no" name="h_no" value="">		   					
			    <input type="password" class="form-control" id="input_pw" name="input_pw" placeholder="비밀번호">
			  </div>
			  <button type="button" class="btn btn-outline-secondary" style="width: 100%" onclick="pword_check()">확인</button>		
				
			</div>
		</div>
	</div>

</div>
</form>