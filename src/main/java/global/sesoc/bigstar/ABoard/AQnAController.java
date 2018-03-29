package global.sesoc.bigstar.ABoard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AQnAController {

		@RequestMapping(value = "AqnaPage", method = RequestMethod.GET)
		public String AqnaPage() {
			
			return "Aviews/Aboard/AqnaBoard";
		}
	

	}


	

