<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
<<<<<<< HEAD
	String viewPage = request.getContextPath();
=======
	String viewPage = request.getContextPath()+"/list.sp";
>>>>>>> refs/heads/master
	response.sendRedirect(viewPage);
%>