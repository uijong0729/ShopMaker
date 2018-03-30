package global.sesoc.bigstar.vo;

public class Acomponent {

	String cpcode;
	String cpkind;
	int cpheight;
	int cpwidth;
	String cpoption;
	String cpfontcolor;
	int cpactivation;
	String cpurl;
	String cpbgcolor;
	String cpsrc;
	String cpfontsize;
	String cpiconbgcolor;
	String cpiconshape;
	int cpopacity;
	int cpcol;

	public Acomponent() {
		super();
	}

	public Acomponent(String cpcode, String cpkind, int cpheight, int cpwidth, String cpoption, String cpfontcolor,
			int cpactivation, String cpurl, String cpbgcolor, String cpsrc, String cpfontsize, String cpiconbgcolor,
			String cpiconshape, int cpopacity, int cpcol, int cprow, int cpformat, String cpstartpointx,
			String cpstartpointy, String cpendpointx, String cpendpointy, String templatecode) {
		super();
		this.cpcode = cpcode;
		this.cpkind = cpkind;
		this.cpheight = cpheight;
		this.cpwidth = cpwidth;
		this.cpoption = cpoption;
		this.cpfontcolor = cpfontcolor;
		this.cpactivation = cpactivation;
		this.cpurl = cpurl;
		this.cpbgcolor = cpbgcolor;
		this.cpsrc = cpsrc;
		this.cpfontsize = cpfontsize;
		this.cpiconbgcolor = cpiconbgcolor;
		this.cpiconshape = cpiconshape;
		this.cpopacity = cpopacity;
		this.cpcol = cpcol;
		this.cprow = cprow;
		this.cpformat = cpformat;
		this.cpstartpointx = cpstartpointx;
		this.cpstartpointy = cpstartpointy;
		this.cpendpointx = cpendpointx;
		this.cpendpointy = cpendpointy;
		this.templatecode = templatecode;
	}

	int cprow;
	int cpformat;
	String cpstartpointx;
	String cpstartpointy;
	String cpendpointx;
	String cpendpointy;
	String templatecode;

	public String getCpcode() {
		return cpcode;
	}

	public void setCpcode(String cpcode) {
		this.cpcode = cpcode;
	}

	public String getCpkind() {
		return cpkind;
	}

	public void setCpkind(String cpkind) {
		this.cpkind = cpkind;
	}

	public int getCpheight() {
		return cpheight;
	}

	public void setCpheight(int cpheight) {
		this.cpheight = cpheight;
	}

	public int getCpwidth() {
		return cpwidth;
	}

	public void setCpwidth(int cpwidth) {
		this.cpwidth = cpwidth;
	}

	public String getCpoption() {
		return cpoption;
	}

	public void setCpoption(String cpoption) {
		this.cpoption = cpoption;
	}

	public String getCpfontcolor() {
		return cpfontcolor;
	}

	public void setCpfontcolor(String cpfontcolor) {
		this.cpfontcolor = cpfontcolor;
	}

	public int getCpactivation() {
		return cpactivation;
	}

	public void setCpactivation(int cpactivation) {
		this.cpactivation = cpactivation;
	}

	public String getCpurl() {
		return cpurl;
	}

	public void setCpurl(String cpurl) {
		this.cpurl = cpurl;
	}

	public String getCpbgcolor() {
		return cpbgcolor;
	}

	public void setCpbgcolor(String cpbgcolor) {
		this.cpbgcolor = cpbgcolor;
	}

	public String getCpsrc() {
		return cpsrc;
	}

	public void setCpsrc(String cpsrc) {
		this.cpsrc = cpsrc;
	}

	public String getCpfontsize() {
		return cpfontsize;
	}

	public void setCpfontsize(String cpfontsize) {
		this.cpfontsize = cpfontsize;
	}

	public String getCpiconbgcolor() {
		return cpiconbgcolor;
	}

	public void setCpiconbgcolor(String cpiconbgcolor) {
		this.cpiconbgcolor = cpiconbgcolor;
	}

	public String getCpiconshape() {
		return cpiconshape;
	}

	public void setCpiconshape(String cpiconshape) {
		this.cpiconshape = cpiconshape;
	}

	public int getCpopacity() {
		return cpopacity;
	}

	public void setCpopacity(int cpopacity) {
		this.cpopacity = cpopacity;
	}

	public int getCpcol() {
		return cpcol;
	}

	public void setCpcol(int cpcol) {
		this.cpcol = cpcol;
	}

	public int getCprow() {
		return cprow;
	}

	public void setCprow(int cprow) {
		this.cprow = cprow;
	}

	public int getCpformat() {
		return cpformat;
	}

	public void setCpformat(int cpformat) {
		this.cpformat = cpformat;
	}

	public String getCpstartpointx() {
		return cpstartpointx;
	}

	public void setCpstartpointx(String cpstartpointx) {
		this.cpstartpointx = cpstartpointx;
	}

	public String getCpstartpointy() {
		return cpstartpointy;
	}

	public void setCpstartpointy(String cpstartpointy) {
		this.cpstartpointy = cpstartpointy;
	}

	public String getCpendpointx() {
		return cpendpointx;
	}

	public void setCpendpointx(String cpendpointx) {
		this.cpendpointx = cpendpointx;
	}

	public String getCpendpointy() {
		return cpendpointy;
	}

	public void setCpendpointy(String cpendpointy) {
		this.cpendpointy = cpendpointy;
	}

	public String getTemplatecode() {
		return templatecode;
	}

	public void setTemplatecode(String templatecode) {
		this.templatecode = templatecode;
	}

	@Override
	public String toString() {
		return "Acomponent [cpcode=" + cpcode + ", cpkind=" + cpkind + ", cpheight=" + cpheight + ", cpwidth=" + cpwidth
				+ ", cpoption=" + cpoption + ", cpfontcolor=" + cpfontcolor + ", cpactivation=" + cpactivation
				+ ", cpurl=" + cpurl + ", cpbgcolor=" + cpbgcolor + ", cpsrc=" + cpsrc + ", cpfontsize=" + cpfontsize
				+ ", cpiconbgcolor=" + cpiconbgcolor + ", cpiconshape=" + cpiconshape + ", cpopacity=" + cpopacity
				+ ", cpcol=" + cpcol + ", cprow=" + cprow + ", cpformat=" + cpformat + ", cpstartpointx="
				+ cpstartpointx + ", cpstartpointy=" + cpstartpointy + ", cpendpointx=" + cpendpointx + ", cpendpointy="
				+ cpendpointy + ", templatecode=" + templatecode + "]";
	}

}
