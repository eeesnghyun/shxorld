<%@ page contentType="text/html; charset=UTF-8" %>
 
<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page import="java.util.ArrayList" %>

<%@ page import="web.common.DBConnect" %>
<%@ page import="web.common.DBDisconnect" %>
<%@ page import="web.common.Upload"  %>
<%@ page import="web.common.Auth" %>

<%@ page import="web.admin.*" %>
<%@ page import="web.visit.*" %>
<%@ page import="web.guest.*" %>
<%@ page import="web.project.*" %>
<%@ page import="web.project_br.*" %>


<%
request.setCharacterEncoding("utf-8");
%>

<%
AdminProc adminProc = new AdminProc();
GuestProc guestProc = new GuestProc();
VisitProc visitProc = new VisitProc();
ProjectProc projectProc = new ProjectProc();
ProjectBrProc projectbrProc = new ProjectBrProc();

boolean auth = Auth.adminYN(request);

//페이지당 출력할 글 갯수(프로젝트)
int pagePost =  0;
if (request.getParameter("pagePost") == null || request.getParameter("pagePost").equals("undefined")) {
	pagePost = 5;
} else {
	pagePost = Integer.parseInt(request.getParameter("pagePost"));
}

//현재 페이지
int nowPage =  0;
if (request.getParameter("nowPage") == null || request.getParameter("nowPage").equals("undefined")) {
	nowPage = 1; // 현재 페이지 1부터 시작
} else {
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
}

//페이지당 출력할 글 갯수(방명록)
int pagePost2 =  0;
if (request.getParameter("pagePost2") == null || request.getParameter("pagePost2").equals("undefined")) {
	pagePost2 = 15;
} else {
	pagePost2 = Integer.parseInt(request.getParameter("pagePost2"));
}

//현재 페이지
int nowPage2 =  0;
if (request.getParameter("nowPage2") == null || request.getParameter("nowPage2").equals("undefined")) {
	nowPage2 = 1; // 현재 페이지 1부터 시작
} else {
	nowPage2 = Integer.parseInt(request.getParameter("nowPage2"));
}
%>