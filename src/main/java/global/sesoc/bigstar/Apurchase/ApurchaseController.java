package global.sesoc.bigstar.Apurchase;

import java.util.HashMap;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ApurchaseController {

	//구매페이지 이동
	@RequestMapping(value = "ApurchasePage", method = RequestMethod.GET) 
	public String purchasePage() {
	 
		return "Aviews/Apurchase/ApurchasePage";
	}
	
	@RequestMapping(value = "purchaseInfo", method = RequestMethod.POST)
	public String purchaseInfo(Model model, HttpSession session, String templateforValue, String paymentforValue, String daysforValue) {
//		System.out.println(templateforValue);
//		System.out.println(paymentforValue);
//		System.out.println(daysforValue);
		
		HashMap<String, String> purchaseInfo = new HashMap<String, String>();
		purchaseInfo.put("templateforValue", templateforValue);
		purchaseInfo.put("paymentforValue", paymentforValue);
		purchaseInfo.put("daysforValue", daysforValue);
		
		session.setAttribute("purchaseInfo", purchaseInfo);
		return "Aviews/Apurchase/ApurchasePage";
	}
}
