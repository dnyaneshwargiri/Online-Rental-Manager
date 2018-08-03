package src;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

/**
 * Servlet implementation class UpdateMeter
 */
@WebServlet("/Update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Methods m=new Methods();
	
    public Update() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session=request.getSession();
		int Rowid=(int) session.getAttribute("Rowid");
		int tenant_id=0;
		int flag=0;
		int newRent=Integer.parseInt(request.getParameter("rent")) ;
		
		if(newRent<=0)
		{
			response.sendRedirect("ErrorPage.jsp");
		}
		else
		{
			ArrayList<TenantTableData> ttDatalist = new ArrayList<TenantTableData>();
			try 
			{
				ttDatalist=m.Display_All();
				tenant_id=ttDatalist.get(Rowid).getTenant_id();
				flag=m.updateRent(newRent, tenant_id);
				if(flag==0)
				{
					response.sendRedirect("ErrorPage.jsp");
				}
				else
				{
					response.sendRedirect("landingPage.jsp");
				}
			} 
			catch (ClassNotFoundException | SQLException e) 
			{
				e.printStackTrace();
				response.sendRedirect("ErrorPage.jsp");
			}
		}
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session=request.getSession();
		int Rowid=(int) session.getAttribute("Rowid");
		int currentMeterReading=Integer.parseInt(request.getParameter("meter_reading")) ;
		int tenant_id=0;
		int meter_no=0;
		int lastMeterReading=0;
		int units=0;
		int bill_amount=0;
		int flag=0;
		int lastmonth=0;
		ArrayList<TenantTableData> ttDatalist = new ArrayList<TenantTableData>();
		
		try {
			Calendar cal = Calendar.getInstance();
			int curr_month=cal.get(Calendar.MONTH);
			ttDatalist=m.Display_All();
			tenant_id=ttDatalist.get(Rowid).getTenant_id();
			meter_no=ttDatalist.get(Rowid).getMeterNo();
			lastmonth=m.getlastmonth(meter_no);
			
			if(lastmonth==(curr_month+1))
			{
				response.sendRedirect("ErrorPage.jsp");
			}
			else
			{
				lastMeterReading=m.getLastReading( meter_no,lastmonth);

				if(currentMeterReading<lastMeterReading)
				{
					response.sendRedirect("ErrorPage.jsp");
				}
				else
				{
					units=(currentMeterReading-lastMeterReading);
					bill_amount=(units*8);										// Rs.8/Unit
					flag=m.insertMeter_Reading(tenant_id, currentMeterReading, meter_no, units, bill_amount);

					if(flag==0)
					{
						response.sendRedirect("ErrorPage.jsp");
					}else
					{
						response.sendRedirect("landingPage.jsp");
					}
				}	
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("ErrorPage.jsp");
		}
	}

}
