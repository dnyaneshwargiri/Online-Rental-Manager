package src;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MakePayment
 */
@WebServlet("/MakePayment")
public class MakePayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Methods m=new Methods();
	
    public MakePayment() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		int Rowid=(int) session.getAttribute("Rowid");
		int tenant_id=0;
	
		ArrayList<TenantTableData> ttDatalist = new ArrayList<TenantTableData>();
		
		int rentAmount=Integer.parseInt(request.getParameter("rentAmount"));
		int currentAmount=0;
		String flag=null;
		try 
		{
			ttDatalist=m.Display_All();
			tenant_id=ttDatalist.get(Rowid).getTenant_id();
			currentAmount= m.getrent(tenant_id);	
			flag=m.is_paid(tenant_id);
			if((rentAmount!=currentAmount) || flag.equals("yes"))
			{
				response.sendRedirect("ErrorPage.jsp");
			}
			else
			{
				m.makePayment(tenant_id, rentAmount);
				response.sendRedirect("landingPage.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
