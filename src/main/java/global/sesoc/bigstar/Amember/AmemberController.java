package global.sesoc.bigstar.Amember;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AmemberController {
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String loginPage() {
		
		return "home";
	}
	
	
	@RequestMapping(value = "AsignupPage", method = RequestMethod.GET)
	public String signupPage() {
		
		return "Amember/AsignupPage";
	}
	
	@RequestMapping(value = "AsignupReq", method = RequestMethod.GET)
	public String AsignupReq() {
		
		return "Amember/AwellcomePage";
	}
	

}

