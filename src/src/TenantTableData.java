package src;

public class TenantTableData {
private int tenant_id;
private int room_no;
private String firstname;
private String lastname;
private int meterNo;

public int getTenant_id() {
	return tenant_id;
}
public void setTenant_id(int tenant_id) {
	this.tenant_id = tenant_id;
}
public int getRoom_no() {
	return room_no;
}
public void setRoom_no(int room_no) {
	this.room_no = room_no;
}
public String getFirstname() {
	return firstname;
}
public void setFirstname(String firstname) {
	this.firstname = firstname;
}
public String getLastname() {
	return lastname;
}
public void setLastname(String lastname) {
	this.lastname = lastname;
}
public int getMeterNo() {
	return meterNo;
}
public void setMeterNo(int meterNo) {
	this.meterNo = meterNo;
}

}
