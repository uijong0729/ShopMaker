package global.sesoc.bigstar.vo;

public class Amember {
String membercode;
String id;
String name;
String pw;
String hpnumber;
String biznumber;
String address;
String mailaddress;
String registrationdate;
String lastpaymentdate;
String paymentexpirationdate;
String templatecode;
public Amember() {
	super();
}
@Override
public String toString() {
	return "Amember [membercode=" + membercode + ", id=" + id + ", name=" + name + ", pw=" + pw + ", hpnumber="
			+ hpnumber + ", biznumber=" + biznumber + ", address=" + address + ", mailaddress=" + mailaddress
			+ ", registrationdate=" + registrationdate + ", lastpaymentdate=" + lastpaymentdate
			+ ", paymentexpirationdate=" + paymentexpirationdate + ", templatecode=" + templatecode + "]";
}
public String getMembercode() {
	return membercode;
}
public void setMembercode(String membercode) {
	this.membercode = membercode;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getPw() {
	return pw;
}
public void setPw(String pw) {
	this.pw = pw;
}
public String getHpnumber() {
	return hpnumber;
}
public void setHpnumber(String hpnumber) {
	this.hpnumber = hpnumber;
}
public String getBiznumber() {
	return biznumber;
}
public void setBiznumber(String biznumber) {
	this.biznumber = biznumber;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getMailaddress() {
	return mailaddress;
}
public void setMailaddress(String mailaddress) {
	this.mailaddress = mailaddress;
}
public String getRegistrationdate() {
	return registrationdate;
}
public void setRegistrationdate(String registrationdate) {
	this.registrationdate = registrationdate;
}
public String getLastpaymentdate() {
	return lastpaymentdate;
}
public void setLastpaymentdate(String lastpaymentdate) {
	this.lastpaymentdate = lastpaymentdate;
}
public String getPaymentexpirationdate() {
	return paymentexpirationdate;
}
public void setPaymentexpirationdate(String paymentexpirationdate) {
	this.paymentexpirationdate = paymentexpirationdate;
}
public String getTemplatecode() {
	return templatecode;
}
public void setTemplatecode(String templatecode) {
	this.templatecode = templatecode;
}
public Amember(String membercode, String id, String name, String pw, String hpnumber, String biznumber, String address,
		String mailaddress, String registrationdate, String lastpaymentdate, String paymentexpirationdate,
		String templatecode) {
	super();
	this.membercode = membercode;
	this.id = id;
	this.name = name;
	this.pw = pw;
	this.hpnumber = hpnumber;
	this.biznumber = biznumber;
	this.address = address;
	this.mailaddress = mailaddress;
	this.registrationdate = registrationdate;
	this.lastpaymentdate = lastpaymentdate;
	this.paymentexpirationdate = paymentexpirationdate;
	this.templatecode = templatecode;
}
}
