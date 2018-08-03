package src;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/LoginAction")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Methods m=new Methods();
	ResultSet rs=null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			String dbName=null ;
			String dbPass=null;
			String dbRole=null;
			int room_no=0;
			int tenant_id=0;
			String uname=request.getParameter("username");
			String pass=request.getParameter("password");
			
			rs=m.getLogin_Details(uname, pass);	
			while(rs.next())
			{
				room_no=rs.getInt(1);
				dbRole=rs.getString(2);
				dbName=rs.getString(3);
				dbPass=rs.getString(4);
			}
			
			if(uname.equalsIgnoreCase(dbName)&& pass.equals(dbPass))
			{
				HttpSession session=request.getSession();
				session.setAttribute("username",uname);
				
				if(dbRole.equals("Owner"))
				{
					response.sendRedirect("landingPage.jsp");	
				}
				else 
				{
					tenant_id=m.getTenant_id(room_no);
					session.setAttribute("Room_no", room_no);
					session.setAttribute("Tenant_id", tenant_id);
					response.sendRedirect("TenantProfile.jsp");
				}
				
			}
			else
			{
				response.sendRedirect("index.html");
			}
	
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
