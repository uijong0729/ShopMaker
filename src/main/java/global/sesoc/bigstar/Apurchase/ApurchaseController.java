package global.sesoc.bigstar.Apurchase;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.bigstar.dao.AmemberDAO;

@Controller
public class ApurchaseController {

	//구매페이지 이동
	@RequestMapping(value = "ApurchasePage", method = RequestMethod.GET) 
	public String ApurchasePage() {
	 
		return "Aviews/Apurchase/ApurchasePage";
	}
	
	@RequestMapping(value = "ApurchaseIndex", method = RequestMethod.POST)
	public String ApurchaseIndex(Model model, HttpSession session, String templateforValue, String paymentforValue, String daysforValue) {
//		System.out.println(templateforValue);
//		System.out.println(paymentforValue);
//		System.out.println(daysforValue);
		
		HashMap<String, String> ApurchaseInfo = new HashMap<String, String>();
		ApurchaseInfo.put("templateforValue", templateforValue);
		ApurchaseInfo.put("paymentforValue", paymentforValue);
		ApurchaseInfo.put("daysforValue", daysforValue);
		
		session.setAttribute("ApurchaseInfo", ApurchaseInfo);
		return "Aviews/Apurchase/AkakaopayIndex";
	}
	
	@RequestMapping(value = "AkakaopayInfo", method = RequestMethod.GET)
	public String AkakaopayInfo(){
		
		return "Aviews/Apurchase/AkakaopayInfo"; 
	}
	
	@RequestMapping(value = "AkakaopayInfo2", method = RequestMethod.POST)
	public String AkakaopayInfo2(){
		
		return "Aviews/Apurchase/AkakaopayInfo2"; 
	}
	
	@RequestMapping(value = "AkakaopaySuccess", method = RequestMethod.GET)
	public String AkakaopaySuccess(Model model, HttpSession session, Locale locale){
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate);
		
		HashMap<String, String> ApurchaseInfo = (HashMap<String, String>) session.getAttribute("ApurchaseInfo");
		
		String templateforValue = ApurchaseInfo.get("templateforValue");
		String paymentforValue = ApurchaseInfo.get("paymentforValue");
		String daysforValue = ApurchaseInfo.get("daysforValue");
		
//		System.out.println(templateforValue);
//		System.out.println(paymentforValue);
//		System.out.println(daysforValue);
		
		model.addAttribute("templateforValue", templateforValue);
		model.addAttribute("paymentforValue", paymentforValue);
		model.addAttribute("daysforValue", daysforValue);
		
		return "Aviews/Apurchase/AkakaopaySuccess"; 
	}
	
	@Autowired
	AmemberDAO AMdao;

	@ResponseBody
	@RequestMapping(value = "caldate", method = RequestMethod.POST)
	public String caldate(String date) {
		System.out.println(1);
		System.out.println(date);
		String value = null;
		String a = null;
		try {

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date beginDate = formatter.parse(date);

			System.out.println(beginDate);

			long diff = beginDate.getTime();
			long diffDays = diff / (24 * 60 * 60 * 1000);
			diffDays = diffDays + 30;
			diffDays = diffDays*(24 * 60 * 60 * 1000);
			System.out.println(diffDays);
			Date today = new Date(diffDays);
			a = formatter.format(today);

		} catch (ParseException e) {
			e.printStackTrace();
		}

		System.out.println(a);

		return a;
	}

	@ResponseBody
	@RequestMapping(value = "caldate2", method = RequestMethod.POST)
	public String caldate2(String date) {
		System.out.println(2);
		System.out.println(date);
		String value = null;
		String a = null;
		try {

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date beginDate = formatter.parse(date);

			System.out.println(beginDate);

			long diff = beginDate.getTime();
			long diffDays = diff / (24 * 60 * 60 * 1000);
			diffDays = diffDays + 60;
			diffDays = diffDays*(24 * 60 * 60 * 1000);
			System.out.println(diffDays);
			Date today = new Date(diffDays);
			a = formatter.format(today);

		} catch (ParseException e) {
			e.printStackTrace();
		}

		System.out.println(a);

		return a;
	}

	@ResponseBody
	@RequestMapping(value = "caldate3", method = RequestMethod.POST)
	public String caldate3(String date) {
		System.out.println(3);
		System.out.println(date);
		String value = null;
		String a = null;
		try {

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date beginDate = formatter.parse(date);

			System.out.println(beginDate);

			long diff = beginDate.getTime();
			long diffDays = diff / (24 * 60 * 60 * 1000);
			diffDays = diffDays + 90;
			diffDays = diffDays*(24 * 60 * 60 * 1000);
			System.out.println(diffDays);
			Date today = new Date(diffDays);
			a = formatter.format(today);

		} catch (ParseException e) {
			e.printStackTrace();
		}

		System.out.println(a);

		return a;
	}

	@ResponseBody
	@RequestMapping(value = "caldate4", method = RequestMethod.POST)
	public String caldate4(String date) {
		System.out.println(4);
		System.out.println(date);
		String value = null;
		String a = null;
		try {

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date beginDate = formatter.parse(date);

			System.out.println(beginDate);

			long diff = beginDate.getTime();
			long diffDays = diff / (24 * 60 * 60 * 1000);
			diffDays = diffDays + 180;
			diffDays = diffDays*(24 * 60 * 60 * 1000);
			System.out.println(diffDays);
			Date today = new Date(diffDays);
			a = formatter.format(today);

		} catch (ParseException e) {
			e.printStackTrace();
		}

		System.out.println(a);

		return a;
	}
}
