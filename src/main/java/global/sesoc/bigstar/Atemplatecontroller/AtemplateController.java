package global.sesoc.bigstar.Atemplatecontroller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.bigstar.dao.AtemplateDAO;
import global.sesoc.bigstar.vo.Atemplate;

@Controller
public class AtemplateController {
	
	@Autowired
	AtemplateDAO adao;
	/*
	@RequestMapping(value = "savepage", method=RequestMethod.POST)
	public String pagesave(HttpServletResponse response, String savepage, Model model) {
		response.setHeader("X-XSS-Protection", "0"); //X-XSS공격을 막기위한 방어수단 해제
		savepage = savepage.replace("<meta", "<!-- <meta");
		savepage = savepage.replace("/meta>", "/meta> -->");
		savepage = savepage.replace("<title", "<!-- <title");
		savepage = savepage.replace("/title>", "/title> -->");
		
		int size = savepage.length();
		String[] savedpage = new String[(size/3000) + 1];
		System.out.println(size);
		System.out.println(size / 3000);
		
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
		
		
		//DB에서 로드
		String result = "";
		for (int i = 0; i < savedpage.length; i++) {
			result += savedpage[i];
		}
		Atemplate at = new Atemplate();
		at.setTemplatecode("test");
		at.setBody1(savedpage[0]);
		if (savedpage[1] != null || savedpage[1].length() != 0) {
			at.setBody2(savedpage[1]);
		}
		if (savedpage[2] != null || savedpage[2].length() != 0) {
			at.setBody3(savedpage[3]);
		}
		adao.savepage(at);
		
		model.addAttribute("test", result);
		
		return "Bviews/Bmain/Bmain";
	}*/
	
	@RequestMapping(value = "test", method = RequestMethod.GET)
	public String loadpage(Model model) {
		Atemplate at = new Atemplate();
		at = adao.loadpage("test");
		System.out.println("응 찍혀");
		System.out.println(at.getTemplate());
		int size = 0;
		if (at.getBody1() != null && at.getBody1() != "") {
			size += 1;
		}
		if (at.getBody2() != null && at.getBody2() != "") {
			size += 1;
		}
		if (at.getBody3() != null && at.getBody3() != "") {
			size += 1;
		}
		String savedpage[] = new String[size];
		if (size >= 1) {
			savedpage[0] = at.getBody1();
			if (size >= 2) {
				savedpage[1] = at.getBody2();
				if (size == 3) {
					savedpage[2] = at.getBody3();
				}
			}
		
		}
		String result = "";
		for (int i = 0; i < savedpage.length; i++) {
			result += savedpage[i];
		}
		System.out.println(result);
		model.addAttribute("result", result);
		return "Bviews/Bmain/test";
	}
}
