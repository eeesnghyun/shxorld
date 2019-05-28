<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/ssi.jsp" %>
<%@ page import="org.json.simple.*" %>

<%
GuestVO guestVO = new GuestVO();
JSONObject json = new JSONObject();
ArrayList<String> msgs = new ArrayList<String>();

String g_show = request.getParameter("g_show");
String g_name = request.getParameter("g_name");
String g_content = request.getParameter("g_content");
String g_password = request.getParameter("g_password");
String g_img = request.getParameter("g_img");

if(g_password == null) { g_password = ""; } //비밀번호는 null값이 들어올 수 있음
int count = 0;

guestVO.setG_show(g_show);
guestVO.setG_name(g_name);
guestVO.setG_content(g_content);
guestVO.setG_password(g_password);
guestVO.setG_img(g_img);

count = guestProc.create(guestVO);

if(count == 1){
	msgs.add("글이 등록되었습니다.");
} else {
	msgs.add("글 등록에 실패하였습니다.");
}

json.put("msgs", msgs);
out.println(json);
%>