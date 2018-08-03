package src;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

/**
 * Servlet implementation class TenantRemove
 */
@WebServlet("/TenantRemove")
public class TenantRemove extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public TenantRemove() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		ArrayList<TenantTableData> ttDatalist = new ArrayList<TenantTableData>();
		int room_no,tenant_id;
		int flag1=0,flag2=0,flag3=0;
		Methods m=new Methods();
		
		HttpSession session=request.getSession();
		int Rowid=(int) session.getAttribute("Rowid");
		
		try {
			ttDatalist=m.Display_All();
			room_no=ttDatalist.get(Rowid).getRoom_no();
			tenant_id=ttDatalist.get(Rowid).getTenant_id();
			
			flag1=m.removefrom_register(room_no);
			flag2=m.removefrom_roomdetails(room_no);
			flag3=m.removefrom_tenantdetails(tenant_id);
			
			if(flag1==0 && flag2==0 && flag3==0)
			{
				response.sendRedirect("ErrorPage.jsp");
			}
			else
			{
				response.sendRedirect("landingPage.jsp");	
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("ErrorPage.jsp");
		}
		
		
	}

}
