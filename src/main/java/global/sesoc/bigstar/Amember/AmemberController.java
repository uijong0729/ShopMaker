package global.sesoc.bigstar.Amember;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.bigstar.dao.AmemberDAO;
import global.sesoc.bigstar.vo.Amember;

@Controller
public class AmemberController {

	@Inject
	AmemberDAO AMdao;

	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String loginPage() {

		return "home";
	}

	@RequestMapping(value = "AsignupPage", method = RequestMethod.GET)
	public String signupPage() {

		return "Aviews/Amember/AsignupPage";

	}

	@RequestMapping(value = "Logout", method = RequestMethod.GET)
	public String Logout(HttpSession session) {

		session.removeAttribute("Amember");

		return "Aviews/Amember/AwellcomePage";
	}

	@RequestMapping(value = "AsignupReq", method = RequestMethod.GET)
	public String AsignupReq(String id, String password, String emailA, String emailB, String name, String hpnumber,
			String addressA, String addressB, String biznumber) {

		Amember member = new Amember();
		member.setId(id);
		member.setPw(password);

		String mailaddress = emailA + "@" + emailB;

		member.setMailaddress(mailaddress);
		member.setName(name);
		member.setHpnumber(hpnumber);

		String address = addressA + " " + addressB;

		member.setAddress(address);
		member.setBiznumber(biznumber);

		System.out.println(member);
		System.out.println(AMdao.AsignupCustomer(member));

		return "Aviews/Amember/AwellcomePage";
	}

	@ResponseBody
	@RequestMapping(value = "isThereId", method = RequestMethod.POST)
	public String isThereId(String id) {
		String result = AMdao.AfindCustomer(id);

		if (id.equals(result)) {
			return id;
		} else {
			return "";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value = "loginAcustomer", method = RequestMethod.POST)
	public String loginAcustomer(String id, String password) {

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", password);
		
		Amember result = AMdao.loginAcustomer(map);
		if(result == null)
		{
			return "0";
		}
		else
		{
			return "1";
		}
	}
	

	@RequestMapping(value = "AgoLogin", method = RequestMethod.POST)
	public String AgoLogin(String id, String pw, HttpServletResponse response, Model model, HttpSession session) {
	HashMap<String, String> map = new HashMap<String, String>();

		map.put("id", id);
		map.put("pw", pw);

		Amember am = null;
		try 
		{
			am = AMdao.loginAcustomer(map);
			if(am == null)
			{
				return "Aviews/Amember/Login";
			}
		}
		catch(Exception e)
		{
			return "Aviews/Amember/Login";
		}
		
		session.setAttribute("loginCode", am.getMembercode()); 
		String a;
		a = am.getPaymentexpirationdate();
		a = "1970-01-01";
		a = a.substring(0, 10);
		am.setPaymentexpirationdate(a);
		if (am == null) {
			// model.addAttribute("AloginResult", 1);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('로그인 정보를 확인해주세요.');</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "Aviews/Amember/Login";
		}else {
			session.setAttribute("Amember", am);
			//session.setAttribute("loginCode", am.getMembercode());
			// model.addAttribute("AloginResult", 2)
			return "home";
		}
	}
	@RequestMapping(value = "Amypage", method = RequestMethod.GET)
	public String aMyPage() {
		return "Aviews/Amember/Amypage";
	}
}
