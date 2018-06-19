<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	/*
		[{"no":"100", "item":"°ø", "price":"dd", "qty":"10", "fname":"ball1.jpg"},]
	*/
	String sql = "SELECT * FROM goods";
	String str = "[";
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.236.209.105:1521:XE", "madang", "madang");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {
			str += "{\"no\":\""+ rs.getInt(1) +"\", \"item\":\""+ rs.getString(2) +"\", \"price\":\""+ rs.getInt(3) +"\", \"qty\":\""+ rs.getInt(4) +"\", \"fname\":\""+ rs.getString(5) +"\"},";
		}
		str = str.substring(0, str.length()-1);
		
		rs.close();
		stmt.close();
		conn.close();
	} catch(Exception e) {
		System.out.println(e.getMessage());
	}

	str += "]";
%>
<%= str%>