package com.bit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.db.ConnectionProvider;

/**
 * Servlet implementation class UpdateMember
 */
@WebServlet("/UpdateMember")
public class UpdateMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cmd = Integer.parseInt(request.getParameter("cmd"));
		int re = -1;
		String str= "";
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		int age = 0;
		if(request.getParameter("age") != null) {
			age = Integer.parseInt(request.getParameter("age"));
		}
		
		switch(cmd) {
		case 1: re = insertMember(id, name, addr, age); break;
		case 2: re = updateMember(id, name, addr, age); break;
		case 3: re = deleteMember(id); break;
		}
		
		
		if(re > 0) {
			str = "{\"result\":\"1\"}";
		} else {
			str = "{\"result\":\"0\"}";
		}
		
		response.setContentType("text/plain");
		response.setCharacterEncoding("euc-kr");
		
		PrintWriter out = response.getWriter();
		out.print(str);
		out.close();
	}

	private int deleteMember(String id) {
		// TODO Auto-generated method stub
		int re = -1;
		String sql = "DELETE FROM members WHERE id=?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			re = pstmt.executeUpdate();
			ConnectionProvider.close(null, pstmt, conn);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return re;
	}

	private int updateMember(String id, String name, String addr, int age) {
		// TODO Auto-generated method stub
		int re = -1;
		
		String sql = "UPDATE members SET name=?, addr=?, age=? WHERE id=?";
		
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, addr);
			pstmt.setInt(3, age);
			pstmt.setString(4, id);
			
			re = pstmt.executeUpdate();
			
			ConnectionProvider.close(null, pstmt, conn);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return re;
	}

	private int insertMember(String id, String name, String addr, int age) {
		// TODO Auto-generated method stub
		int re = -1;
		
		String sql = "INSERT INTO members VALUES(?,?,?,?)";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setInt(3, age);
			pstmt.setString(4, addr);
			
			re = pstmt.executeUpdate();
			
			ConnectionProvider.close(null, pstmt, conn);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return re;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
