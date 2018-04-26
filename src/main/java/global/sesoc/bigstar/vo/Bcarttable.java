package global.sesoc.bigstar.vo;

public class Bcarttable {

	String productcode;
	String customercode;
	String productQty;

	public String getProductQty() {
		return productQty;
	}

	public void setProductQty(String productQty) {
		this.productQty = productQty;
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

	public Bcarttable(String productcode, String customercode, String productQty) {
		super();
		this.productcode = productcode;
		this.customercode = customercode;
		this.productQty = productQty;
	}
	
	@Override
	public String toString() {
		return "Bcarttable [productcode=" + productcode + ", customercode=" + customercode + "]";
	}

}
