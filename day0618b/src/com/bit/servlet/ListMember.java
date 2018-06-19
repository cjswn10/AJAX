package com.bit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.db.ConnectionProvider;

/**
 * Servlet implementation class ListMember
 */
@WebServlet("/ListMember")
public class ListMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*
		 * {"id":"123", "name":"юс©╛аж", "age":"20", "addr":"╦а©Ь"},
		 */
		String str = "[";
		String sql ="SELECT * FROM members";
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				str += "{\"id\":\""+ rs.getString(1) +"\", \"name\":\""+ rs.getString(2) +"\", \"age\":\""+ rs.getInt(3) +"\", \"addr\":\""+ rs.getString(4) +"\"},";
			}
			
			ConnectionProvider.close(rs, stmt, conn);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		str = str.substring(0, str.length()-1);
		str += "]";
		
		response.setContentType("text/plain");
		response.setCharacterEncoding("euc-kr");
		PrintWriter out = response.getWriter();
		out.println(str);
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
