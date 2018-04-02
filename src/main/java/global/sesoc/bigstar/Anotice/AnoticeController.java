package global.sesoc.bigstar.Anotice;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.bigstar.dao.AnoticeDAO;
import global.sesoc.bigstar.vo.Anotice;

@Controller
public class AnoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(AnoticeController.class);
	
	@Autowired
	AnoticeDAO ANdao;
	
	//구매페이지 이동
	@RequestMapping(value = "ApurchasePage", method = RequestMethod.GET) 
	public String purchasePage() {
	 
		return "Aviews/Apurchase/ApurchasePage";
	}
	
	//공지사항 게시판 페이지 이동 및 리스트 불러오기
	@RequestMapping(value = "AnoticeList", method = RequestMethod.GET)
	public String AnoticeList(Model model) {
		
		logger.info("공지사항 게시판 이동");
		
		ArrayList<Anotice> noticelist = ANdao.selectAllanotice();
		model.addAttribute("noticelist", noticelist);
		
		for (Anotice anotice : noticelist) {
			System.out.println(anotice);
		}
		
		return "Aviews/Anotice/AnoticeList";
	}
	
	//공지사항 작성폼 이동
	@RequestMapping(value="AnoticeWriteForm", method=RequestMethod.GET)
	public String AnoticeWriteForm(){
		
		logger.info("공지사항 작성 폼 이동");
		
		return "Aviews/Anotice/AnoticeWriteForm";
	}
	
	//공지사항 작성하기
	@RequestMapping(value="writeAnotice", method=RequestMethod.POST)
	public String writeAnotice(Anotice anotice, HttpSession session){
		
		logger.info("게시글 작성 시작");
		
		int result = 0;
		logger.info(anotice.toString());
		
		result = ANdao.writeAnotice(anotice);
		
		if (result != 0) {
			logger.info("게시글 작성 성공");
		} else {
			logger.info("게시글 작성 실패");
		}
		
		logger.info("게시글 작성 끝");
		
		return "Aviews/Anotice/AnoticeList";
		
	}
	
}
