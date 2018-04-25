package global.sesoc.bigstar.vo;

public class Avip {
	String customerCode;
	int countCustomer;
	
	public Avip() {
		// TODO Auto-generated constructor stub
	}
	
	
	public String getCustomerCode() {
		return customerCode;
	}
	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}
	public int getCountCustomer() {
		return countCustomer;
	}
	public void setCountCustomer(int countCustomer) {
		this.countCustomer = countCustomer;
	}


	@Override
	public String toString() {
		return "Avip [customerCode=" + customerCode + ", countCustomer=" + countCustomer + "]";
	}
	
	
}
