package global.sesoc.bigstar.Bchart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BchartController {

	
	@RequestMapping(value="BcustomerChart", method=RequestMethod.GET)
	public String BcustomerChart() {
		return "Bviews/Bchart/BcustomerChart";
	}
	
	@RequestMapping(value="BsaleChart", method=RequestMethod.GET)
	public String BsaleChart() {
		return "Bviews/Bchart/BsaleChart";
	}
	
	
	
	
}
