package src;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;

public class Methods 
{
	private  ResultSet rs=null;
	private PreparedStatement ps=null;
	private Connection con=null;
	private Statement st=null;
	private int updated_rows=0;
		
	

	public Connection getcon() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sanket","root","root");
		return con;
	}
	
	public ArrayList<TenantTableData> Display_All() throws ClassNotFoundException, SQLException
	{
		String sql="select td.room_no,td.tenant_id,td.firstname,td.lastname,(select meter_no from room_details rd where td.room_no=rd.room_no) from tenant_details td where is_active='yes'";
		con=getcon();
		st=con.createStatement();
		rs=st.executeQuery(sql);
		ArrayList<TenantTableData> ttDatalist = new ArrayList<TenantTableData>();
		if(null != rs)
		{
			while(rs.next()){
				TenantTableData ttdata= new TenantTableData();
				ttdata.setRoom_no(rs.getInt(1));
				ttdata.setTenant_id(rs.getInt(2));
				ttdata.setFirstname(rs.getString(3));
				ttdata.setLastname(rs.getString(4));
				ttdata.setMeterNo(rs.getInt(5));
				
				ttDatalist.add(ttdata);
			}
		}
		return ttDatalist;
	}
	
	public ResultSet getLogin_Details(String uname, String pass) throws ClassNotFoundException, SQLException
	{
		String sql="select room_no,role,username,password from register where username=? and password=?";
		con=getcon();
		ps=con.prepareStatement(sql);
		ps.setString(1, uname);
		ps.setString(2, pass);
		rs=ps.executeQuery();	
		return rs;
	}
	
	public int getTenant_id(int room_no) throws ClassNotFoundException, SQLException
	{
		int tenant_id=0;
		String getTenantId="select tenant_id from tenant_details where room_no=? and is_active='yes'";
		con=getcon();
		ps=con.prepareStatement(getTenantId);
		ps.setInt(1, room_no);
		rs=ps.executeQuery();
		rs.next();
		tenant_id=rs.getInt(1);
		return tenant_id;
	}
	
	public int into_register(String room_no,String username ,String password ) throws java.lang.Exception
	{
		updated_rows=0;
		String insert="insert into register(room_no,username,password) values(?,?,?)";
		con=getcon();
		ps=con.prepareStatement(insert);
		ps.setString(1,room_no );
		ps.setString(2,username);
		ps.setString(3, password);
		updated_rows=ps.executeUpdate();
		return updated_rows;
	}

	public int into_room_details(String room_no) throws SQLException, ClassNotFoundException
	{
		updated_rows=0;
		String update="update room_details set vacancy='No' where room_no=?";
		con=getcon();
		ps=con.prepareStatement(update);
		ps.setString(1, room_no);
		updated_rows=ps.executeUpdate();
		return updated_rows;
	}
	
	public int into_tenant_details(String room_no,int rent,String username,String lastname ,String email_id ,String contact_no) throws SQLException, ClassNotFoundException
	{
		updated_rows=0;
		String insert1="insert into tenant_details(room_no,firstname,lastname,email_id,contact_no,agreement_date,rent) values(?,?,?,?,?,now(),?)";
		con=getcon();
		ps=con.prepareStatement(insert1);
		ps.setString(1,room_no);
		ps.setString(2, username);
		ps.setString(3, lastname);
		ps.setString(4, email_id);
		ps.setString(5, contact_no);
		ps.setInt(6, rent);
		updated_rows=ps.executeUpdate();
		return updated_rows;
	}
	public void roleback(String room_no) throws ClassNotFoundException, SQLException
	{
		con=getcon();
		
		String delet_register="delete from register where room_no=?";
		ps=con.prepareStatement(delet_register);
		ps.setString(1,room_no);
		ps.executeUpdate();
		
		String update_room="update room_details set vacancy='yes' where room_no=?";
		ps=con.prepareStatement(update_room);
		ps.setString(1, room_no);
		ps.executeUpdate();
		
	}
	
	public String[] getAvailable_rooms() throws ClassNotFoundException, SQLException
	{
		
		String array[]=new String[9];
		int i=0;
		for(i=0;i<9;i++)
		{
			array[i]="";
		}
		i=0;
		String sql="select room_no from room_details where vacancy='yes';";
		con=getcon();
		st=con.createStatement();
		rs=st.executeQuery(sql);
		while(rs.next())
		{
			array[i]= rs.getString(1);
			i++;
		}
		return array;
	}
	
	public int removefrom_register(int room_no) throws ClassNotFoundException, SQLException
	{
		int flag=0;
		String remove_register="delete from register where room_no=?";
		con=getcon();
		ps=con.prepareStatement(remove_register);
		ps.setInt(1,room_no);
		flag=ps.executeUpdate();
		return flag;
	}
	
	public int removefrom_roomdetails(int room_no) throws ClassNotFoundException, SQLException 
	{
		int flag=0;
		String remove_roomdetails="update room_details set vacancy='yes' where room_no=?";
		con=getcon();
		ps=con.prepareStatement(remove_roomdetails);
		ps.setInt(1,room_no);
		flag=ps.executeUpdate();
		return flag;
	}
	
	public int removefrom_tenantdetails(int tenant_id) throws ClassNotFoundException, SQLException 
	{
	int flag=0;
	String remove_tenantdetails="update tenant_details set is_active='No' where tenant_id=?";
	con=getcon();
	ps=con.prepareStatement(remove_tenantdetails);
	ps.setInt(1,tenant_id);
	flag=ps.executeUpdate();
	return flag;
	}
	
	public int getLastReading(int meter_no,int month) throws ClassNotFoundException, SQLException
	{
		int rd=0;
		
		String getLastReord="select reading from meter_details where meter_no=?  and month(rd_date)=?";

		con=getcon();
		ps=con.prepareStatement(getLastReord);
		ps.setInt(1,meter_no);
		ps.setInt(2, month);
		rs=ps.executeQuery();
		rs.next();
		rd=rs.getInt(1);
		return  rd;
	}
	
	public int getlastmonth(int meter_no) throws ClassNotFoundException, SQLException
	{
		int month=0;
		String getLastMonth="select max(month(rd_date)) from meter_details where meter_no=?";

		con=getcon();
		ps=con.prepareStatement(getLastMonth);
		ps.setInt(1,meter_no);
		rs=ps.executeQuery();
		rs.next();
		month=rs.getInt(1);
		
		return month;
	}
	
	public int insertMeter_Reading(int tenant_id,int curr_reading,int meter_no,int units,int bill_amount) throws ClassNotFoundException, SQLException
	{
		String insert="insert into meter_details(meter_no,tenant_id,reading,units,bill_amount) values(?,?,?,?,?)";
		
		con=getcon();
		ps=con.prepareStatement(insert);
		ps.setInt(1, meter_no);
		ps.setInt(2, tenant_id);
		ps.setInt(3, curr_reading);
		ps.setInt(4, units);
		ps.setInt(5, bill_amount);	
		updated_rows=ps.executeUpdate();
		return updated_rows;
	}
	
	public ResultSet getMeter_no() throws ClassNotFoundException, SQLException
	{
	
		String select_meter="select (select meter_no from room_details rd where td.room_no=rd.room_no),rent from tenant_details td where is_active='yes';";
		
		con=getcon();
		st=con.createStatement();
		rs=st.executeQuery(select_meter);	
		return rs;
		
	}
	
	public ResultSet getMeter_bill(int meter_no) throws ClassNotFoundException, SQLException
	{
		String bill_amount=" select tenant_id,bill_amount from meter_details where meter_no=? and  month(rd_date)=month(now())";
		
		con=getcon();
		ps=con.prepareStatement(bill_amount);
		ps.setInt(1, meter_no);
		rs=ps.executeQuery();
		return rs;
	}
	public void insertBlankRecord() throws ClassNotFoundException, SQLException
	{
		int ArrayMeter[]=new int[9];
		int ArrayRent[]=new int[9];
		ResultSet rs1=null;
		int meter_no=0;
		double meter_bill=0.0;
		int rent=0;
		int i=0;
		int tenant_id=0;
		double total_amount=0.0;
		
		String insertRecord=null;
		con=getcon();
		rs=null;
		rs=getMeter_no();
		while(rs.next())
		{
			ArrayMeter[i]=rs.getInt(1);
			ArrayRent[i]=rs.getInt(2);
			i++;
		}
		for(int j=0;j<ArrayMeter.length;j++)
		{
			meter_no=ArrayMeter[j];
			rent=ArrayRent[j];
			rs1=getMeter_bill(meter_no);
			while(rs1.next())
			{
				tenant_id=rs1.getInt(1);
				meter_bill=rs1.getDouble(2);
			}
			total_amount=(meter_bill+rent);
			
			insertRecord="insert into rent_details(tenant_id,meter_bill,rent,total_amount) values(?,?,?,?)";
			ps=con.prepareStatement(insertRecord);
			ps.setInt(1,tenant_id);
			ps.setDouble(2, meter_bill);
			ps.setInt(3, rent);
			ps.setDouble(4, total_amount);
			updated_rows=ps.executeUpdate();
		}

	}
	
	
	public void call()
	{
		Calendar cal = Calendar.getInstance();
		int curr=cal.get(Calendar.DATE);
		if( curr==4)
		{
			System.out.println("Date Matched");	
			try {																//Notice it
				insertBlankRecord();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}
		else 
		{
			System.out.println("Not Matched");
		}
	}
	
	public ResultSet rentDue() throws ClassNotFoundException, SQLException
	{
		String rentdue="select tenant_id,date(date),meter_bill,rent,total_amount from rent_details where is_paid='No' and month(date)=month(now());";
		con=getcon();
		st=con.createStatement();
		rs=st.executeQuery(rentdue);
		return rs;
	}
	
	public int updateRent(int newRent,int tenant_id) throws ClassNotFoundException, SQLException
	{
		String addRent="update tenant_details set rent=? where tenant_id=?";
		con=getcon();
		ps=con.prepareStatement(addRent);
		ps.setInt(1,newRent);
		ps.setInt(2,tenant_id);
		updated_rows=ps.executeUpdate();
		return updated_rows;
	}
	
	public ResultSet insertimg() throws ClassNotFoundException, SQLException
	{
		String ins="select img from picture limit 1";
		con=getcon();
		st=con.createStatement();
		rs=st.executeQuery(ins);
		return rs;
	}
	
	public ResultSet ShowPaymentHistory(int tenant_id) throws SQLException, ClassNotFoundException 
	{    
		  con=getcon();
		 PreparedStatement ps=con.prepareStatement("select payment_id ,amount,date(date) from payment_details where tenant_id=?");
		 ps.setInt(1,tenant_id);
		 rs=ps.executeQuery();
		 return rs;
	}
	
	public ResultSet ShowCurrentRent(int tenant_id) throws ClassNotFoundException, SQLException
	{
		String currentRent="select meter_bill,rent,total_amount,is_paid from rent_details where tenant_id=? and month(date)=month(now())";
		con=getcon();
		ps=con.prepareStatement(currentRent);
		ps.setInt(1,tenant_id );
		rs=ps.executeQuery();
		return rs;
	}
	
	public int getMeterno(int room_no) throws ClassNotFoundException, SQLException
	{
		int meter_no=0;
		String getmeter="select meter_no from room_details where room_no=?";
		con=getcon();
		ps=con.prepareStatement(getmeter);
		ps.setInt(1,room_no);
		rs=ps.executeQuery();
		rs.next();
		meter_no=rs.getInt(1);
		return meter_no;
	}
	
	public ResultSet ShowCurrentMeter(int room_no,int tenant_id) throws ClassNotFoundException, SQLException
	{
		int meter_no=0;
		meter_no=getMeterno(room_no);	
		String CurrentMeter="select date(rd_date),reading,units,bill_amount from meter_details  where meter_no=? and tenant_id=?  and month(rd_date)=month(now())";
		con=getcon();
		ps=con.prepareStatement(CurrentMeter);
		ps.setInt(1,meter_no);
		ps.setInt(2,tenant_id);
		rs=ps.executeQuery();
		
		return rs;
	}
	
	public ResultSet showMeterHistory(int room_no,int tenant_id) throws ClassNotFoundException, SQLException
	{
		int meter_no=0;
		meter_no=getMeterno(room_no);
		String meterHistory="select date(rd_date),reading,units,bill_amount from meter_details where tenant_id=?";
		con=getcon();
		ps=con.prepareStatement(meterHistory);
		ps.setInt(1,tenant_id);
		rs=ps.executeQuery();
		return rs;
	}
	
	public int getrent(int tenant_id) throws ClassNotFoundException, SQLException
	{
		int Rent=0;
		String getRent=" select total_amount from rent_details where month(date)=month(now()) and  tenant_id=?";
		con=getcon();
		ps=con.prepareStatement(getRent);
		ps.setInt(1,tenant_id);
		rs=ps.executeQuery();
		rs.next();
		Rent=(int)rs.getDouble(1);
		return  Rent;
	}
	public String is_paid(int tenant_id) throws ClassNotFoundException, SQLException 
	{
		String flag=null;
		String getflag="select is_paid from rent_details where month(date)=month(now()) and  tenant_id=?";
		con=getcon();
		ps=con.prepareStatement(getflag);
		ps.setInt(1,tenant_id);
		rs=ps.executeQuery();
		rs.next();
		if(rs==null)
		{
			flag="No";
		}
		else
		{
			flag=rs.getString(1);
		}
		return flag;
	}
	
	public int makePayment(int tenant_id,double amount) throws ClassNotFoundException, SQLException
	{
		String payment="insert into payment_details(tenant_id,amount) values(?,?)";
		String updateFlag="update rent_Details set is_paid='yes' where tenant_id=? and month(date)=month(now());";
		con=getcon();
		ps=con.prepareStatement(payment);
		ps.setInt(1, tenant_id);
		ps.setDouble(2,amount);
		updated_rows=ps.executeUpdate();
		
		ps=con.prepareStatement(updateFlag);
		ps.setInt(1,tenant_id);
		ps.executeUpdate();
		
		return updated_rows;
	}
	
	public ResultSet paymentHistory() throws ClassNotFoundException, SQLException 
	{
		 con=getcon();
		 PreparedStatement ps=con.prepareStatement("select payment_id ,tenant_id,amount,date(date) from payment_details where month(date)=month(now());");
		 rs=ps.executeQuery();
		
		return rs;
	}
	
	public int updatePassword(String pass,int room_no) throws ClassNotFoundException, SQLException
	{
		String updateFlag="update register set password=? where room_no=?";
		con=getcon();
		ps=con.prepareStatement(updateFlag);
		ps.setString(1, pass);
		ps.setInt(2, room_no);
		updated_rows=ps.executeUpdate();
		return updated_rows;
	}
	public int updateContact(BigInteger contact,int tenant_id) throws ClassNotFoundException, SQLException
	{
		String updateFlag="update tenant_details set contact_no="+contact+"  where tenant_id=?";
		con=getcon();
		ps=con.prepareStatement(updateFlag);
		ps.setInt(1, tenant_id);
		updated_rows=ps.executeUpdate();
		return updated_rows;
	}
	
	public int getRoomNo(int tenant_id) throws ClassNotFoundException, SQLException
	{
		int room=0;
		String room_no="select room_no from tenant_details where tenant_id=?";
		con=getcon();
		ps=con.prepareStatement(room_no);
		ps.setInt(1,tenant_id);
		rs=ps.executeQuery();
		rs.next();
		room=rs.getInt(1);
		return room;
	}
}