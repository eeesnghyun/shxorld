<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/ssi.jsp" %>
<%@ include file="/common/resource.jsp" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
function choose_mail(opt){	
	var m_type = opt;	
	var id = $('#m_id').val();
	var from_id = id + "@" + m_type;	
	
	if( m_type == "insert" ) {	
		$('#m_type2').css("display", "");		
	} else {
		$('#m_type2').css("display", "none");
	}
	$('#sender').val(from_id);
}

function insert_mail(opt){
	var id = $('#m_id').val();
	var from_id = id + "@" + opt;
	$('#sender').val(from_id);
}

function send_mail(){	
	 $.ajax({
	    url: "./contact_mail.jsp",
	    type: "POST",
	    cache: false,
	    dataType: "json",
	    data: $('#frm_fourth').serialize(),
	    success: function(data){
	    	alert(data.msgs);
	    	$('#m_id').val('');
	    	$('#m_type').val("no_option").prop("selected", true);	    	
	    	$('#m_type2').val('');	
	    	$('#m_content').val('');	    		    	
	    },
	    beforeSend: function(){
	    	$('#send_btn').css("display", "none");
	    	$('#send_img').css({"display": "block", "margin": "0px auto"});
	    },
	    complete: function(){
	    	$('#send_btn').css("display", "block");
	    	$('#send_img').css("display", "none");
	    },
	    error: function (request, status, error){        
	      console.log("Code : "+ request.status + "\nError : "+ error + "\nMessage : " + request.responseText);              
	    }
	  });	
}
</script>

</head>
<body>

<form name="frm_fourth" id="frm_fourth" action='' method='POST'>	
  <input type="hidden" name="sender" id="sender" value=""> 

  <p style="text-align: center; font-size: 40px; font-weight: bold">
  	<img class="img_32" src="<%=PATH%>/images/mail.png">&nbsp;CONTACT
  </p>
  <div style="width: 600px; margin: 0px auto">
	  <div class="row" style="width: 100%; margin: 0px auto">
	    <div class="col-md-5">      
	      <input type="text" class="form-control mb-2" name='m_id' id='m_id' placeholder="E-MAIL">
	    </div>
	    <div class="col-md-7">      
	      <div class="input-group mb-2">
	        <div class="input-group-prepend">
	          <div class="input-group-text">@</div>
	        </div>
	        <select class="form-control" id="m_type" onchange="choose_mail(this.value)">
			        <option value="no_option">선택</option>
			        <option value="naver.com">naver.com</option>
				    	<option value="hanmail.com">hanmail.com</option>
				    	<option value="hotmail.com">hotmail.com</option>
				    	<option value="gmail.com">gmail.com</option>         	 
				    	<option value="nate.com">nate.com</option>         	          	 
				    	<option value="insert">직접입력</option>
		      </select>	            
			    <input type="text" class="form-control" name='m_type2' id='m_type2' value="" style="display: none" onchange="insert_mail(this.value)">		    
	      </div>
	    </div>
	  </div>
	  
	  <div class="form-group" style="width: 100%; margin: 0px auto;">       
	    <div class="col-md-12">
	      <textarea class="form-control input-md" name='m_content' id='m_content' rows='10'  placeholder="Content"></textarea>
	    </div>
	  </div> 
	  
	  <div class="form-group" style="width: 100%; margin: 10px auto;">  
	  	<button type="button" class="btn btn-outline-secondary" id="send_btn" onclick="send_mail()" style="width: 100%; font-weight: bold">
	  	 S E N D	  	
	  	</button>
	  	<img class="img_128" id="send_img" src="<%=PATH %>/images/sendmail.gif" style="display: none">
	  </div>	  	 	   		
	</div>	
	
	<div class="div_bottom">
		<jsp:include page="/common/bottom.jsp" flush='false' />
	</div>
	
</form>
</body>
</html>