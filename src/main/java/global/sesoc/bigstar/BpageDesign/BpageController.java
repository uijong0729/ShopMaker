package global.sesoc.bigstar.BpageDesign;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BpageController {

	@RequestMapping(value="BpageHeader", method = RequestMethod.GET)
	public String BpageHeader() {

		return "Bviews/Bpage/BpageHeader";
	}
	
	@RequestMapping(value="BpageFooter", method = RequestMethod.GET)
	public String BpageFooter() {
		
		return "Bviews/Bpage/BpageFooter";
	}
}
