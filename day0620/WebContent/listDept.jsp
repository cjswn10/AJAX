<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/plain; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%

/*
	{"dno":"100", "dname":"100", "dloc":"100"},
*/
	String str = "[";
	try {
		String sql = "SELECT * FROM dept ORDER BY dno";
		Context context = new InitialContext();
		DataSource ds = (DataSource)context.lookup("java:/comp/env/oracle");
		Connection conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {
			str += "{\"dno\":\""+ rs.getInt(1) +"\", \"dname\":\""+ rs.getString(2) +"\", \"dloc\":\""+ rs.getString(3) +"\"},";
			
		}
		
	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
	str = str.substring(0, str.length()-1);
	
	str += "]";
%>
<%=str%>