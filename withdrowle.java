package Managment_bank_transcation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class withdrowle
 */
@WebServlet("/withdrowle")
public class withdrowle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public withdrowle() {
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
		
		String acc_no=request.getParameter("account_no");
		String name=request.getParameter("name");
		String withdrowle=request.getParameter("withdrowle_amount");
		
		String url="jdbc:mysql://localhost:3306/bankdb";
		String username="root";
		String password="221579";
		try {
			double accno=Double.parseDouble(acc_no);
			double withdrowl=Double.parseDouble(withdrowle);
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection(url,username,password);
			String query= "UPDATE accounts SET deposit_amount =deposit_amount - ? WHERE account_no = ? and name=?";
			PreparedStatement pstm=conn.prepareStatement(query);
			pstm.setDouble(1,withdrowl);
			pstm.setDouble(2, accno);
			pstm.setString(3, name);
			int rs=pstm.executeUpdate();
			if(rs>0)
			{
				response.sendRedirect("HomeFile.jsp");
			}
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}

}
