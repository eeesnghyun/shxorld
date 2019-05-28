<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/ssi.jsp" %>
<%@ page import="org.json.simple.*" %>

<%    
JSONObject json = new JSONObject();
ArrayList<String> msgs = new ArrayList<String>();

int p_no = Integer.parseInt(request.getParameter("p_no"));
String p_show = request.getParameter("p_show");		

int count = projectProc.update_show(p_no, p_show);

if (count == 1) {
  msgs.add("공개 여부가 변경되었습니다.");
} else {
  msgs.add("수정에 실패했습니다."); 
}

json.put("msgs", msgs);
out.println(json);
%>