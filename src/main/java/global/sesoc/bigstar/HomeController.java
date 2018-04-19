package global.sesoc.bigstar;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.bigstar.dao.BreviewtableDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	//AquestionDAO dao;
	/*@Autowired
	AmemberDAO dao;*/
/*	@Autowired
	AnoticeDAO dao;*/
/*	@Autowired
	AtemplateDAO dao;*/
/*	@Autowired
	AcomponentDAO dao;*/
	/*@Autowired
	BcarttableDAO dao;*/
	/*@Autowired
	BcustomerDAO dao;*/
	/*@Autowired
	BproducttableDAO Bpdao;*/
	/*@Autowired
	BnoticetableDAO dao;*/
	/*@Autowired
	BordertableDAO dao;*/
	/*@Autowired
	BquestiontableDAO dao;*/
	/*@Autowired
	BreviewtableDAO dao;*/
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		//System.out.println(dao.selectamember(0).toString());
		//System.out.println(dao.selectaquestion(3).toString());
		//System.out.println(dao.selectanotice(4).toString());
		//System.out.println(dao.selectacomponent(1).toString());
		//System.out.println(dao.selectbcustomer(1).toString());
		//System.out.println(dao.selectbproducttable(1).toString());
		//System.out.println(dao.selectbnoticetable(1).toString());
		//System.out.println(dao.selectbordertable(1).toString());
		//System.out.println(dao.selectbquestiontable(1).toString());
		//System.out.println(dao.selectbreviewtable(1).toString());
		return "home";
	}
	
	@RequestMapping(value = "loginPage", method = RequestMethod.GET)
	public String loginPage() {
		
		return "Aviews/Amember/Login";
	}
	
	@RequestMapping(value="goBmain", method=RequestMethod.GET)
	public String goBmain() {
		
		return "Bviews/Bmain/Bmain";
	}
	
	@RequestMapping(value="preview", method=RequestMethod.GET)
	public String preview() {
		
		return "Bviews/Bmain/Bpreview";
	}
}
