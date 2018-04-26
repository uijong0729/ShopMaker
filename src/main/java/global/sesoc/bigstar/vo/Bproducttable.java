package global.sesoc.bigstar.vo;

import java.util.ArrayList;

public class Bproducttable {

	public Bproducttable(String productcode, String productname, int productprice, int productquantity, int productsize,
			String productcolor, String productspec, String productkind, String membercode) {
		super();
		this.productcode = productcode;
		this.productname = productname;
		this.productprice = productprice;
		this.productquantity = productquantity;
		this.productsize = productsize;
		this.productcolor = productcolor;
		this.productspec = productspec;
		this.productkind = productkind;
		this.membercode = membercode;
	}

	String productcode;
	String productname;
	int productprice;
	int productquantity;
	int productsize;
	String productcolor;
	public Bproducttable(String productcode, String productname, int productprice, int productquantity, int productsize,
			String productcolor, String productspec, String productimage, String productimage1, String productimage2,
			String productimage3, String productimage4, String productimage5, String productpushdate,
			int productdisplay, String productkind, int productsale, String membercode) {
		super();
		this.productcode = productcode;
		this.productname = productname;
		this.productprice = productprice;
		this.productquantity = productquantity;
		this.productsize = productsize;
		this.productcolor = productcolor;
		this.productspec = productspec;
		this.productimage = productimage;
		this.productimage1 = productimage1;
		this.productimage2 = productimage2;
		this.productimage3 = productimage3;
		this.productimage4 = productimage4;
		this.productimage5 = productimage5;
		this.productpushdate = productpushdate;
		this.productdisplay = productdisplay;
		this.productkind = productkind;
		this.productsale = productsale;
		this.membercode = membercode;
	}

	String productspec;
	String productimage;
	String productimage1;
	String productimage2;
	String productimage3;
	String productimage4;
	String productimage5;
	public String getProductimage1() {
		return productimage1;
	}

	public void setProductimage1(String productimage1) {
		this.productimage1 = productimage1;
	}

	public String getProductimage2() {
		return productimage2;
	}

	public void setProductimage2(String productimage2) {
		this.productimage2 = productimage2;
	}

	public String getProductimage3() {
		return productimage3;
	}

	public void setProductimage3(String productimage3) {
		this.productimage3 = productimage3;
	}

	public String getProductimage4() {
		return productimage4;
	}

	public void setProductimage4(String productimage4) {
		this.productimage4 = productimage4;
	}

	public String getProductimage5() {
		return productimage5;
	}

	public void setProductimage5(String productimage5) {
		this.productimage5 = productimage5;
	}

	String productpushdate;
	int productdisplay;
	String productkind;
	int productsale;
	String membercode;

	public String getProductcode() {
		return productcode;
	}

	public void setProductcode(String productcode) {
		this.productcode = productcode;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public int getProductprice() {
		return productprice;
	}

	public void setProductprice(int productprice) {
		this.productprice = productprice;
	}

	public int getProductquantity() {
		return productquantity;
	}

	public void setProductquantity(int productquantity) {
		this.productquantity = productquantity;
	}

	public int getProductsize() {
		return productsize;
	}

	public void setProductsize(int productsize) {
		this.productsize = productsize;
	}

	public String getProductcolor() {
		return productcolor;
	}

	public void setProductcolor(String productcolor) {
		this.productcolor = productcolor;
	}

	public String getProductspec() {
		return productspec;
	}

	public void setProductspec(String productspec) {
		this.productspec = productspec;
	}

	public String getProductimage() {
		return productimage;
	}

	public void setProductimage(String productimage) {
		this.productimage = productimage;
	}

	public String getProductpushdate() {
		return productpushdate;
	}

	public void setProductpushdate(String productpushdate) {
		this.productpushdate = productpushdate;
	}

	public int getProductdisplay() {
		return productdisplay;
	}

	public void setProductdisplay(int productdisplay) {
		this.productdisplay = productdisplay;
	}

	public String getProductkind() {
		return productkind;
	}

	public void setProductkind(String productkind) {
		this.productkind = productkind;
	}

	public int getProductsale() {
		return productsale;
	}

	public void setProductsale(int productsale) {
		this.productsale = productsale;
	}

	public String getMembercode() {
		return membercode;
	}

	public void setMembercode(String membercode) {
		this.membercode = membercode;
	}

	@Override
	public String toString() {
		return "Bproducttable [productcode=" + productcode + ", productname=" + productname + ", productprice="
				+ productprice + ", productquantity=" + productquantity + ", productsize=" + productsize
				+ ", productcolor=" + productcolor + ", productspec=" + productspec + ", productimage=" + productimage
				+ ", productpushdate=" + productpushdate + ", productdisplay=" + productdisplay + ", productkind="
				+ productkind + ", productsale=" + productsale + ", membercode=" + membercode + "]";
	}

	public Bproducttable(String productcode, String productname, int productprice, int productquantity, int productsize,
			String productcolor, String productspec, String productimage, String productpushdate, int productdisplay,
			String productkind, int productsale, String membercode) {
		super();
		this.productcode = productcode;
		this.productname = productname;
		this.productprice = productprice;
		this.productquantity = productquantity;
		this.productsize = productsize;
		this.productcolor = productcolor;
		this.productspec = productspec;
		this.productimage = productimage;
		this.productpushdate = productpushdate;
		this.productdisplay = productdisplay;
		this.productkind = productkind;
		this.productsale = productsale;
		this.membercode = membercode;
	}

	public Bproducttable() {
		super();
	}

	public Bproducttable(String productname, String productimage, String membercode) {
		super();
		this.productname = productname;
		this.productimage = productimage;
		this.membercode = membercode;
	}

}
