<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	/*
		[{"no":"1000", "item":"°ø1", "price":"1000", "qty":"3", "fname":"ball1.jpg"},
		 {}]
	*/

	String str = "[";
	String sql = "SELECT * FROM goods";
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "madang", "madang");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {
			str += "{\"no\":\""+rs.getInt(1)+"\", \"item\":\""+rs.getString(2)+"\", \"price\":\""+rs.getInt(3)+"\", \"qty\":\""+rs.getInt(4)+"\", \"fname\":\""+rs.getString(5)+"\"},";
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

<%=str%>