package global.sesoc.bigstar.vo;

public class Atemplate {

	String templatecode;
	int template;
	String header1;
	String footer1;
	String body1;
	String body2;
	String body3;

	public String getTemplatecode() {
		return templatecode;
	}

	public void setTemplatecode(String templatecode) {
		this.templatecode = templatecode;
	}

	public int getTemplate() {
		return template;
	}

	public void setTemplate(int template) {
		this.template = template;
	}

	public String getHeader1() {
		return header1;
	}

	public void setHeader1(String header1) {
		this.header1 = header1;
	}

	public String getFooter1() {
		return footer1;
	}

	public void setFooter1(String footer1) {
		this.footer1 = footer1;
	}

	public String getBody1() {
		return body1;
	}

	public void setBody1(String body1) {
		this.body1 = body1;
	}

	public String getBody2() {
		return body2;
	}

	public void setBody2(String body2) {
		this.body2 = body2;
	}

	public String getBody3() {
		return body3;
	}

	public void setBody3(String body3) {
		this.body3 = body3;
	}

	public Atemplate(String templatecode, int template, String header1, String footer1, String body1, String body2,
			String body3) {
		super();
		this.templatecode = templatecode;
		this.template = template;
		this.header1 = header1;
		this.footer1 = footer1;
		this.body1 = body1;
		this.body2 = body2;
		this.body3 = body3;
	}

	public Atemplate() {
		super();
	}

	@Override
	public String toString() {
		return "Atemplate [templatecode=" + templatecode + ", template=" + template + ", header1=" + header1
				+ ", footer1=" + footer1 + ", body1=" + body1 + ", body2=" + body2 + ", body3=" + body3 + "]";
	}

}
