package global.sesoc.bigstar.vo;

public class Bcustomer {

	String customercode;
	String customerid;
	String customerpw;
	String customeraddress;
	String customerhp;
	String customername;
	String membercode;
	String bpushdate;
	
	public Bcustomer(String customercode, String customerid, String customerpw, String customeraddress,
			String customerhp, String customername, String membercode) {
		super();
		this.customercode = customercode;
		this.customerid = customerid;
		this.customerpw = customerpw;
		this.customeraddress = customeraddress;
		this.customerhp = customerhp;
		this.customername = customername;
		this.membercode = membercode;
	}
	public Bcustomer() {
		super();
	}
	public String getCustomercode() {
		return customercode;
	}
	public void setCustomercode(String customercode) {
		this.customercode = customercode;
	}
	public String getCustomerid() {
		return customerid;
	}
	public void setCustomerid(String customerid) {
		this.customerid = customerid;
	}
	public String getCustomerpw() {
		return customerpw;
	}
	public void setCustomerpw(String customerpw) {
		this.customerpw = customerpw;
	}
	public String getCustomeraddress() {
		return customeraddress;
	}
	public void setCustomeraddress(String customeraddress) {
		this.customeraddress = customeraddress;
	}
	public String getCustomerhp() {
		return customerhp;
	}
	public void setCustomerhp(String customerhp) {
		this.customerhp = customerhp;
	}
	public String getCustomername() {
		return customername;
	}
	public void setCustomername(String customername) {
		this.customername = customername;
	}
	public String getMembercode() {
		return membercode;
	}
	public void setMembercode(String membercode) {
		this.membercode = membercode;
	}
	public String getBpushdate() {
		return bpushdate;
	}
	public void setBpushdate(String bpushdate) {
		this.bpushdate = bpushdate;
	}
	
	@Override
	public String toString() {
		return "Bcustomer [customercode=" + customercode + ", customerid=" + customerid + ", customerpw=" + customerpw
				+ ", customeraddress=" + customeraddress + ", customerhp=" + customerhp + ", customername="
				+ customername + ", membercode=" + membercode + "]";
	}

	

}
