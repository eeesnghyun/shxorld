<%@ page contentType="text/plain; charset=UTF-8" %>
<%@ page import="web.guest.*" %>
<%@ page import="org.json.simple.*" %>

<%
GuestProc guestProc = new GuestProc();

int g_no = Integer.parseInt(request.getParameter("g_no"));

GuestVO guestVO = guestProc.read(g_no);
JSONObject json = new JSONObject();

json.put("g_no", guestVO.getG_no());
json.put("g_name", guestVO.getG_name());
json.put("g_ip", guestVO.getG_ip().substring(0,3));
json.put("g_ymd", guestVO.getG_ymd().substring(0,10));
json.put("g_content", guestVO.getG_content());
json.put("g_password", guestVO.getG_password());

out.println(json);
%>