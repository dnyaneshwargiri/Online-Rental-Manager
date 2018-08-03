package src;

import java.io.IOException;
import java.math.BigInteger;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdateLoginDetails
 */
@WebServlet("/UpdateLoginDetails")
public class UpdateLoginDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       Methods m=new Methods();
    public UpdateLoginDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		int room_no=(int) session.getAttribute("Room_no");
		String password=request.getParameter("password");
		int flag=0;
		try
		{
			flag=m.updatePassword(password, room_no);
			if(flag==0)
			{
				response.sendRedirect("ErrorPage.jsp");
			}
			else
			{
				response.sendRedirect("TenantProfile.jsp");
			}
		} 
		catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session=request.getSession();
		int tenant_id=(int)session.getAttribute("Tenant_id");
		BigInteger contact=(new BigInteger(request.getParameter("contact")));
		System.out.println(contact);
		int flag=0;
		try 
		{
			flag=m.updateContact(contact, tenant_id);
			if(flag==0)
			{
				response.sendRedirect("ErrorPage.jsp");
			}
			else
			{
				response.sendRedirect("TenantProfile.jsp");
			}
		}
		catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private BigInteger BigInteger(String parameter) {
		// TODO Auto-generated method stub
		return null;
	}

}
