package global.sesoc.bigstar.Amember;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.bigstar.dao.AmemberDAO;

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
	
	@RequestMapping(value = "AsignupReq", method = RequestMethod.GET)
	public String AsignupReq(String id, String password, String emailA
			, String emailB, String name, String hpnumber, String addressA
			, String buznumber) {
		
		
		
		
		
		return "Aviews/Amember/AwellcomePage";
	}
	
	@ResponseBody
	@RequestMapping(value="isThereId", method=RequestMethod.POST)
	public String isThereId(String id)
	{
		String result = AMdao.AfindCustomer(id);
		
		if(id.equals(result))
		{
			return id;
		}
		else
		{
			return "";
		}
	}
	

}

