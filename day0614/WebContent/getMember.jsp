<%@ page language="java" contentType="text/plain; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	try{
		Thread.sleep(5000);
		
	} catch (Exception e){
		System.out.println(e.getMessage());
	}

	String id = "tiger";
%>
<%=id%>