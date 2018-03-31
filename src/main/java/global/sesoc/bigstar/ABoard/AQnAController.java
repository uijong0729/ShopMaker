package global.sesoc.bigstar.ABoard;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.bigstar.dao.AmemberDAO;
import global.sesoc.bigstar.dao.AquestionDAO;
import global.sesoc.bigstar.vo.Aquestion;

@Controller
public class AQnAController {
	
	@Autowired
	AquestionDAO AQdao;
	
	@Autowired
	AmemberDAO AMdao;
	
	
		@RequestMapping(value = "AqnaPage", method = {RequestMethod.GET, RequestMethod.POST})
		public String AqnaPage(Model model, String page) {
			
			//페이지
			int currentPage = 1;
			int pagePerList = 10;
			int offset = 0;
			int countQnaList = AQdao.getQnaCount();
			int lastPage = (int)Math.ceil(((double)countQnaList / 10.0));
			
			if(page != null)
			{
				currentPage = Integer.parseInt(page);
			}
			
			offset = (pagePerList * currentPage) - pagePerList;
			RowBounds rb = new RowBounds(offset, pagePerList);
			
			List<Aquestion> qnaList= AQdao.selectAllQuestion(rb);
			
			model.addAttribute("qnaList", qnaList);
			model.addAttribute("currentpage", currentPage);
			model.addAttribute("countQnaList", countQnaList);
			model.addAttribute("lastPage", lastPage);

			return "Aviews/Aboard/AqnaBoard";
		}
		
		@RequestMapping(value = "AquestionForm", method = {RequestMethod.GET, RequestMethod.POST})
		public String AquestionForm() {
			
			//System.out.println(AQdao.selectaquestion(0));
			
			return "Aviews/Aboard/AquestionForm";
		}
		
		@ResponseBody
		@RequestMapping(value = "writeQna", method = {RequestMethod.GET, RequestMethod.POST})
		public String writeQna(String membercode, String qtitle, String qcontent, String qvisible) {
			
			Aquestion aq = new Aquestion();
			
			aq.setMembercode(membercode);
			aq.setQtitle(qtitle);
			aq.setQcontent(qcontent);
			aq.setQvisible(qvisible);
			System.out.println(qvisible);
			//0 : 공개글
			//1 : 비밀글
			
			System.out.println("추가 된 문의 : " + AQdao.insertAQuestion(aq));
			
			return "confirm";
		}
		
		@ResponseBody
		@RequestMapping(value = "openQna", method = {RequestMethod.GET, RequestMethod.POST})
		public Aquestion writeQna(String what) {
			
			Aquestion aq = AQdao.selectaquestion(Integer.parseInt(what));
			
			
			return aq;
		}
		
		@ResponseBody
		@RequestMapping(value = "AqnaReply", method = {RequestMethod.GET, RequestMethod.POST})
		public Aquestion AqnaReply(String msg, String qtablecode, String req) {
			
			if(req.equals("1")) //추가
			{
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("qtablecode", qtablecode);
				map.put("qreply", msg);
				System.out.println("덧글추가 : " + AQdao.insertAreply(map));
				return AQdao.selectaquestion(Integer.parseInt(qtablecode));
			}
			else if(req.equals("2")) //삭제
			{
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("qtablecode", qtablecode);
				map.put("qreply", "");
				System.out.println("덧글삭제 : " + AQdao.insertAreply(map));
				return AQdao.selectaquestion(Integer.parseInt(qtablecode));
			}
			return null;
			
		}
		
		
	

	}


	

