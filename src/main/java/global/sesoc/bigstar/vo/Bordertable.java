package global.sesoc.bigstar.vo;

public class Bordertable {

	String ordercode;
	int orderpaymentstatus;
	String orderdate;
	String orderdepositdate;
	String orderpaydecidedate;
	String orderreturndate;
	String orderdeliverylocation;
	String orderbankaccount;
	String orderdeliverynum;
	int orderquantity;
	String customercode;
	String productcode;
	String membercode;
	
	public Bordertable(String ordercode, int orderpaymentstatus, String orderdate, String orderdepositdate,
			String orderpaydecidedate, String orderreturndate, String orderdeliverylocation, String orderbankaccount,
			String orderdeliverynum, int orderquantity, String customercode, String productcode, String membercode) {
		super();
		this.ordercode = ordercode;
		this.orderpaymentstatus = orderpaymentstatus;
		this.orderdate = orderdate;
		this.orderdepositdate = orderdepositdate;
		this.orderpaydecidedate = orderpaydecidedate;
		this.orderreturndate = orderreturndate;
		this.orderdeliverylocation = orderdeliverylocation;
		this.orderbankaccount = orderbankaccount;
		this.orderdeliverynum = orderdeliverynum;
		this.orderquantity = orderquantity;
		this.customercode = customercode;
		this.productcode = productcode;
		this.membercode = membercode;
	}
	
	public Bordertable() {
		super();
	}
	public String getOrdercode() {
		return ordercode;
	}
	public void setOrdercode(String ordercode) {
		this.ordercode = ordercode;
	}
	public int getOrderpaymentstatus() {
		return orderpaymentstatus;
	}
	public void setOrderpaymentstatus(int orderpaymentstatus) {
		this.orderpaymentstatus = orderpaymentstatus;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String getOrderdepositdate() {
		return orderdepositdate;
	}
	public void setOrderdepositdate(String orderdepositdate) {
		this.orderdepositdate = orderdepositdate;
	}
	public String getOrderpaydecidedate() {
		return orderpaydecidedate;
	}
	public void setOrderpaydecidedate(String orderpaydecidedate) {
		this.orderpaydecidedate = orderpaydecidedate;
	}
	public String getOrderreturndate() {
		return orderreturndate;
	}
	public void setOrderreturndate(String orderreturndate) {
		this.orderreturndate = orderreturndate;
	}
	public String getOrderdeliverylocation() {
		return orderdeliverylocation;
	}
	public void setOrderdeliverylocation(String orderdeliverylocation) {
		this.orderdeliverylocation = orderdeliverylocation;
	}
	public String getOrderbankaccount() {
		return orderbankaccount;
	}
	public void setOrderbankaccount(String orderbankaccount) {
		this.orderbankaccount = orderbankaccount;
	}
	public String getOrderdeliverynum() {
		return orderdeliverynum;
	}
	public void setOrderdeliverynum(String orderdeliverynum) {
		this.orderdeliverynum = orderdeliverynum;
	}
	public int getOrderquantity() {
		return orderquantity;
	}
	public void setOrderquantity(int orderquantity) {
		this.orderquantity = orderquantity;
	}
	public String getCustomercode() {
		return customercode;
	}
	public void setCustomercode(String customercode) {
		this.customercode = customercode;
	}
	public String getProductcode() {
		return productcode;
	}
	public void setProductcode(String productcode) {
		this.productcode = productcode;
	}
	public String getMembercode() {
		return membercode;
	}
	public void setMembercode(String membercode) {
		this.membercode = membercode;
	}
	@Override
	public String toString() {
		return "Bordertable [ordercode=" + ordercode + ", orderpaymentstatus=" + orderpaymentstatus + ", orderdate="
				+ orderdate + ", orderdepositdate=" + orderdepositdate + ", orderpaydecidedate=" + orderpaydecidedate
				+ ", orderreturndate=" + orderreturndate + ", orderdeliverylocation=" + orderdeliverylocation
				+ ", orderbankaccount=" + orderbankaccount + ", orderdeliverynum=" + orderdeliverynum
				+ ", orderquantity=" + orderquantity + ", customercode=" + customercode + ", productcode=" + productcode
				+ ", membercode=" + membercode + "]";
	}

}
