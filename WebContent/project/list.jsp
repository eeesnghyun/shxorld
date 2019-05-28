<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/ssi.jsp" %>
<%@ include file="/common/resource.jsp" %>
<%@ page import="web.common.Auth" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>:: 프로젝트 ::</title>
<script type="text/javascript">
$(document).ready(function(){
	paging();
	board();
});

function paging(nowPage, pagePost){	
  $.ajax({
    url: "./paging.jsp",
    type: "GET",
    cache: false,
    data: "nowPage="+nowPage+"&pagePost="+pagePost,
    dataType: "html",
    success: function(data){ // 정상 처리
      $('#paging').html(data);
    	board(nowPage, pagePost);
    },
   
    error: function (request, status, error){        
    	var msg = "ERROR : " + request.status + "<br>"
      msg +=  + "내용 : " + request.responseText + "<br>" + error;
      console.log(msg);   
    }
  }); 
}

function board(nowPage, pagePost){		
  $.ajax({
    url: "./board.jsp",
    type: "GET",
    cache: false,
    data: "nowPage="+nowPage+"&pagePost="+pagePost,
    dataType: "html",
    success: function(data){ // 정상 처리
      $('#board').html(data);	    		 
    },
   
    error: function (request, status, error){        
    	var msg = "ERROR : " + request.status + "<br>"
      msg +=  + "내용 : " + request.responseText + "<br>" + error;
      console.log(msg);   
    }
  });
}

function img_hover(){
	$('#write').attr('src','<%=PATH%>/images/write_hover.png');
}

function img_out(){
	$('#write').attr('src','<%=PATH%>/images/write.png');
}

function projectIMG(img){		
	var path = "<%=PATH%>";
	var thumb = "";
  if(img == "선택된 파일 없음"){
	  thumb = "<img src='"+path+"/images/noimage.png' style=\"width: 190px; height: 140px; margin: 5px 0px 0px 5px\">";
  } else {
	  thumb = "<img class=\"rounded\" src='"+path+"/project/storage/"+img+"' style=\"width: 190px; height: 125px; margin: 5px 0px 0px 5px\">";
  }
	$('#img_thumb').append(thumb);	
}

function img_clear(){
	$('#img_thumb').empty();
}

function update_show(p_no){
  var p_show = $('#p_show option:selected').val();	 
  $.ajax({
     url: "./update_show.jsp",
     type: "GET",
     cache: false,
     dataType: "json",
     data: "p_no=" + p_no+"&p_show="+p_show,
     success: function(data){
		  	alert(data.msgs);
     },
    
     error: function (request, status, error){        
    	 var msg = "ERROR : " + request.status + "<br>"
       msg +=  + "내용 : " + request.responseText + "<br>" + error;
       console.log(msg);              
     }
   });
}
</script>

</head>
<body>
<jsp:include page="/common/top.jsp" flush='false' />
<div class="container">
	<div class="content">
		<div class="row">					
			<div class="col-12">					
				<div class="jumbotron" style="width: 75%; height: 230px; margin: 0px auto; margin-bottom: 15px">
					<h1 class="display-4" style="color: #1d375d; font-weight: bold">
						<img src="<%=PATH %>/images/preview.png" style="width: 5%; height: 30px">
						Hello, world!
				  </h1>
				  <p style="color: #1d375d">처음 "Hello, world"를 화면으로 마주한 순간부터 현재까지.<br>
				   재미로, 과제로, 또는 재직중 개발했던 내용들을 기록하고 있습니다. 관련 자료는 깃허브에서 확인하실 수 있습니다 :-)
				  </p>
				  <hr class="my-4" style="border-color: #659eb3;">				  			
				</div>
			</div>						
		</div>
		
		<div class="row">
			<div class="col">
			<% if(auth == true) { %>
				<span style="float: right">
				<a href="./create.jsp">
					<img class="img_32" id="write" src="<%=PATH %>/images/write.png" onmouseover="img_hover()" onmouseout="img_out()">					
				</a>
				</span>
			<% } %>
			</div>
		</div>
		
		<div class="row">
			<div class="col">
				<div id="board"></div>
			</div>
		</div>
		
		<div class="row">			
			<div class="col">
				<div id="paging"></div>
			</div>
		</div>
				
	</div>	
</div>
<jsp:include page="/common/bottom.jsp" flush='false' />
</body>
</html>