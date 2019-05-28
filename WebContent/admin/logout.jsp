<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/ssi.jsp"%>
<%@ include file="/common/resource.jsp"%>

<%
 session.invalidate();
 //request.getSession().removeAttribute("szhyun2002");
 response.sendRedirect(PATH + "/guest/board");
%>
