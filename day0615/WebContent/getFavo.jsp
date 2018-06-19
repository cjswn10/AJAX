<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/plain; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%

/*
	[{"mno":"1","fmno":"2", "favoId":"ydu"},]
*/
	String str = "[";
	String sql = "SELECT f.mno, f.fmno, m.id FROM favorites f, member m WHERE f.fmno=m.mno";

	try {

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "madang", "madang");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			str += "{\"mno\":\""+ rs.getInt(1) +"\",\"fmno\":\""+ rs.getInt(2) +"\", \"favoId\":\""+ rs.getString(3) +"\"},";
		}
		
		str = str.substring(0,str.length()-1);
		
		
	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
	str += "]";
%>
<%=str%>