package global.sesoc.bigstar.Bpurchase;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;
import javax.swing.border.Border;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import global.sesoc.bigstar.vo.Bcustomer;
import global.sesoc.bigstar.vo.Bordertable;
import global.sesoc.bigstar.vo.Bproducttable;

@Controller
public class BpurchaseController {
	
	//구매페이지 이동
	@RequestMapping(value = "goBpurchaseform", method = RequestMethod.GET) 
	public String BpurchasePage(Model model, HttpSession session, Bproducttable product, String productQty) {
		
		Bcustomer bc  = (Bcustomer) session.getAttribute("Blogin");
		
		ArrayList <Bordertable> orderList = new ArrayList <Bordertable>();
		
		ArrayList <Bproducttable> purchaseList = new ArrayList<Bproducttable>();
		purchaseList.add(product);
		
		session.setAttribute("purchaseList", purchaseList);
		session.setAttribute("orderList", orderList);
		
		return "Bviews/Bpurchase/Bpurchaseform";
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
