package global.sesoc.bigstar.vo;

public class SalesVolumeByName {
	
	public String productName;
	public int totalSales;

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
	
}
