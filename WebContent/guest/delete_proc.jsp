<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/ssi.jsp" %>
<%@ page import="org.json.simple.*" %>

<%
GuestVO guestVO = new GuestVO();
JSONObject json = new JSONObject();
ArrayList<String> msgs = new ArrayList<String>();

int g_no = Integer.parseInt(request.getParameter("g_no"));

int count = 0;

count = guestProc.delete(g_no);

if(count == 1){
	msgs.add("글이 삭제되었습니다.");
} else {
	msgs.add("글 삭제에 실패하였습니다.");
}

json.put("msgs", msgs);
out.println(json);
%>