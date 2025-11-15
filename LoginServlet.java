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
import java.sql.ResultSet;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String url="jdbc:mysql://localhost:3306/singedb";
		String username="root";
		String password1="221579";
		
	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection(url,username,password1);
			String query="Select * from signdatabases where email=? and Confirm_password=?";
			PreparedStatement pstm=conn.prepareStatement(query);
			pstm.setString(1,email);
			pstm.setString(2, password);
			ResultSet rs=pstm.executeQuery();
			
			if(rs.next())
			{
			    HttpSession session1=request.getSession();
			    session1.setAttribute("LoginSucessFull","Login Succesfull");
				response.sendRedirect("HomeFile.jsp ");
			}
			else  {
				 HttpSession session = request.getSession();
				 session.setAttribute("loginError", "Invalid email or password.");
	                response.sendRedirect("LoginFile.jsp");
			
			}
			
		}
		catch(Exception e)
		{
			HttpSession session = request.getSession();
			 session.setAttribute("loginError", "Invalid email or password.");
               response.sendRedirect("LoginFile.jsp"); 
		}
	}

}
