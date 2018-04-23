package global.sesoc.bigstar.Atemplatecontroller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.bigstar.dao.AtemplateDAO;
import global.sesoc.bigstar.vo.Amember;
import global.sesoc.bigstar.vo.Atemplate;

@Controller
public class AtemplateController {
	
	@Autowired
	AtemplateDAO adao;
	@RequestMapping(value = "savepage", method=RequestMethod.POST)
	public String pagesave(HttpServletResponse response, String savepage, String pagename, Model model, HttpSession hs) {
		response.setHeader("X-XSS-Protection", "0"); //X-XSS공격을 막기위한 방어수단 해제
		savepage = savepage.replace("<meta", "<!-- <meta");
		savepage = savepage.replace("/meta>", "/meta> -->");
		savepage = savepage.replace("<title", "<!-- <title");
		savepage = savepage.replace("/title>", "/title> -->");
		
		int size = savepage.length();
		String[] savedpage = new String[10];
		
		for (int i = 0; i <= (size / 3000); i++) {
			if (i == 0 && size <= 3000) {
				savedpage[i] = savepage;
			}
			if (i == 0 && size > 3000) {
				savedpage[i] = savepage.substring(0, (i + 1) * 3000);
			} else if (i == (size / 3000)) {
				savedpage[i] = savepage.substring((i * 3000), size);
			} else {
				savedpage[i] = savepage.substring(i * 3000, (i + 1) * 3000);
			}
		} // 3000자단위로 나누어 배열에 저장 (DB에 저장 필요)

		Amember am = new Amember();
		am = (Amember) hs.getAttribute("Amember");
		String membercode = am.getMembercode();
		String tc = membercode + pagename;
		
		Atemplate at = new Atemplate();
		at.setTemplatecode(tc);
		if (savedpage[0] != null && savedpage[0].length() != 0 && savedpage[0] != "") {
			at.setBody0(savedpage[0]);
		}
		if (savedpage[1] != null && savedpage[1].length() != 0 && savedpage[1] != "") {
			at.setBody1(savedpage[1]);
		}
		if (savedpage[2] != null && savedpage[2].length() != 0 && savedpage[2] != "") {
			at.setBody2(savedpage[2]);
		}
		if (savedpage[3] != null && savedpage[3].length() != 0 && savedpage[3] != "") {
			at.setBody3(savedpage[3]);
		}
		if (savedpage[4] != null && savedpage[4].length() != 0 && savedpage[4] != "") {
			at.setBody4(savedpage[4]);
		}
		if (savedpage[5] != null && savedpage[5].length() != 0 && savedpage[5] != "") {
			at.setBody5(savedpage[5]);
		}
		if (savedpage[6] != null && savedpage[6].length() != 0 && savedpage[6] != "") {
			at.setBody6(savedpage[6]);
		}
		if (savedpage[7] != null && savedpage[7].length() != 0 && savedpage[7] != "") {
			at.setBody7(savedpage[7]);
		}
		if (savedpage[8] != null && savedpage[8].length() != 0 && savedpage[8] != "") {
			at.setBody8(savedpage[8]);
		}
		if (savedpage[9] != null && savedpage[9].length() != 0 && savedpage[9] != "") {
			at.setBody9(savedpage[9]);
		}
		
		adao.savepage(at);
		
		return "Bviews/Bmain/Bmain";
	}
	
	@RequestMapping(value = "loadpage", method = RequestMethod.GET)
	public String loadpage(Model model, String pageinfo, HttpSession hs) {
		Atemplate at = new Atemplate();
		at = adao.loadpage(pageinfo);

		String result = "";
		if (at.getBody0() != null && at.getBody0().length() != 0 && at.getBody0() != "") {
			result += at.getBody0();
		}
		if (at.getBody1() != null && at.getBody1().length() != 0 && at.getBody1() != "") {
			result += at.getBody1();
		}
		if (at.getBody2() != null && at.getBody2().length() != 0 && at.getBody2() != "") {
			result += at.getBody2();
		}
		if (at.getBody3() != null && at.getBody3().length() != 0 && at.getBody3() != "") {
			result += at.getBody3();
		}
		if (at.getBody4() != null && at.getBody4().length() != 0 && at.getBody4() != "") {
			result += at.getBody4();
		}
		if (at.getBody5() != null && at.getBody5().length() != 0 && at.getBody5() != "") {
			result += at.getBody5();
		}
		if (at.getBody6() != null && at.getBody6().length() != 0 && at.getBody6() != "") {
			result += at.getBody6();
		}
		if (at.getBody7() != null && at.getBody7().length() != 0 && at.getBody7() != "") {
			result += at.getBody7();
		}
		if (at.getBody8() != null && at.getBody8().length() != 0 && at.getBody8() != "") {
			result += at.getBody8();
		}
		if (at.getBody9() != null && at.getBody9().length() != 0 && at.getBody9() != "") {
			result += at.getBody9();
		}
		
		model.addAttribute("result", result);
		
		return "Bviews/Bmain/Bmain";
	}
	
	
	@RequestMapping(value = "deleteShop", method = RequestMethod.GET)
	public String deleteShop(String membercode) {
		adao.deleteShop(membercode);
		
		return "Aviews/Amember/Amypage";
	}
}
