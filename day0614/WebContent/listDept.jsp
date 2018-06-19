<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/plain; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	/*
		[{"dno":"100", "dname":"영업팀", "dloc":"여의도"}, 
		 {"dno":"200", "dname":"개발1팀", "dloc":"판교"}, ...]
	*/

	String str = "[";
	String sql = "SELECT * FROM dept";
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "madang", "madang");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {
			str += "{\"dno\":\""+rs.getInt(1)+"\", \"dname\":\""+rs.getString(2)+"\", \"dloc\":\""+rs.getString(3)+"\"},";
		}
		
		str = str.substring(0, str.length()-1);
		
	} catch(Exception e) {
		System.out.println(e.getMessage());
	}
	
	str += "]";
%>

<%=str%>