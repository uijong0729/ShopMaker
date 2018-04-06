package global.sesoc.bigstar.Bproductcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.bigstar.dao.BreviewtableDAO;

@Controller
public class BproductdetailController {
	
	@Autowired
	BreviewtableDAO dao;
	
	@RequestMapping(value="goBproductdetail", method=RequestMethod.GET)
	public String productdetail() {
		
		return "Bviews/Bproduct/Bproductdetail";
	}

}
