package global.sesoc.bigstar.Anotice;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.bigstar.dao.AmemberDAO;
import global.sesoc.bigstar.dao.AnoticeDAO;
import global.sesoc.bigstar.vo.Anotice;

@Controller
public class AnoticeController {

	private static final Logger logger = LoggerFactory.getLogger(AnoticeController.class);

	@Autowired
	AnoticeDAO ANdao;
	@Autowired
	AmemberDAO AMdao;

	@ResponseBody
	@RequestMapping(value = "caldate", method = RequestMethod.POST)
	public String caldate(String date) {
		System.out.println(1);
		System.out.println(date);
		String value = null;
		String a = null;
		try {

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date beginDate = formatter.parse(date);

			System.out.println(beginDate);

			long diff = beginDate.getTime();
			long diffDays = diff / (24 * 60 * 60 * 1000);
			diffDays = diffDays + 30;
			diffDays = diffDays*(24 * 60 * 60 * 1000);
			System.out.println(diffDays);
			Date today = new Date(diffDays);
			a = formatter.format(today);

		} catch (ParseException e) {
			e.printStackTrace();
		}

		System.out.println(a);

		return a;
	}

	@ResponseBody
	@RequestMapping(value = "caldate2", method = RequestMethod.POST)
	public String caldate2(String date) {
		System.out.println(2);
		System.out.println(date);
		String value = null;
		String a = null;
		try {

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date beginDate = formatter.parse(date);

			System.out.println(beginDate);

			long diff = beginDate.getTime();
			long diffDays = diff / (24 * 60 * 60 * 1000);
			diffDays = diffDays + 60;
			diffDays = diffDays*(24 * 60 * 60 * 1000);
			System.out.println(diffDays);
			Date today = new Date(diffDays);
			a = formatter.format(today);

		} catch (ParseException e) {
			e.printStackTrace();
		}

		System.out.println(a);

		return a;
	}

	@ResponseBody
	@RequestMapping(value = "caldate3", method = RequestMethod.POST)
	public String caldate3(String date) {
		System.out.println(3);
		System.out.println(date);
		String value = null;
		String a = null;
		try {

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date beginDate = formatter.parse(date);

			System.out.println(beginDate);

			long diff = beginDate.getTime();
			long diffDays = diff / (24 * 60 * 60 * 1000);
			diffDays = diffDays + 90;
			diffDays = diffDays*(24 * 60 * 60 * 1000);
			System.out.println(diffDays);
			Date today = new Date(diffDays);
			a = formatter.format(today);

		} catch (ParseException e) {
			e.printStackTrace();
		}

		System.out.println(a);

		return a;
	}

	@ResponseBody
	@RequestMapping(value = "caldate4", method = RequestMethod.POST)
	public String caldate4(String date) {
		System.out.println(4);
		System.out.println(date);
		String value = null;
		String a = null;
		try {

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date beginDate = formatter.parse(date);

			System.out.println(beginDate);

			long diff = beginDate.getTime();
			long diffDays = diff / (24 * 60 * 60 * 1000);
			diffDays = diffDays + 180;
			diffDays = diffDays*(24 * 60 * 60 * 1000);
			System.out.println(diffDays);
			Date today = new Date(diffDays);
			a = formatter.format(today);

		} catch (ParseException e) {
			e.printStackTrace();
		}

		System.out.println(a);

		return a;
	}

	// 공지사항 게시판 페이지 이동 및 리스트 불러오기
	@RequestMapping(value = "AnoticeList", method = RequestMethod.GET)
	public String AnoticeList(Model model, HttpSession session, String page) {
		// 페이지
		int currentPage = 1;
		int pagePerList = 10;
		int offset = 0;
		int countNoticeList = ANdao.getNoticeCount().size();

		int lastPage = (int) Math.ceil(((double) countNoticeList / 10.0));

		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		offset = (pagePerList * currentPage) - pagePerList;
		RowBounds rb = new RowBounds(offset, pagePerList);

		ArrayList<Anotice> noticeList = ANdao.selectAllNotice(rb);

		logger.info("공지사항 게시판 이동");
		session.setAttribute("noticelist", noticeList);
		model.addAttribute("noticelist", noticeList);
		model.addAttribute("currentpage", currentPage);
		model.addAttribute("countNoticeList", countNoticeList);
		model.addAttribute("lastPage", lastPage);

		return "Aviews/Anotice/AnoticeList";
	}

	// 공지사항 작성폼 이동
	@RequestMapping(value = "AnoticeWriteForm", method = RequestMethod.GET)
	public String AnoticeWriteForm(Model model, HttpSession session) {

		logger.info("공지사항 작성 폼 이동");

		DateFormat dateFormat = new SimpleDateFormat("yy/MM/dd HH:mm:ss");
		Date date = new Date();

		String sysdate = dateFormat.format(date);
		model.addAttribute("sysdate", sysdate);

		return "Aviews/Anotice/AnoticeWriteForm";
	}

	// 공지사항 작성하기
	@RequestMapping(value = "writeAnotice", method = RequestMethod.POST)
	public String writeAnotice(Anotice anotice, HttpSession session, String npopup) {

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

	// 게시글 읽기 페이지로 이동
	@RequestMapping(value = "AnoticeReadForm", method = RequestMethod.GET)
	public String readAnotice(Model model, String noticecode) {

		Anotice notice = ANdao.readAnotice(noticecode);

		model.addAttribute("notice", notice);

		return "Aviews/Anotice/AnoticeReadForm";
	}

}
