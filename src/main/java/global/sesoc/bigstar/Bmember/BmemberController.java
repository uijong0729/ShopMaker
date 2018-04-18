package global.sesoc.bigstar.Bmember;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.bigstar.HomeController;
import global.sesoc.bigstar.dao.BcustomerDAO;
import global.sesoc.bigstar.dao.BreviewtableDAO;
import global.sesoc.bigstar.vo.Bcustomer;

@Controller
public class BmemberController {
	
	@Autowired
	BcustomerDAO dao;
	
	@RequestMapping(value="Bregist", method = RequestMethod.GET)
	public String Bregist() {
		return "Bviews/Bmain/Bregist";
	}
	
	@RequestMapping(value="Blogin", method = RequestMethod.GET)
	public String Blogin() {
		return "Bviews/Bmain/Blogin";
	}
	
	@RequestMapping(value="Bmypage", method = RequestMethod.GET)
	public String Bmypage() {
		return "Bviews/Bmain/Bmypage";
	}
	
	@RequestMapping(value="Bcart", method = RequestMethod.GET)
	public String Bcart() {
		return "Bviews/Bmain/Bcart";
	}
	
	@RequestMapping(value="BcustomerLogin", method = RequestMethod.POST)
	public String BcustomerLogin(String customerid, String customerpw, String membercode, HttpSession session) {
		
		System.out.println(customerid);
		System.out.println(customerpw);
		System.out.println(membercode);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("customerid", customerid);
		map.put("customerpw", customerpw);
		map.put("membercode", membercode);
		
		session.setAttribute("Blogin", dao.loginBcustomer(map));
		
		return "Bviews/Bmain/Bshopmain";
	}
	
	@RequestMapping(value="Bwellcome", method=RequestMethod.POST)
	public String Bwellcome(Bcustomer bcustomer, Model model)
	{
		System.out.println(bcustomer);
		if(bcustomer.getCustomeraddress() == null)
		{
			bcustomer.setCustomeraddress("값이 없습니다");
		}
		
		if(bcustomer.getCustomerhp() == null)
		{
			bcustomer.setCustomerhp("값이 없습니다");
		}
		
		if(bcustomer.getCustomername() == null)
		{
			bcustomer.setCustomername("값이 없습니다");
		}
		
		
		System.out.println(dao.insertBcustomer(bcustomer));
		model.addAttribute("Bcustomer", bcustomer);
		
		
		return "Bviews/Bmain/Bwellcome";
	}
	

	
	
}
