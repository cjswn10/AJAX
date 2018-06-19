<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/plain; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
int age = Integer.parseInt(request.getParameter("age"));
String addr = request.getParameter("addr");


String sql = "INSERT INTO members VALUES(?,?,?,?)";
String str = "";

try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.236.209.105:1521:XE", "madang", "madang");
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.setInt(3, age);
	pstmt.setString(4, addr);
	
	int re = pstmt.executeUpdate();
	if(re > 0)
	{
		str = "{\"result\":\"1\"}";
	}
	else
	{
		str = "{\"result\":\"0\"}";
	}
	
	pstmt.close();
	conn.close();
	
} catch (Exception e) {
	System.out.println(e.getMessage());
}


%>
<%= str %>