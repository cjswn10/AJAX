package com.bit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.db.ConnectionProvider;

/**
 * Servlet implementation class UpdateDept
 */
@WebServlet("/UpdateDept")
public class UpdateDept extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDept() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		int cmd = Integer.parseInt(request.getParameter("cmd"));
		int re = 0;
		String str="";
		
		int dno = 0;

		if(request.getParameter("dno") != null) {
			dno = Integer.parseInt(request.getParameter("dno"));
		}
		String dname = request.getParameter("dname");
		String dloc = request.getParameter("dloc");
		
		switch(cmd) {
		case 1: re = insertDept(dno, dname, dloc);break;
		case 2: 
			/*
			int dno = Integer.parseInt(request.getParameter("dno"));
			String dname = request.getParameter("dname");
			String dloc = request.getParameter("dloc");
			*/
			re = updateDept(dno, dname, dloc);break;
		case 3: re = deleteDept(dno);break;
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

	private int deleteDept(int dno) {
		// TODO Auto-generated method stub
		int re = -1;
		String sql = "DELETE FROM dept WHERE dno=?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dno);
			re = pstmt.executeUpdate();
			
			ConnectionProvider.close(null, pstmt, conn);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return re;
	}

	private int updateDept(int dno, String dname, String dloc) {
		// TODO Auto-generated method stub
		
		String sql = "UPDATE dept SET dname=?, dloc=? WHERE dno=?";
		int re = -1;
		
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dname);
			pstmt.setString(2, dloc);
			pstmt.setInt(3, dno);
			
			re = pstmt.executeUpdate();
			
			ConnectionProvider.close(null, pstmt, conn);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return re;
	}

	private int insertDept(int dno, String dname, String dloc) {
		// TODO Auto-generated method stub
		int re = -1;
		
		String sql = "INSERT INTO dept VALUES(?,?,?)";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dno);
			pstmt.setString(2, dname);
			pstmt.setString(3, dloc);
			
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
