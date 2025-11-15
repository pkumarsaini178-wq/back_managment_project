package Managment_bank_transcation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import java.sql.Statement;

/**
 * Servlet implementation class LoginServelet
 */
@WebServlet("/SignServelet")

public class SignServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 boolean check=true;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * 
	 */
	public void CreateTabeandDatabase() {
		
		Connection conn = null;
        Statement stmt = null;
        String url="jdbc:mysql://localhost:3306/";
        String url2="jdbc:mysql://localhost:3306/singedb";
		String usernamemysql="root";
		String passwordmysql="221579";
		String dbname="singedb";
        
        try {
            // Load JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // 1) Create database if not exists
            conn = DriverManager.getConnection(url, usernamemysql, passwordmysql);
            stmt = conn.createStatement();
            String sqlCreateDb = "CREATE DATABASE IF NOT EXISTS " + dbname;
            stmt.execute(sqlCreateDb);
            stmt.close();
            conn.close();

            // 2) Create table if not exists
            conn = DriverManager.getConnection(url2, usernamemysql, passwordmysql);
            stmt = conn.createStatement();
            String sqlCreateTable = "CREATE TABLE IF NOT EXISTS SignDatabases (" +
            	    "Full_Name VARCHAR(30), " +
            	    "email VARCHAR(50) PRIMARY KEY, " +
            	    "User_Name VARCHAR(50), " +
            	    "userpassword VARCHAR(50), " +
            	    "Confirm_password VARCHAR(50)" +
            	    ")";
            stmt.execute(sqlCreateTable);
            stmt.close();
            stmt.close();

        } catch( Exception e) {
            System.out.println(e.getMessage()); 
        }
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		String full_name=request.getParameter("fullname");
		 String email = request.getParameter("email");
		 String username=request.getParameter("username");
	        String userpassword = request.getParameter("password");
	        String confirm_password=request.getParameter("confirm");
	        String url="jdbc:mysql://localhost:3306/singedb";
			String usernamemysql="root";
			String passwordmysql="221579";

	        if (email == null || userpassword == null || full_name==null||username==null||confirm_password==null||email.isEmpty() || userpassword.isEmpty()||full_name.isEmpty()||username.isEmpty()||confirm_password.isEmpty()) {
	            out.println("Username and password must not be empty");
	            return;
	        }

	        // Initialize DB and table once
	        if (check==true) {
	        	CreateTabeandDatabase();
	            check = false;
	        }

	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            conn = DriverManager.getConnection(url,usernamemysql,passwordmysql);

	            String insertSQL = "INSERT INTO SignDatabases(Full_name,email,User_Name, userpassword,Confirm_password) VALUES (?, ?,?,?,?)";
	            pstmt = conn.prepareStatement(insertSQL);
	            pstmt.setString(1, full_name);
	            pstmt.setString(2, email);
	            pstmt.setString(3, username);
	            pstmt.setString(4, userpassword);
	            pstmt.setString(5, confirm_password);
	            int rows = pstmt.executeUpdate();

	            if (rows > 0) {
	                 
	            	try {
	            		String deleteQuery = "DELETE FROM  bankdb .accounts ;";
	            		
	            		pstmt=conn.prepareStatement(deleteQuery);
	            		pstmt.execute();
                    HttpSession session1=request.getSession();
                    session1.setAttribute("SignSuccesfull","Successfull Singup ");
	                response.sendRedirect("HomeFile.jsp");
	            	}
	            	catch(Exception e)
	            	{
	            		System.out.println(e.getMessage());	            	
	            		}
	            } else {
	                out.println("Insert failed");
	            }
	           conn.close();
	           pstmt.close();

	        } catch (Exception  e) {
	           response.sendRedirect("HomeFile.jsp");
	            
	        }  
	    }
}
