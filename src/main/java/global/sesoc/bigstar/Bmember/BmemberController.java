package global.sesoc.bigstar.Bmember;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.bigstar.HomeController;
import global.sesoc.bigstar.dao.BcarttableDAO;
import global.sesoc.bigstar.dao.BcustomerDAO;
import global.sesoc.bigstar.dao.BreviewtableDAO;
import global.sesoc.bigstar.vo.Bcarttable;
import global.sesoc.bigstar.vo.Bcustomer;
import global.sesoc.bigstar.vo.Bordertable;

@Controller
public class BmemberController {
	
	@Autowired
	BcustomerDAO dao;
	
	@Autowired
	BcarttableDAO cdao;
	
	@RequestMapping(value="Bregist", method = RequestMethod.GET)
	public String Bregist() {
		return "Bviews/Bmain/Bregist";
	}
	
	@ResponseBody
	@RequestMapping(value="checkBcustomerId", method= RequestMethod.POST)
	public String checkBcustomerId(String customerid)
	{
		int countId = 0;
		try 
		{
			countId = dao.searchBcustomerid(customerid);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		if(countId >= 1)
		{
			return "1";
		}
		else
		{
			return "0";
		}
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
	public String BcustomerLogin(Model model, String customerid, String customerpw, String membercode, HttpSession session) {
		
		System.out.println(customerid);
		System.out.println(customerpw);
		System.out.println(membercode);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("customerid", customerid);
		map.put("customerpw", customerpw);
		map.put("membercode", membercode);
		
		Bcustomer member = dao.loginBcustomer(map);
		//System.out.println(member);
		
		session.setAttribute("Blogin", member);

		if(member == null)
		{
			model.addAttribute("isThereId", 1);
			return "Bviews/Bmain/Blogin";
		}
		else
		{
			model.addAttribute("isThereId", 0);
			return "Bviews/Bmain/Bshopmain";
			
		}
		
		
	}
	
	@RequestMapping(value="BmemberListPage", method=RequestMethod.GET)
	public String BmemberListPage(HttpSession session, Model model, String membercode) {
		try 
		{
			ArrayList<Bcustomer> list = dao.bCustomerList(membercode);
			System.out.println(list);
			int countList = list.size();
			model.addAttribute("bCustomerList", list);
			model.addAttribute("bCountList", countList);
			System.out.println(list.get(0));
			model.addAttribute("BcustomerModel", list.get(0));
		}
		catch(NullPointerException e)
		{
			model.addAttribute("bCountList", 0);
		}
		
		return "Bviews/Bmain/BcustomerList";
	}
	
	@RequestMapping(value="Bwellcome", method=RequestMethod.POST)
	public String Bwellcome(Bcustomer bcustomer, Model model)
	{
		System.out.println(bcustomer);
		if(bcustomer.getCustomeraddress() == null)
		{
			bcustomer.setCustomeraddress("미입력");
		}
		
		if(bcustomer.getCustomerhp() == null)
		{
			bcustomer.setCustomerhp("미입력");
		}
		
		if(bcustomer.getCustomername() == null)
		{
			bcustomer.setCustomername("미입력");
		}
		
		
		System.out.println(dao.insertBcustomer(bcustomer));
		model.addAttribute("Bcustomer", bcustomer);
		
		
		return "Bviews/Bmain/Blogin";
	}
	
	@ResponseBody
	@RequestMapping(value="getOrderlist", method=RequestMethod.POST)
	public List<Bordertable> getOrderlist(String membercode, String customercode) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("membercode", membercode);
		map.put("customercode", customercode);
		System.out.println(map);
		try 
		{
			List<Bordertable> list = dao.BorderList(map);
			//System.out.println(list);
			if(list == null)
			{
				return null;
			}
			else
			{
				return list;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	
	@ResponseBody
	@RequestMapping(value="getCartlist", method=RequestMethod.POST)
	public List<Bcarttable> getCartlist(String customercode) {
		
		List<Bcarttable> clist = cdao.selectbcarttable(Integer.parseInt(customercode));
		
		return clist;
	}
	
	@RequestMapping(value = "Btracking", method = RequestMethod.GET)
	public String btracking(String t_code, String t_invoice) {
		return "Bviews/Bproduct/tracking";
	}

	
	
}
