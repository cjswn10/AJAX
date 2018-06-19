<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/plain; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
/*
	{"no":"1", "event_name":"1", "event_date":"1"},	
*/
String str = "[";
String sql = "SELECT * FROM schedule";

try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.236.209.105:1521:XE", "madang", "madang");
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()) {
		str += "{\"no\":\""+ rs.getInt(1) + "\", \"event_name\":\"" + rs.getString(2) + "\", \"event_date\":\"" + rs.getString(3) + "\"},";
		System.out.println(rs.getInt(1));
	}
	
	rs.close();
	stmt.close();
	conn.close();
	
} catch (Exception e) {
	System.out.println(e.getMessage());
}
str = str.substring(0, str.length()-1);
str += "]";
%>

<%=str%>
