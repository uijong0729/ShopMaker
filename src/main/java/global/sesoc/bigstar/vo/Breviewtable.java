package global.sesoc.bigstar.vo;

public class Breviewtable {

String reviewcode;
String reviewtitle;
String reviewdate;
int reviewscore;
String reviewcontent;
String reviewimage;
String productcode;
String customercode;
String membercode;
public Breviewtable(String reviewcode, String reviewtitle, String reviewdate, int reviewscore, String reviewcontent,
		String reviewimage, String productcode, String customercode, String membercode) {
	super();
	this.reviewcode = reviewcode;
	this.reviewtitle = reviewtitle;
	this.reviewdate = reviewdate;
	this.reviewscore = reviewscore;
	this.reviewcontent = reviewcontent;
	this.reviewimage = reviewimage;
	this.productcode = productcode;
	this.customercode = customercode;
	this.membercode = membercode;
}
public Breviewtable() {
	super();
}
@Override
public String toString() {
	return "Breviewtable [reviewcode=" + reviewcode + ", reviewtitle=" + reviewtitle + ", reviewdate=" + reviewdate
			+ ", reviewscore=" + reviewscore + ", reviewcontent=" + reviewcontent + ", reviewimage=" + reviewimage
			+ ", productcode=" + productcode + ", customercode=" + customercode + ", membercode=" + membercode + "]";
}
public String getReviewcode() {
	return reviewcode;
}
public void setReviewcode(String reviewcode) {
	this.reviewcode = reviewcode;
}
public String getReviewtitle() {
	return reviewtitle;
}
public void setReviewtitle(String reviewtitle) {
	this.reviewtitle = reviewtitle;
}
public String getReviewdate() {
	return reviewdate;
}
public void setReviewdate(String reviewdate) {
	this.reviewdate = reviewdate;
}
public int getReviewscore() {
	return reviewscore;
}
public void setReviewscore(int reviewscore) {
	this.reviewscore = reviewscore;
}
public String getReviewcontent() {
	return reviewcontent;
}
public void setReviewcontent(String reviewcontent) {
	this.reviewcontent = reviewcontent;
}
public String getReviewimage() {
	return reviewimage;
}
public void setReviewimage(String reviewimage) {
	this.reviewimage = reviewimage;
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
public String getMembercode() {
	return membercode;
}
public void setMembercode(String membercode) {
	this.membercode = membercode;
}



}
