<%@ page language="java" contentType="text/plain; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String name = request.getParameter("name");
	int score = Integer.parseInt(request.getParameter("score"));
	
	String str = name + ":";
	
	if(score >= 60) {
		str += "pass";
				
	} else {
		str += "fail";
	}
%>

<%= str %>