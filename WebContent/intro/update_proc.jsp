<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/ssi.jsp" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<script type="text/javascript">
function set_message(msg){
	if(msg == "S"){
		alert("게시글이 수정되었습니다.");
		parent.document.location.href="./main";	
	} else {
		alert("게시글 수정에 실패했습니다.");
		parent.document.location.reload();
	}	
}
</script>

<%    
String upDir = application.getRealPath("/intro/storage");
String tempDir = application.getRealPath("/intro/temp");

// request: 내부 객체
// -1: 메모리에 저장할 최대 크기, Byte, 무제한 사용
// -1: 업로드할 최대 파일 크기, Byte, 무제한 사용
// tempDir: 파일 업로드중에 임시로 저장할 폴더
Upload upload = new Upload(request, -1, -1, tempDir);	  
FileItem fileItem = upload.getFileItem("pb_img");	  

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
} else {	//파일이 없는 경우 기존 파일 사용
	filename = upload.toKor(upload.getParameter("before_img"));
}

int pb_no = Integer.parseInt(upload.toKor(upload.getParameter("pb_no")));
String pb_title = upload.toKor(upload.getParameter("pb_title"));
String pb_content = upload.toKor(upload.getParameter("pb_content"));				
String pb_tool = upload.toKor(upload.getParameter("pb_tool"));
String pb_os = upload.toKor(upload.getParameter("pb_os"));		
String pb_server = upload.toKor(upload.getParameter("pb_server"));
String pb_db = upload.toKor(upload.getParameter("pb_db"));
String pb_skill = upload.toKor(upload.getParameter("pb_skill"));

ProjectBrVO projectbrVO = new ProjectBrVO();
projectbrVO.setPb_no(pb_no);
projectbrVO.setPb_title(pb_title);
projectbrVO.setPb_content(pb_content);
projectbrVO.setPb_tool(pb_tool);
projectbrVO.setPb_os(pb_os);
projectbrVO.setPb_server(pb_server);
projectbrVO.setPb_db(pb_db);
projectbrVO.setPb_skill(pb_skill);
projectbrVO.setPb_img(filename);

int count = projectbrProc.update(projectbrVO);

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