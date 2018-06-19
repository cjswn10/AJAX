<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/plain; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String oper = request.getParameter("oper");
	String str = "";

	int bookid = 0;
	if(request.getParameter("bookid") != null){
		bookid = Integer.parseInt(request.getParameter("bookid"));
	}
	
	String bookname = request.getParameter("bookname");
	String publisher = request.getParameter("publisher");
	
	int price = 0;
	if(request.getParameter("price") != null) {
		price = Integer.parseInt(request.getParameter("price"));
	}
	
	if(oper.equals("add")) {
		
		String sql = "INSERT INTO book VALUES(?,?,?,?)";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.236.209.105:1521:XE", "madang", "madang");
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookid);
			pstmt.setString(2, bookname);
			pstmt.setString(3, publisher);
			pstmt.setInt(4, price);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}

	} else if(oper.equals("del")) {
		String sql = "DELETE book WHERE bookid=?";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.236.209.105:1521:XE", "madang", "madang");
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookid);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
	} else if(oper.equals("edit")) {
		String sql = "UPDATE book SET bookname=?, publisher=?, price=? WHERE bookid=?";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.236.209.105:1521:XE", "madang", "madang");
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookname);
			pstmt.setString(2, publisher);
			pstmt.setInt(3, price);
			pstmt.setInt(4, bookid);
			int re = pstmt.executeUpdate();
			
			if(re > 0) {
				str += "{\"result\":\"1\"}";
			} else {
				str += "{\"result\":\"0\"}";
			}
			
			pstmt.close();
			conn.close();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
%>
<%=str%>