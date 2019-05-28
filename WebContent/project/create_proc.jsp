<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/ssi.jsp" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<script type="text/javascript">
function set_message(msg){
	if(msg == "S"){
		alert("게시글이 등록되었습니다.");
		parent.document.location.href="./list.jsp";	
	} else {
		alert("게시글 등록에 실패했습니다.");
		parent.document.location.reload();
	}	
}
</script>

<%    
String upDir = application.getRealPath("/project/storage");
String tempDir = application.getRealPath("/project/temp");

// request: 내부 객체
// -1: 메모리에 저장할 최대 크기, Byte, 무제한 사용
// -1: 업로드할 최대 파일 크기, Byte, 무제한 사용
// tempDir: 파일 업로드중에 임시로 저장할 폴더
Upload upload = new Upload(request, -1, -1, tempDir);	  
FileItem fileItem = upload.getFileItem("p_img");	  

String filename = "";
long filesize = fileItem.getSize();	 

if(filesize > 0){
	if(filesize <= 10485760) {    		
		filename = upload.saveFile(fileItem, upDir);    	
	} else { 
%>	  
		<script>set_message("F");</script>		
<%
	}
}

String p_type = upload.toKor(upload.getParameter("p_type"));
String p_title = upload.toKor(upload.getParameter("p_title"));
String p_content = upload.toKor(upload.getParameter("p_content"));				
String p_git = upload.toKor(upload.getParameter("p_git"));
String p_show = upload.toKor(upload.getParameter("p_show"));		

ProjectVO projectVO = new ProjectVO();
projectVO.setP_type(p_type);
projectVO.setP_title(p_title);
projectVO.setP_content(p_content);
projectVO.setP_git(p_git);
projectVO.setP_show(p_show);
projectVO.setP_img(filename);

int count = projectProc.create(projectVO);

if(count == 1){
%>
	<script>set_message("S");</script>	
<%	
} else {
%>	
	<script>set_message("F");</script>			
<%    
}
%>