package global.sesoc.bigstar.Bproductcontroller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.bigstar.dao.AtemplateDAO;
import global.sesoc.bigstar.dao.BproducttableDAO;
import global.sesoc.bigstar.vo.Atemplate;
import global.sesoc.bigstar.vo.Bproducttable;

@Controller
public class BproductController {

	@Autowired
	BproducttableDAO Bpdao;
	@Autowired
	AtemplateDAO adao;

	@RequestMapping(value = "Bmainlist", method = RequestMethod.GET)
	public String goBmainlilst(Model model) {
		ArrayList<Bproducttable> Bproducttable = new ArrayList<Bproducttable>();
		ArrayList<String> nameset = new ArrayList<String>();
		ArrayList<String> imageset = new ArrayList<String>();
		ArrayList<String[]> imageset2 = new ArrayList<String[]>();
		
		int count=0;
		Bproducttable=Bpdao.selectallbproducttable();
		
		for (Bproducttable b : Bproducttable) {
			imageset.add(b.getProductname());
		}
		for (int i = 0; i < imageset.size(); i++) {
			if (!nameset.contains(imageset.get(i))) {
				nameset.add(imageset.get(i));
			}
		}
		imageset.clear();
		
		Map<String, String> arrMap = new HashMap<String, String>(); 
		
		for (int i = 0; i < Bproducttable.size(); i++) {
			if (arrMap.containsKey(Bproducttable.get(i).getProductname())) {
				String str = arrMap.get(Bproducttable.get(i).getProductname());
				arrMap.remove(Bproducttable.get(i).getProductname());
				arrMap.put(Bproducttable.get(i).getProductname(), str);
			}
			arrMap.put(Bproducttable.get(i).getProductname(), Bproducttable.get(i).getProductimage());
			
		}
		
		
		
		System.out.println(arrMap.get("key"));

		System.out.println(count);
		
		model.addAttribute("map", arrMap);
		model.addAttribute("nameset", nameset);
		model.addAttribute("Bproducttable", Bproducttable);
		model.addAttribute("count", count);
		
		model.addAttribute("rows", 4);
		return "Bviews/Bmainlist/Bmainlist";
	}
	
	@RequestMapping(value = "myShop", method = RequestMethod.GET)
	public String myShop() {
		return "Bviews/Bpage/myShop";
	}
	
	@RequestMapping(value = "goMyShop", method = RequestMethod.GET)
	public String goMyShop(String page, String code, Model model) {
		String link = code + page;
		Atemplate at = adao.getPage(link);
		Atemplate header = adao.getPage(code + "Bheader");
		Atemplate footer = adao.getPage(code + "Bfooter");
		
		
		String bodyContent = "";
		if (at.getBody0() != null && at.getBody0() != "") {
			bodyContent += at.getBody0();
		}
		if (at.getBody1() != null && at.getBody1() != "") {
			bodyContent += at.getBody1();
		}
		if (at.getBody2() != null && at.getBody2() != "") {
			bodyContent += at.getBody2();
		}
		if (at.getBody3() != null && at.getBody3() != "") {
			bodyContent += at.getBody3();
		}
		if (at.getBody4() != null && at.getBody4() != "") {
			bodyContent += at.getBody4();
		}
		if (at.getBody5() != null && at.getBody5() != "") {
			bodyContent += at.getBody5();
		}
		if (at.getBody6() != null && at.getBody6() != "") {
			bodyContent += at.getBody6();
		}
		if (at.getBody7() != null && at.getBody7() != "") {
			bodyContent += at.getBody7();
		}
		if (at.getBody8() != null && at.getBody8() != "") {
			bodyContent += at.getBody8();
		}
		if (at.getBody9() != null && at.getBody9() != "") {
			bodyContent += at.getBody9();
		}
		
		String headerContent = "";
		if (header.getBody0() != null && header.getBody0() != "") {
			headerContent += header.getBody0();
		}
		if (header.getBody1() != null && header.getBody1() != "") {
			headerContent += header.getBody1();
		}
		if (header.getBody2() != null && header.getBody2() != "") {
			headerContent += header.getBody2();
		}
		if (header.getBody3() != null && header.getBody3() != "") {
			headerContent += header.getBody3();
		}
		if (header.getBody4() != null && header.getBody4() != "") {
			headerContent += header.getBody4();
		}
		if (header.getBody5() != null && header.getBody5() != "") {
			headerContent += header.getBody5();
		}
		if (header.getBody6() != null && header.getBody6() != "") {
			headerContent += header.getBody6();
		}
		if (header.getBody7() != null && header.getBody7() != "") {
			headerContent += header.getBody7();
		}
		if (header.getBody8() != null && header.getBody8() != "") {
			headerContent += header.getBody8();
		}
		if (header.getBody9() != null && header.getBody9() != "") {
			headerContent += header.getBody9();
		}
		
		String footerContent = "";
		if (footer.getBody0() != null && footer.getBody0() != "") {
			footerContent += footer.getBody0();
		}
		if (footer.getBody1() != null && footer.getBody1() != "") {
			footerContent += footer.getBody1();
		}
		if (footer.getBody2() != null && footer.getBody2() != "") {
			footerContent += footer.getBody2();
		}
		if (footer.getBody3() != null && footer.getBody3() != "") {
			footerContent += footer.getBody3();
		}
		if (footer.getBody4() != null && footer.getBody4() != "") {
			footerContent += footer.getBody4();
		}
		if (footer.getBody5() != null && footer.getBody5() != "") {
			footerContent += footer.getBody5();
		}
		if (footer.getBody6() != null && footer.getBody6() != "") {
			footerContent += footer.getBody6();
		}
		if (footer.getBody7() != null && footer.getBody7() != "") {
			footerContent += footer.getBody7();
		}
		if (footer.getBody8() != null && footer.getBody8() != "") {
			footerContent += footer.getBody8();
		}
		if (footer.getBody9() != null && footer.getBody9() != "") {
			footerContent += footer.getBody9();
		}
		
		model.addAttribute("body", bodyContent);
		model.addAttribute("headerContent", headerContent);
		model.addAttribute("footer", footerContent);
		return "Bviews/Bpage/myShop";
	}
	
	@RequestMapping(value = "Bheader", method = RequestMethod.GET)
	public String Bheader() {
		return "Bviews/Bmain/Bheader";
	}
	
	@RequestMapping(value = "Bfooter", method = RequestMethod.GET)
	public String Bfooter() {
		return "Bviews/Bmain/Bfooter";
	}
}
