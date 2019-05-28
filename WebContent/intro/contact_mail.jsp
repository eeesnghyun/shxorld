<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/ssi.jsp" %>
<%@ page import="org.json.simple.*" %>

<%@ page import="web.mail.*"  %>

<%
JSONObject json = new JSONObject();
ArrayList<String> msgs = new ArrayList<String>();

String sender = request.getParameter("sender");
String content = request.getParameter("m_content");
String id = request.getParameter("m_id");

if( sender.equals(null) ) { sender = ""; }
if( content.equals(null) ) { content = ""; }
if( id.equals(null) ) { id = ""; }

if( sender == "" || id == "" ) {
	msgs.add("FAIL :(\nCheck your email");
} else if ( content == "" ) {
	msgs.add("FAIL :(\nCheck ontent");
} else {
	MailSend ms = new MailSend();
	ms.MailSend(sender, content);	
	msgs.add("THANKS :)");
}

json.put("msgs", msgs);
out.println(json);
%>