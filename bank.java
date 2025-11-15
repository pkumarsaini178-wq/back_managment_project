package Managment_bank_transcation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class bank
 */
@WebServlet("/bank")
public class bank extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public bank() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            String address = request.getParameter("address");
            String pincode = request.getParameter("pincode");
            String aadhaar = request.getParameter("aadhaar");
            String pan = request.getParameter("pan");
            String depositStr = request.getParameter("Diposit_Amount");

            BigDecimal deposit = new BigDecimal(depositStr);

            
            if (deposit.compareTo(new BigDecimal("800")) < 0) {
            	
                
            	request.setAttribute("error", "Deposit must be greater than 800");
            	request.getRequestDispatcher("HomeFile.jsp").forward(request, response);

            	
            }

            
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankdb", "root", "221579");

            
            String sql = "INSERT INTO accounts (name, email, mobile, address, pincode, aadhaar, pan, deposit_amount) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, mobile);
            ps.setString(4, address);
            ps.setString(5, pincode);
            ps.setString(6, aadhaar);
            ps.setString(7, pan);
            ps.setBigDecimal(8, deposit);

            int result = ps.executeUpdate();

            if (result > 0) {
                out.println("<h3 style='color:green;'>Account created successfully!</h3>");
                
                response.sendRedirect("HomeFile.jsp");
            } //else {
                //out.println("<h3 style='color:red;'>Failed to create account. Please try again.</h3>");
            //}

            ps.close();
            conn.close();

        } catch (Exception e) {
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
}
