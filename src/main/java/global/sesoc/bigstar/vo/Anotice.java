package global.sesoc.bigstar.vo;

public class Anotice {
String noticecode;
String ntitle;
String ncontent;
String ndate;
String nimage;
int npopup;
int nhitup;
public Anotice(String noticecode, String ntitle, String ncontent, String ndate, String nimage, int npopup, int nhitup) {
	super();
	this.noticecode = noticecode;
	this.ntitle = ntitle;
	this.ncontent = ncontent;
	this.ndate = ndate;
	this.nimage = nimage;
	this.npopup = npopup;
	this.nhitup = nhitup;
}
public Anotice() {
	super();
}
public String getNoticecode() {
	return noticecode;
}
public void setNoticecode(String noticecode) {
	this.noticecode = noticecode;
}
public String getNtitle() {
	return ntitle;
}
public void setNtitle(String ntitle) {
	this.ntitle = ntitle;
}
public String getNcontent() {
	return ncontent;
}
public void setNcontent(String ncontent) {
	this.ncontent = ncontent;
}
public String getNdate() {
	return ndate;
}
public void setNdate(String ndate) {
	this.ndate = ndate;
}
public String getNimage() {
	return nimage;
}
public void setNimage(String nimage) {
	this.nimage = nimage;
}
public int getNpopup() {
	return npopup;
}
public void setNpopup(int npopup) {
	this.npopup = npopup;
}
public int getNhitup() {
	return nhitup;
}
public void setNhitup(int nhitup) {
	this.nhitup = nhitup;
}
@Override
public String toString() {
	return "Anotice [noticecode=" + noticecode + ", ntitle=" + ntitle + ", ncontent=" + ncontent + ", ndate=" + ndate
			+ ", nimage=" + nimage + ", npopup=" + npopup + ", nhitup=" + nhitup + "]";
}


}
