package global.sesoc.bigstar.vo;

public class Aquestion {
	String qtablecode;
	String qcontent;
	String qtitle;
	String qreply;
	String qvisible;
	String qpushdate;
	String qanswerdate;
	String membercode;

	public Aquestion() {
		super();
	}

	public Aquestion(String qtablecode, String qcontent, String qtitle, String qreply, String qvisible,
			String qpushdate, String qanswerdate, String membercode) {
		super();
		this.qtablecode = qtablecode;
		this.qcontent = qcontent;
		this.qtitle = qtitle;
		this.qreply = qreply;
		this.qvisible = qvisible;
		this.qpushdate = qpushdate;
		this.qanswerdate = qanswerdate;
		this.membercode = membercode;
	}

	public String getQtablecode() {
		return qtablecode;
	}

	public void setQtablecode(String qtablecode) {
		this.qtablecode = qtablecode;
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

	public String getQreply() {
		return qreply;
	}

	public void setQreply(String qreply) {
		this.qreply = qreply;
	}

	public String getQvisible() {
		return qvisible;
	}

	public void setQvisible(String qvisible) {
		this.qvisible = qvisible;
	}

	public String getQpushdate() {
		return qpushdate;
	}

	public void setQpushdate(String qpushdate) {
		this.qpushdate = qpushdate;
	}

	public String getQanswerdate() {
		return qanswerdate;
	}

	public void setQanswerdate(String qanswerdate) {
		this.qanswerdate = qanswerdate;
	}

	public String getMembercode() {
		return membercode;
	}

	public void setMembercode(String membercode) {
		this.membercode = membercode;
	}

	@Override
	public String toString() {
		return "Aquestiontable [qtablecode=" + qtablecode + ", qcontent=" + qcontent + ", qtitle=" + qtitle
				+ ", qreply=" + qreply + ", qvisible=" + qvisible + ", qpushdate=" + qpushdate + ", qanswerdate="
				+ qanswerdate + ", membercode=" + membercode + "]";
	}

}
