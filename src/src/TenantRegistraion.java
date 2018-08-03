package src;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TenantRegistraion")
public class TenantRegistraion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Methods m=new Methods();
	createPassword cp=new createPassword();
	
	
	int updated_rows1=0;
	int updated_rows2=0;
	int updated_rows3=0;
	
    public TenantRegistraion() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String room_no=request.getParameter("roomno");
		String username=request.getParameter("uname");
		String password=cp.generateRandomPassword();//=request.getParameter("pass");
		int rent=Integer.parseInt(request.getParameter("rent"));
		System.out.println(password);
		String lastname=request.getParameter("lname");
		String email_id=request.getParameter("emailid");
		String contact_no=request.getParameter("contactno");
		System.out.println("at create object");
		
		
		
		sendMail sm = new sendMail();
		
		System.out.println("after create object");
		sm.prepareMail(email_id, username, password);
		
		try 
		{
			updated_rows1=0;
			updated_rows2=0;
			updated_rows3=0;
			if(!room_no.isEmpty()&&!username.isEmpty()&&!password.isEmpty()&& rent!=0 && !lastname.isEmpty() &&!email_id.isEmpty()&&!contact_no.isEmpty())
			{
				updated_rows1=m.into_register(room_no,username, password);
				updated_rows2=m.into_room_details(room_no);
				updated_rows3=m.into_tenant_details(room_no,rent,username,lastname,email_id,contact_no);
			}
			
			if(updated_rows1==0&&updated_rows2==0&&updated_rows3==0)
			{
				response.sendRedirect("ErrorPage.jsp");
			}
			else if(updated_rows1==1 && updated_rows2==1 && updated_rows3==0)
			{
				m.roleback(room_no);
				response.sendRedirect("ErrorPage.jsp");
			}
			else
			{
				response.sendRedirect("TenantRegistration.jsp");
			}
			
		}
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			try 
			{
				m.roleback(room_no);
			} 
			catch (ClassNotFoundException | SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
			response.sendRedirect("ErrorPage.jsp");
		}
	
	}

}
