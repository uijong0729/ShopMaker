package global.sesoc.bigstar.Bpurchase;

import java.text.DateFormat;
import java.util.Locale;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BpurchaseController {
	
	//구매페이지 이동
	@RequestMapping(value = "BpurchasePage", method = RequestMethod.GET) 
	public String BpurchasePage() {
	 
		return "Bviews/Bpurchase/BpurchasePage";
	}
	
	@RequestMapping(value = "BpurchaseIndex", method = RequestMethod.POST)
	public String BpurchaseIndex(Model model, HttpSession session, String templateforValue, String paymentforValue, String daysforValue) {
//		System.out.println(templateforValue);
//		System.out.println(paymentforValue);
//		System.out.println(daysforValue);
		
		HashMap<String, String> BpurchaseInfo = new HashMap<String, String>();
		BpurchaseInfo.put("templateforValue", templateforValue);
		BpurchaseInfo.put("paymentforValue", paymentforValue);
		BpurchaseInfo.put("daysforValue", daysforValue);
		
		session.setAttribute("BpurchaseInfo", BpurchaseInfo);
		return "Bviews/Bpurchase/BkakaopayIndex";
	}
	
	@RequestMapping(value = "BkakaopayInfo", method = RequestMethod.GET)
	public String BkakaopayInfo(){
		
		return "Bviews/Bpurchase/BkakaopayInfo"; 
	}
	
	@RequestMapping(value = "BkakaopayInfo2", method = RequestMethod.POST)
	public String BkakaopayInfo2(){
		
		return "Bviews/Bpurchase/BkakaopayInfo2"; 
	}
	
	@RequestMapping(value = "BkakaopaySuccess", method = RequestMethod.GET)
	public String BkakaopaySuccess(Model model, HttpSession session, Locale locale){
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate);
		
		HashMap<String, String> BpurchaseInfo = (HashMap<String, String>) session.getAttribute("BpurchaseInfo");
		
		String templateforValue = BpurchaseInfo.get("templateforValue");
		String paymentforValue = BpurchaseInfo.get("paymentforValue");
		String daysforValue = BpurchaseInfo.get("daysforValue");
		
//		System.out.println(templateforValue);
//		System.out.println(paymentforValue);
//		System.out.println(daysforValue);
		
		model.addAttribute("templateforValue", templateforValue);
		model.addAttribute("paymentforValue", paymentforValue);
		model.addAttribute("daysforValue", daysforValue);
		
		return "Bviews/Bpurchase/BkakaopaySuccess"; 
	}
}
