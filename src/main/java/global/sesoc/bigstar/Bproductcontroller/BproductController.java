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
		
		for (int i = 1; i <= 40; i++) {
			Bproducttable bp = new Bproducttable();
			bp.setProductcode(Integer.toString(i));
			bp.setProductname("product" + i);
			bp.setProductprice(i * 1000);
			Bproducttable.add(bp);
		}
		model.addAttribute("Bproducttable", Bproducttable);
		model.addAttribute("rows", 4);
		return "Bviews/Bmainlist/Bmainlist";
	}
}
