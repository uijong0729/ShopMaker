package global.sesoc.bigstar.vo;

public class Bcarttable {

	@Override
	public String toString() {
		return "Bcarttable [productcode=" + productcode + ", customercode=" + customercode + "]";
	}
	public String getProductcode() {
		return productcode;
	}
	public void setProductcode(String productcode) {
		this.productcode = productcode;
	}
	public String getCustomercode() {
		return customercode;
	}
	public void setCustomercode(String customercode) {
		this.customercode = customercode;
	}
	public Bcarttable() {
		super();
	}
	public Bcarttable(String productcode, String customercode) {
		super();
		this.productcode = productcode;
		this.customercode = customercode;
	}
	String productcode;
	String customercode;
	

}
