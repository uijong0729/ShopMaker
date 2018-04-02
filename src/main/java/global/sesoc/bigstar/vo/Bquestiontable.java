package global.sesoc.bigstar.vo;

public class Bquestiontable {

String qtablecode;
String qmemberid;
String qpushdate;
String qcontent;
String qtitle;
String qimage;
String qreply;
String qanswerdate;
int qemailreturn;
String membercode;
public Bquestiontable(String qtablecode, String qmemberid, String qpushdate, String qcontent, String qtitle,
		String qimage, String qreply, String qanswerdate, int qemailreturn, String membercode) {
	super();
	this.qtablecode = qtablecode;
	this.qmemberid = qmemberid;
	this.qpushdate = qpushdate;
	this.qcontent = qcontent;
	this.qtitle = qtitle;
	this.qimage = qimage;
	this.qreply = qreply;
	this.qanswerdate = qanswerdate;
	this.qemailreturn = qemailreturn;
	this.membercode = membercode;
}
public Bquestiontable() {
	super();
}
public String getQtablecode() {
	return qtablecode;
}
public void setQtablecode(String qtablecode) {
	this.qtablecode = qtablecode;
}
public String getQmemberid() {
	return qmemberid;
}
public void setQmemberid(String qmemberid) {
	this.qmemberid = qmemberid;
}
public String getQpushdate() {
	return qpushdate;
}
public void setQpushdate(String qpushdate) {
	this.qpushdate = qpushdate;
}
public String getQcontent() {
	return qcontent;
}
public void setQcontent(String qcontent) {
	this.qcontent = qcontent;
}
public String getQtitle() {
	return qtitle;
}
public void setQtitle(String qtitle) {
	this.qtitle = qtitle;
}
public String getQimage() {
	return qimage;
}
public void setQimage(String qimage) {
	this.qimage = qimage;
}
public String getQreply() {
	return qreply;
}
public void setQreply(String qreply) {
	this.qreply = qreply;
}
public String getQanswerdate() {
	return qanswerdate;
}
public void setQanswerdate(String qanswerdate) {
	this.qanswerdate = qanswerdate;
}
public int getQemailreturn() {
	return qemailreturn;
}
public void setQemailreturn(int qemailreturn) {
	this.qemailreturn = qemailreturn;
}
public String getMembercode() {
	return membercode;
}
public void setMembercode(String membercode) {
	this.membercode = membercode;
}
@Override
public String toString() {
	return "Bquestiontable [qtablecode=" + qtablecode + ", qmemberid=" + qmemberid + ", qpushdate=" + qpushdate
			+ ", qcontent=" + qcontent + ", qtitle=" + qtitle + ", qimage=" + qimage + ", qreply=" + qreply
			+ ", qanswerdate=" + qanswerdate + ", qemailreturn=" + qemailreturn + ", membercode=" + membercode + "]";
}
	

}
