<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // Clear user session safely
    if(session != null){
        session.removeAttribute("user");
        session.invalidate();
    }

    // Redirect to login page
    response.sendRedirect("login.jsp");
%>