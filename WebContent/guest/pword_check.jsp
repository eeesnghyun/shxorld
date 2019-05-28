<%@ page contentType="text/plain; charset=UTF-8" %>
<%@ page import="web.guest.*" %>
<%@ page import="org.json.simple.*" %>

<%
GuestProc guestProc = new GuestProc();
int g_no = Integer.parseInt(request.getParameter("g_no"));
String i_pw = request.getParameter("i_pw");

int count = guestProc.pwordCheck(g_no, i_pw);
JSONObject json = new JSONObject();

json.put("cnt", count);

out.println(json);
%>