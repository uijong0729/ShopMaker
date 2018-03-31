package global.sesoc.bigstar.Anotice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.bigstar.dao.AnoticeDAO;

@Controller
public class AnoticeController {
	
	@Autowired
	AnoticeDAO ANdao;
	
	@RequestMapping(value = "ApurchasePage", method = RequestMethod.GET)
	public String purchasePage() {
		
		return "Aviews/Apurchase/ApurchasePage";
	}
	
	
	
}
