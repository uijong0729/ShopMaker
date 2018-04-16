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
	//@Autowired
	//BreviewtableDAO dao;
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
	
	@RequestMapping(value = "savepage", method=RequestMethod.POST)
	public String pagesave(HttpServletResponse response, String savepage, Model model) {
		response.setHeader("X-XSS-Protection", "0"); //X-XSS공격을 막기위한 방어수단 해제
		savepage = savepage.replace("<meta", "<!-- <meta");
		savepage = savepage.replace("/meta>", "/meta> -->");
		savepage = savepage.replace("<title", "<!-- <title");
		savepage = savepage.replace("/title>", "/title> -->");
		
		int size = savepage.length();
		String[] savedpage = new String[(size/1000) + 1];
		System.out.println(size);
		System.out.println(size / 1000);
		
		for (int i = 0; i <= (size / 1000); i++) {
			if (i == 0 && size <= 1000) {
				savedpage[i] = savepage;
			}
			if (i == 0 && size > 1000) {
				savedpage[i] = savepage.substring(0, (i + 1) * 1000);
			} else if (i == (size / 1000)) {
				savedpage[i] = savepage.substring((i * 1000), size);
			} else {
				savedpage[i] = savepage.substring(i * 1000, (i + 1) * 1000);
			}
		} // 1000자단위로 나누어 배열에 저장 (DB에 저장 필요)
		
		
		//DB에서 로드
		String result = "";
		for (int i = 0; i < savedpage.length; i++) {
			result += savedpage[i];
		}
		model.addAttribute("test", result);
		
		return "Bviews/Bmain/test";
	}
	
	
	
	
}
