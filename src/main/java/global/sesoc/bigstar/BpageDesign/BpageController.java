package global.sesoc.bigstar.BpageDesign;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BpageController {

	@RequestMapping(value="BpageHeader", method = RequestMethod.GET)
	public String BpageHeader() {

		return "Bviews/Bpage/BpageHeader";
	}
	
	@RequestMapping(value="BpageFooter", method = RequestMethod.GET)
	public String BpageFooter() {
		
		return "Bviews/Bpage/BpageFooter";
	}
	
	@ResponseBody
	@RequestMapping(value="makeFooter", method = RequestMethod.POST)
	public String makeFooter(String text, HttpSession session, Model model) {
		
		session.setAttribute("isThereFooter", "0");
		session.setAttribute("Bfooter", text);
		return (String)session.getAttribute("isThereFooter");
	}
	
	@ResponseBody
	@RequestMapping(value="getFooter", method = RequestMethod.POST)
	public String getFooter(HttpSession session) {
		String str = "";
		try {
			str = (String) session.getAttribute("Bfooter");
		}
		catch(Exception e)
		{
			System.out.println("세션없음");
		}
		
		
		return str;
	}
	
	
	@ResponseBody
	@RequestMapping(value="footerCancle", method = RequestMethod.POST)
	public void footerCancle(HttpSession session) {
		try 
		{
			session.removeAttribute("Bfooter");
		}
		catch(Exception e)
		{
			System.out.println("세션없음");
		}
	}
	
	@RequestMapping(value = "Bshopmain", method = RequestMethod.POST)
	public String bShopMain() {
		return "Bviews/Bmain/Bshopmain";
	}
	
	
	
	
}
