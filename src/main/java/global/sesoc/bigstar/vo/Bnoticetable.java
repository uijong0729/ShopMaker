package global.sesoc.bigstar.vo;

public class Bnoticetable {

	String noticecode;
	String noticetitle;
	String noticecontent;
	String noticedate;
	String neventstart;
	String neventend;
	int nsale;
	String membercode;
	public String getNoticecode() {
		return noticecode;
	}
	public void setNoticecode(String noticecode) {
		this.noticecode = noticecode;
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
	public Bnoticetable(String noticecode, String noticetitle, String noticecontent, String noticedate,
			String neventstart, String neventend, int nsale, String membercode) {
		super();
		this.noticecode = noticecode;
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
	@Override
	public String toString() {
		return "Bnoticetable [noticecode=" + noticecode + ", noticetitle=" + noticetitle + ", noticecontent="
				+ noticecontent + ", noticedate=" + noticedate + ", neventstart=" + neventstart + ", neventend="
				+ neventend + ", nsale=" + nsale + ", membercode=" + membercode + "]";
	}
	
	
	

}
