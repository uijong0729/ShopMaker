package global.sesoc.bigstar.vo;

public class SalesVolumeByName {
	
	String productName;
	int totalSales;

	public SalesVolumeByName(String productName, int totalSales) {
		super();
		this.productName = productName;
		this.totalSales = totalSales;
	}
	
	public SalesVolumeByName() {
		super();
	}
	
	public String getProductName() {
		return productName;
	}
	
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	public int getTotalSales() {
		return totalSales;
	}
	
	public void setTotalSales(int totalSales) {
		this.totalSales = totalSales;
	}

	@Override
	public String toString() {
		return "SalesVolumeByName [productName=" + productName + ", totalSales=" + totalSales + "]";
	}
	
}
