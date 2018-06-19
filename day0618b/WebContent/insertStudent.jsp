<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	String name = request.getParameter("name");	
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int math = Integer.parseInt(request.getParameter("math"));

	System.out.println("no:"+no);
	System.out.println("name:"+name);
	System.out.println("kor:"+kor);
	System.out.println("eng:"+eng);
	System.out.println("math:"+math);
%>
OK