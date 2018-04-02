package global.sesoc.bigstar.vo;

public class Bnoticetable {

	int orderpaymentstatus;
	String noticetitle;
	String noticecontent;
	String noticedate;
	String neventstart;
	String neventend;
	int nsale;
	String membercode;
	public Bnoticetable(int orderpaymentstatus, String noticetitle, String noticecontent, String noticedate,
			String neventstart, String neventend, int nsale, String membercode) {
		super();
		this.orderpaymentstatus = orderpaymentstatus;
		this.noticetitle = noticetitle;
		this.noticecontent = noticecontent;
		this.noticedate = noticedate;
		this.neventstart = neventstart;
		this.neventend = neventend;
		this.nsale = nsale;
		this.membercode = membercode;
	}
	public Bnoticetable() {
		super();
	}
	public int getOrderpaymentstatus() {
		return orderpaymentstatus;
	}
	public void setOrderpaymentstatus(int orderpaymentstatus) {
		this.orderpaymentstatus = orderpaymentstatus;
	}
	public String getNoticetitle() {
		return noticetitle;
	}
	public void setNoticetitle(String noticetitle) {
		this.noticetitle = noticetitle;
	}
	public String getNoticecontent() {
		return noticecontent;
	}
	public void setNoticecontent(String noticecontent) {
		this.noticecontent = noticecontent;
	}
	public String getNoticedate() {
		return noticedate;
	}
	public void setNoticedate(String noticedate) {
		this.noticedate = noticedate;
	}
	public String getNeventstart() {
		return neventstart;
	}
	public void setNeventstart(String neventstart) {
		this.neventstart = neventstart;
	}
	public String getNeventend() {
		return neventend;
	}
	public void setNeventend(String neventend) {
		this.neventend = neventend;
	}
	public int getNsale() {
		return nsale;
	}
	public void setNsale(int nsale) {
		this.nsale = nsale;
	}
	public String getMembercode() {
		return membercode;
	}
	public void setMembercode(String membercode) {
		this.membercode = membercode;
	}
	@Override
	public String toString() {
		return "Bnoticetable [orderpaymentstatus=" + orderpaymentstatus + ", noticetitle=" + noticetitle
				+ ", noticecontent=" + noticecontent + ", noticedate=" + noticedate + ", neventstart=" + neventstart
				+ ", neventend=" + neventend + ", nsale=" + nsale + ", membercode=" + membercode + "]";
	}
	
	
	

}
