package global.sesoc.bigstar.vo;

public class SalesVolumeByOrderdate {
	
	public String orderDate;
	public String totalSales;
	
	public SalesVolumeByOrderdate() {
		super();
	}

	public SalesVolumeByOrderdate(String orderDate, String totalSales) {
		super();
		this.orderDate = orderDate;
		this.totalSales = totalSales;
	}
	
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getTotalSales() {
		return totalSales;
	}
	public void setTotalSales(String totalSales) {
		this.totalSales = totalSales;
	}
	@Override
	public String toString() {
		return "getSalesVolumeByOrderdate [orderDate=" + orderDate + ", totalSales=" + totalSales + "]";
	}
	
}
