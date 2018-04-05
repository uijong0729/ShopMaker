package global.sesoc.bigstar.Bproductcontroller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.bigstar.dao.BproducttableDAO;
import global.sesoc.bigstar.vo.Bproducttable;

@Controller
public class BproductController {
	
	@Autowired
	BproducttableDAO Bpdao;
	
	@RequestMapping(value = "Bmainlist", method = RequestMethod.GET)
	public String goBmainlilst(Model model) {
		ArrayList<Bproducttable> Bproducttable = new ArrayList<Bproducttable>();
//		Bproducttable = Bpdao.selectAllBproducttable();
		model.addAttribute("Bproducttable", Bproducttable);
		return "Bviews/Bmainlist/Bmainlist";
	}
}
