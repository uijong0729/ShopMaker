package global.sesoc.bigstar.Bmember;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
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
import global.sesoc.bigstar.dao.BproducttableDAO;
import global.sesoc.bigstar.dao.BreviewtableDAO;
import global.sesoc.bigstar.vo.Bcarttable;
import global.sesoc.bigstar.vo.Bcustomer;
import global.sesoc.bigstar.vo.Bordertable;
import global.sesoc.bigstar.vo.Bproducttable;

@Controller
public class BmemberController {
	
	@Autowired
	BcustomerDAO dao;
	
	@Autowired
	BcarttableDAO cdao;
	
	@Inject
	BproducttableDAO pdao;
	
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
			return "redirect:goBmain";
			
		}
		
		
	}
	
	@RequestMapping(value="BmemberListPage", method=RequestMethod.GET)
	public String BmemberListPage(HttpSession session, Model model, String membercode) {
		try 
		{
			ArrayList<Bcustomer> list = dao.bCustomerList(membercode);
			int countList = list.size();
			model.addAttribute("bCustomerList", list);
			model.addAttribute("bCountList", countList);
			model.addAttribute("BcustomerModel", list.get(0));
		}
		catch(NullPointerException e)
		{
			model.addAttribute("bCountList", 0);
		}
		
		return "Bviews/Bmain/BcustomerList";
	}
	
	@RequestMapping(value="Bwellcome", method=RequestMethod.POST)
	public String Bwellcome(Bcustomer bcustomer, Model model, HttpSession hs, String membercode) {
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
		
		model.addAttribute("Bcustomer", bcustomer);
		System.out.println(membercode);
		
		return "redirect:/goMyShop?code=" + membercode + "&page=BpageMain";
	}
	
	@ResponseBody
	@RequestMapping(value="getOrderlist", method=RequestMethod.POST)
	public List<Bordertable> getOrderlist(String membercode, String customercode) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("membercode", membercode);
		map.put("customercode", customercode);
		
		List<Bordertable> list = null;
		try 
		{
			list = dao.BorderList(map);
			//System.out.println(list);
			return list;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return list;
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="getCartlist", method=RequestMethod.POST)
	public HashMap<String, Object> getCartlist(String customercode) {
		
		List<Bcarttable> clist = null;
		List<Bproducttable> cart = new ArrayList<Bproducttable>();
		HashMap<String, Object> purchaseList = new HashMap<String, Object>();
		
		
		try 
		{
			clist = cdao.selectbcarttable(Integer.parseInt(customercode));
			
			System.out.println(clist);
		}
		catch(Exception e)
		{
			//e.printStackTrace();
			return null;
		}
		
		for(int i = 0 ; i < clist.size() ; i++)
		{
			String pCode = clist.get(i).getProductcode();
			//String pQty = bcarttable.getProductQty();
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("customercode", customercode);
			map.put("productcode", pCode);
			
			//map.put("productQty", pQty);
			Bproducttable pro = pdao.getCart(map);
			try 
			{
				int qty = Integer.parseInt(clist.get(i).getProductQty());
				pro.setProductquantity(qty);
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
				
			cart.add(pdao.getCart(map));
		}
		
		/*for (Bcarttable bcarttable : clist) {
			String pCode = bcarttable.getProductcode();
			//String pQty = bcarttable.getProductQty();
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("customercode", customercode);
			map.put("productcode", pCode);
			//map.put("productQty", pQty);
			cart.add(pdao.getCart(map));
		}*/
		
		
		//cart
		purchaseList.put("clist", clist);
		purchaseList.put("cart", cart);

		/*		
		JSONArray cListJson = JSONArray.fromObject(clist);
		JSONArray cartJson = JSONArray.fromObject(cart);*/
		
		return purchaseList;
	}
	
	@RequestMapping(value = "Btracking", method = RequestMethod.GET)
	public String btracking(String t_code, String t_invoice) {
		return "Bviews/Bproduct/tracking";
	}
	
	@RequestMapping(value = "updateBcustomer", method = RequestMethod.POST)
	public String updateBcustomer(String customerpw, String customeraddress, String customerhp, String customercode)
	{
		Bcustomer bcustomer = new Bcustomer();
			bcustomer.setCustomeraddress(customeraddress);
			bcustomer.setCustomerhp(customerhp);
			bcustomer.setCustomercode(customercode);
		
		if(customerpw == "" || customerpw.equals("") || customerpw == null)
		{
			try 
			{
				bcustomer.setCustomerpw(dao.selectbcustomer(Integer.parseInt(customercode)).getCustomerpw());
			}
			catch(Exception e)
			{
				bcustomer.setCustomerpw(customerpw);
			}
		}
		else
		{
			bcustomer.setCustomerpw(customerpw);
		}
		
		return "Bviews/Bmain/Bmain";
	}

	
	
}
