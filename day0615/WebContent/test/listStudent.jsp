<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/plain; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
/*
	[{"no":"100","name":"юс","kor":"100","eng":"100","math":"100\"},]
*/
	String str = "[";
	String sql = "SELECT * FROM student";
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.236.209.105:1521:XE", "madang", "madang");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {
			str += "{\"no\":\""+ rs.getInt(1) +"\",\"name\":\""+ rs.getString(2) +"\",\"kor\":\""+ rs.getInt(3) +"\",\"eng\":\""+ rs.getInt(4) +"\",\"math\":\""+ rs.getInt(5) +"\"},";		
		}
		str = str.substring(0, str.length()-1);
	
	} catch(Exception e) {
		System.out.println(e.getMessage());
	}

	str += "]";
%>

<%=str%>