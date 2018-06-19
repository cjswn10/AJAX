<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String str = "[";
String sql ="SELECT * FROM members";
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.236.209.105:1521:XE", "madang", "madang");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()) {
		str += "{\"id\":\""+ rs.getString(1) +"\", \"name\":\""+ rs.getString(2) +"\", \"age\":\""+ rs.getInt(3) +"\", \"addr\":\""+ rs.getString(4) +"\"},";
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