<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/resource.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function thumbdown(){	
	var url = "<%=request.getContextPath()%>/download?dir=/intro/file&filename=portfolio.pdf";
	
	$(location).attr('href', url);
}
</script>
</head>
<body>
<form id="frm_profile" name="frm_profile">
	<!-- DB -->
	<div class="modal fade bd-example-modal-db" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <table class="table" style="text-align: center">
				  <colgroup>
				  	<col width="20%">
				  	<col width="20%">
				  	<col width="20%">
				  	<col width="20%">
				  	<col width="20%">				  				  
				  </colgroup>
				  <thead class="thead-dark">
				    <tr>
				      <th scope="col">DB</th>
				      <th scope="col">①</th>
				      <th scope="col">②</th>
				      <th scope="col">③</th>
				      <th scope="col">④</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">MySQL(MariaDB)</th>			      
				      <td scope="row" colspan="4">
				       <div class="progress">
							   <div class="progress-bar bg-danger" role="progressbar" style="width: 64%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>						     						  
							 </div>
				      </td>
				    </tr>
				    <tr>
				      <th scope="row">Oracle</th>			      
				      <td scope="row" colspan="4">
				      	<div class="progress">
							  	<div class="progress-bar bg-info" role="progressbar" style="width: 64%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>						  	
								</div>
				      </td>
				    </tr>
				    <tr>
				      <th scope="row">MS-SQL</th>			      
				      <td scope="row" colspan="4">
				      	<div class="progress">
							  	<div class="progress-bar bg-warning" role="progressbar" style="width: 14%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
				      </td>
				    </tr>
				    <tr>
				      <th scope="row">PL/SQL</th>			      
				      <td scope="row" colspan="4">
				      	<div class="progress">
							  	<div class="progress-bar bg-success" role="progressbar" style="width: 14%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
				      </td>
				    </tr>
				    <tr>
				    	<td class="table-secondary" colspan="5">- 등급을 나눈 기준 -</td>
				    </tr>
				    <tr>
				      <th scope="row">①</th>			      
				      <td class="text-left" colspan="4">
				      	사용해본 경험이 있지만 문법의 이해도가 부족하다. 검색을 통해 기본적인 쿼리를 만들어낼 수 있는 수준.
				      </td>
				    </tr>
				    <tr>
				      <th scope="row">②</th>			      
				      <td class="text-left" colspan="4">
				      	문법을 이해하고 SQL 기본 및 활용이 가능한 수준.
				      </td>
				    </tr>
				    <tr>
				      <th scope="row">③</th>			      
				      <td class="text-left" colspan="4">
				      	본인이 원하는 결과 값을 도출하기 위한 쿼리 작성이 가능한 수준.
				      </td>
				    </tr>
				    <tr>
				      <th scope="row">④</th>			      
				      <td class="text-left" colspan="4">
				      	속도를 고려한 쿼리 작성과 함수 사용, 쿼리 튜닝이 가능한 수준.
				      </td>
				    </tr>		
				  </tbody>
				</table>			
	    </div>
	  </div>
	</div>
	<!-- WEB -->
	<div class="modal fade bd-example-modal-web" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <table class="table" style="text-align: center">
				  <colgroup>
				  	<col width="20%">
				  	<col width="20%">
				  	<col width="20%">
				  	<col width="20%">
				  	<col width="20%">		  	
				  </colgroup>
				  <thead class="thead-dark">
				    <tr>
				      <th scope="col">WEB</th>
				      <th scope="col">①</th>
				      <th scope="col">②</th>
				      <th scope="col">③</th>
				      <th scope="col">④</th>				     
				    </tr>
				  </thead>
				  <tbody>
				   <tr>
				      <th scope="row">ASP</th>			      
				      <td scope="row" colspan="4">
				      	<div class="progress">
							  	<div class="progress-bar bg-color-blue" role="progressbar" style="width: 38%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
				      </td>
				    </tr>
				    <tr>
				      <th scope="row">JSP</th>			      
				      <td scope="row" colspan="4">
				      	<div class="progress">
							  	<div class="progress-bar bg-danger" role="progressbar" style="width: 64%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
				      </td>
				    </tr>
				    <tr>
				      <th scope="row">JAVA</th>			      
				      <td scope="row" colspan="4">
				       <div class="progress">
							   <div class="progress-bar bg-info" role="progressbar" style="width: 64%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
							 </div>
				      </td>
				    </tr>
				    <tr>
				      <th scope="row">Javascript(+JQuery)</th>			      
				      <td scope="row" colspan="4">
				      	<div class="progress">
							  	<div class="progress-bar bg-warning" role="progressbar" style="width: 38%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
				      </td>
				    </tr>
				    <tr>
				      <th scope="row">CSS</th>			      
				      <td scope="row" colspan="4">
				      	<div class="progress">
							  	<div class="progress-bar bg-success" role="progressbar" style="width: 38%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
				      </td>
				    </tr>
				    <tr>
				    	<td class="table-secondary" colspan="5">- 등급을 나눈 기준 -</td>
				    </tr>
				    <tr>
				      <th scope="row">①</th>			      
				      <td class="text-left" colspan="4">
				      	사용해본 경험이 있지만 문법의 이해도가 부족하다. 검색을 통해 기본적인 코딩이 가능한 수준.
				      </td>
				    </tr>
				    <tr>
				      <th scope="row">②</th>			      
				      <td class="text-left" colspan="4">
				      	문법을 이해하고 필요한 정보를 찾아 개발이 가능한 수준. 
				      </td>
				    </tr>
				    <tr>
				      <th scope="row">③</th>			      
				      <td class="text-left" colspan="4">
				      	오픈소스를 사용해본 경험이 있고 응용하여 개발이 가능한 수준.
				      </td>
				    </tr>
				    <tr>
				      <th scope="row">④</th>			      
				      <td class="text-left" colspan="4">
				      	여러 이슈대응의 경험과 효율적인 아키텍쳐를 그리는 법을 알고 개발을 할 수 있는 수준.
				      </td>
				    </tr>
				  </tbody>
				</table>
	    </div>
	  </div>
	</div>
	<!-- T/F -->
	<div class="modal fade bd-example-modal-tf" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <table class="table" style="text-align: center">
				  <colgroup>
				  	<col width="25%">
				  	<col width="25%">
				  	<col width="25%">
				  	<col width="25%">	  	
				  </colgroup>
				  <thead class="thead-dark">
				    <tr>
				      <th scope="col">Tool/Framework</th>
				      <th scope="col">①</th>
				      <th scope="col">②</th>
				      <th scope="col">③</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">Eclipse</th>			      
				      <td scope="row" colspan="4">
				       <div class="progress">
							   <div class="progress-bar bg-danger" role="progressbar" style="width: 51%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
							 </div>
				      </td>
				    </tr>
				    <tr>
				      <th scope="row">STS(Spring)</th>			      
				      <td scope="row" colspan="4">
				      	<div class="progress">
							  	<div class="progress-bar bg-info" role="progressbar" style="width: 51%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
				      </td>
				    </tr>
				    <tr>
				      <th scope="row">Visual Studio</th>			      
				      <td scope="row" colspan="4">
				      	<div class="progress">
							  	<div class="progress-bar bg-warning" role="progressbar" style="width: 17%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
				      </td>
				    </tr>
				    <tr>
				    	<td class="table-secondary" colspan="5">- 등급을 나눈 기준 -</td>
				    </tr>
				    <tr>
				      <th scope="row">①</th>			      
				      <td class="text-left" colspan="4">
				      	사용해본 경험이 있지만 현재는 검색을 통해 기본적인 사용이 가능한 수준
				      </td>
				    </tr>
				    <tr>
				      <th scope="row">②</th>			      
				      <td class="text-left" colspan="4">
				      	프로젝트를 완료한 경험이 있으며 해당 툴(프레임워크)을 사용하여 개발이 가능한 수준
				      </td>
				    </tr>
				    <tr>
				      <th scope="row">③</th>			      
				      <td class="text-left" colspan="4">
				      	(②와 더불어) 툴(프레임워크)의 원리를 이해하고 기능을 효율적으로 다룰 수 있는 수준
				      </td>
				    </tr>		    
				  </tbody>
				</table>
	    </div>
	  </div>
	</div>
	<!-- ETC -->
	<div class="modal fade bd-example-modal-etc" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <table class="table" style="text-align: center">
				  <colgroup>
				  	<col width="20%">
				  	<col width="20%">
				  	<col width="20%">
				  	<col width="20%">
				  	<col width="20%">		  	
				  </colgroup>
				  <thead class="thead-dark">
				    <tr>
				      <th scope="col" colspan="5">ETC</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">Bootstrap</th>			      
				      <td class="text-left" colspan="4">
						 부트스트랩(v4.3)을 적용한 사이트 개발 경험이 있음
				      </td>
				    </tr>				    
				    <tr>
				      <th scope="row">Git</th>			      
				      <td class="text-left" colspan="4">				      
							  	
				      </td>
				    </tr>
				    <tr>
				      <th scope="row">유니티</th>			      
				      <td class="text-left" colspan="4">
						 유니티 엔진을 사용한 2D게임 개발 경험이 있음
				      </td>
				    </tr>
				    <tr>
				      <th scope="row">아두이노</th>			      
				      <td class="text-left" colspan="4">
						 아두이노를 이용한 작품 개발 경험이 있음
				      </td>
				    </tr>							 
				  </tbody>
				</table>
	    </div>
	  </div>
	</div>
	
	<div class="container_2">
		<div class="row">
			<div class="banner">
				<img src="<%=PATH %>/images/profile.png" style="width: 30px; height: 30px; margin-bottom: 10px"> PROFILE
				<hr style="width: 400px">
			</div>
		</div>
				
		<div class="row" style="height: 100%">
		
			<!-- Grid : 프로필 사진 -->
	    <div class="col-sm-2" style="padding-left: 30px">	          
			<div class="row align-items-center" style="margin: 80% auto">					
				<div class="col">
					<img src="<%=PATH %>/images/myimg.jpg" style="width: 100%; height: 30%; border: 7px solid #1d375d; border-radius: 100%">
					<h3 style="font-weight: bold; margin-top: 20px">
					 자바 / 웹 개발자
					</h3>
				</div>
			</div>		    		    
	    </div>
	    
	    <!-- Grid : 이력, 교육, 자격증 -->
	    <div class="col-sm-10" style="padding-left: 30px">
	    	<div class="row" style="width: 100%; height: 10%">
	    		<div class="col-sm-12" style="text-align: left">
	    			<h3 style="font-weight: bold">이승현</h3>
 	    			<h5 style="border-bottom: 1px solid #1d375d">Lee, Seunghyun</h5> 	    			
	    		</div>
	    	</div>
	    	
	    	<div class="row" style="height: 90%">
 			    <div class="col-sm-8" style="text-align: left; height: 100%">	    	
		    	  <div class="row" style="width: 100%; height: 55%">
		    		  <div class="col-sm-12">
			    		  <h3 style="color: #1d375d; font-weight: bold">EXPERIENCE : </h3>
			    		  <div style="height: 85%; background-color: #efefef; border-radius: 10px">
				    		  <table class="table table-borderless">
							      <colgroup>
							    	  <col width="25%">
							    	  <col width="75%">
							      </colgroup>
							      <!-- (주)유비스 // 이력 추가시에는 아래 tr을 추가 -->
							      <tr>
							        <td class="td_basic2">2018.01 ~ 2019.03</td>
							        <th>
							      	  <blockquote class="blockquote">
							      		  <p class="mb-0">(주)유비스</p>
							      		  <footer class="blockquote-footer">E-HR(인사관리) 담당</footer>
							      	  </blockquote>
							      	  <ul style="list-style-type: square;">
							      		  <li>대덕 E-HR 프로그램(웹) 개발 및 유지보수</li>
							      		  <li>인사, 근태/급여, 복지 등 데이터 운영 및 관리</li>
							      	  </ul>
							        </th>					    
							      </tr>					    					    
								  </table>
							  </div>  
						  </div>
		    	  </div>	    	
		    	  <div class="row" style="width: 100%; height: 35%">
		    		  <div class="col-sm-7">
		    			  <h3 style="color: #1d375d; font-weight: bold">EDUCATION : </h3>
		    			  <table class="table table-borderless" style="height: 85%; background-color: #efefef; border-radius: 10px">
						      <tr>
						        <td class="td_basic">2017.07 ~ 2018.01</td>
						        <th>빅데이터 기반 머신러닝 개발자 과정<br>/ (주)솔데스크</th>					    
						      </tr>
						      <tr>
						        <td class="td_basic">2012.03 ~ 2018.02</td>
						        <th>백석대학교 정보통신학부 졸업</th>					      
						      </tr>
						      <tr>
						        <td class="td_basic">2009.03 ~ 2012.02</td>
						        <th>안산공업고등학교 컴퓨터과 졸업</th>				      
						      </tr>
							  </table>   				    			
		    		  </div> 	    		
		    		  <div class="col-sm-5">
		    			  <h3 style="color: #1d375d; font-weight: bold">LICENSE : </h3>
		    			  <table class="table table-borderless" style="height: 85%; background-color: #efefef; border-radius: 10px">
						      <tr>
						        <td class="td_basic">2019.05</td>
						        <th>SQLD</th>					    
						      </tr>
						      <tr>
						        <td class="td_basic">2018.11</td>
						        <th>정보처리기사</th>					      
						      </tr>
						      <tr>
						        <td class="td_basic">2010.07</td>
						        <th>정보처리기능사</th>				      
						      </tr>
						      <tr>
						        <td class="td_basic">2009.06</td>
						        <th>정보기기운용기능사</th>				      
						      </tr>
						  	</table> 	    			
		    		  </div>
		    	  </div>	    		    	  
		      </div>
		    
		      <!-- Grid : 기술 -->
		      <div class="col-sm-4" style="height: 100%">	          
		        <h3 style="text-align: left; color: #1d375d; font-weight: bold">SKILLS : </h3>	      
		        <div class="row" style="width: 400px; height: 55%; background-color: #efefef; border-radius: 10px">		    
						  <div class="row align-items-center" style="margin: 0px auto">					
							  <button type="button" class="btn btn-outline-warning2" data-toggle="modal" data-target=".bd-example-modal-db">										
							  	DB
							  </button>
							  <button type="button" class="btn btn-outline-warning2" data-toggle="modal" data-target=".bd-example-modal-web">
								  WEB
							  </button>																						
						  </div>
						  <div class="row align-items-center" style="margin: 0px auto; border-top: 1px solid #1d375d">
							  <button type="button" class="btn btn-outline-warning2" data-toggle="modal" data-target=".bd-example-modal-tf">
								  T/F
							  </button>
							  <button type="button" class="btn btn-outline-warning2" data-toggle="modal" data-target=".bd-example-modal-etc">
								  ETC
							  </button>	
						  </div>
				    </div> 
				    
				    <div class="row" style="width: 400px; height: 20%; margin-top: 30px; border-top: 1px solid #c5c5c5; border-bottom: 1px solid #c5c5c5">				    	
				    	<div class="row align-items-center" style="margin: 0px auto">
				    	<button type="button" class="btn btn-outline-warning3" onclick="thumbdown()">
				    	PDF로 보기
				    	</button>
				    	</div>
				    </div> 				    				    
		      </div>
		      
		      			
		    </div>
	    </div>
	  </div>

	</div>
</form>
</body>
</html>