<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/ssi.jsp" %>
<%@ include file="/common/resource.jsp" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>:: 도움/출처 ::</title>

<script type="text/javascript">

</script>
</head>
<body>
<jsp:include page="/common/top.jsp" flush='false' />
<div class="container">
	<div class="card-group">
	  <div class="card">
	    <img class="card-img-top" src="<%=PATH %>/images/bootstrap.png" alt="Card image cap">
	    <div class="card-body">
	      <h5 class="card-title">Bootstrap</h5>
	      <p class="card-text">
	         사이트 개발에 사용된 레이아웃 및 대부분의 오브젝트는 부트스트랩에서 제공하는 클래스를 사용하였습니다.
				</p>
	    </div>
	    <div class="card-footer">
	      <a href="https://getbootstrap.com/" target="_blank">https://getbootstrap.com/</a>
	    </div>
	  </div>
	  <div class="card">
	    <img class="card-img-top" src="<%=PATH %>/images/fullpage.png" alt="Card image cap">
	    <div class="card-body">
	      <h5 class="card-title">Fullpage.js</h5>
	      <p class="card-text">
	         이력서 및 포트폴리오의 용도로 개발한 메인페이지는 Fullpage.js라는 오픈소스를 사용하였습니다.
	      </p>
	    </div>
	    <div class="card-footer">
	      <a href="https://alvarotrigo.com/fullPage/ko/#page1" target="_blank">https://alvarotrigo.com/fullPage/ko/#page1</a>
	    </div>
	  </div>
	  <div class="card">
	    <img class="card-img-top" src="<%=PATH %>/images/flaticon.jpg" alt="Card image cap">
	    <div class="card-body">
	      <h5 class="card-title">Flaticon</h5>
	      <p class="card-text">
	         사이트에 사용된 아이콘은 모두 Flaticon에서 제공받았으며, 모든 아이콘의 저작권은 Flaticon에 있음을 알려드립니다. 
	      </p>
	    </div>
	    <div class="card-footer">      
	      <div>Icons made by <a href="https://www.flaticon.com/authors/linh-pham" title="Linh Pham">Linh Pham</a> from <a href="https://www.flaticon.com/" 			    title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" 			    title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>      
	    </div>
	  </div>  
	</div>
	<div class="card-group">
		<div class="card">
	    <img class="card-img-top" src="<%=PATH %>/images/pixabay.jpg" alt="Card image cap">
	    <div class="card-body">
	      <h5 class="card-title">Pixabay</h5>
	      <p class="card-text">
	         사이트에 사용된 배경이미지는 Pixabay에서 제공받았으며, 모든 이미지의 저작권은 Pixabay에 있음을 알려드립니다. 
	      </p>
	    </div>
	    <div class="card-footer">
	      <a href="https://pixabay.com/" target="_blank">https://pixabay.com/</a>       
	    </div>
	  </div>
	  <div class="card">
	    <img class="card-img-top" src="<%=PATH %>/images/kps.jpg" alt="Card image cap">
	    <div class="card-body">
	      <h5 class="card-title">한국출판인회의</h5>
	      <p class="card-text">
	         사이트에 사용된 폰트는 한국출판인회의(KOPUS)에서 제공받았으며, 폰트의 저작권은 한국출판인회의에 있음을 알려드립니다.
	      </p>
	    </div>
	    <div class="card-footer">
	      <a href="http://www.kopus.org/Biz/electronic/Font.aspx" target="_blank">http://www.kopus.org/Biz/electronic/Font.aspx</a>     
	    </div>
	  </div>
	  <div class="card">
	    <img class="card-img-top" src="<%=PATH %>/images/notimage.jpg" alt="Card image cap">
	    <div class="card-body" style="background-color: #f7f7f7">
	      <h5 class="card-title"></h5>
	      <p class="card-text">
	         
	      </p>
	    </div>
	    <div class="card-footer">
	      &nbsp;    
	    </div>
	  </div>
	</div>  
</div>
<jsp:include page="/common/bottom.jsp" flush='false' />
</body>
</html>