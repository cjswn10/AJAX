<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/xml; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String str = "<rows>";
	str += "<page>1</page>";
	str += "<total>2</total>";
	str += "<records>11</records>";
	
	String sql = "SELECT * FROM book";
	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.236.209.105:1521:XE", "madang", "madang");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			str += "<row>";
			str += "<cell>" + rs.getInt(1) + "</cell>";
			str += "<cell>" + rs.getString(2) + "</cell>";
			str += "<cell>" + rs.getString(3) + "</cell>";
			str += "<cell>" + rs.getInt(4) + "</cell>";
			str += "</row>";
		}
		
	}catch (Exception e) {
		System.out.println(e.getMessage());
	}
	
	str += "</rows>";
%>
<%=str%>