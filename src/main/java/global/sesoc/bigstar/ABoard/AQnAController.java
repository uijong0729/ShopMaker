package global.sesoc.bigstar.ABoard;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

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
		public String AqnaPage(Model model) {
			
			List<Aquestion> qnaList;
			qnaList = AQdao.selectAllQuestion();
			System.out.println(qnaList);
			
			for (Aquestion aquestion : qnaList) {
				String membercode = aquestion.getMembercode();
				String name = AMdao.selectAcustomerName(membercode);
				HashMap<String, Object> map = new HashMap<String, Object>(); 
				map.put("aquestion", aquestion);
				map.put("name", name);
				
			}
			
			model.addAttribute("qnaList", qnaList);
			
			
			
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
			
			/*System.out.println("writeQna출력사항");
			System.out.println(membercode);
			System.out.println(qtitle);
			System.out.println(qcontent);
			System.out.println(qvisible);*/
			
			Aquestion aq = new Aquestion();
			
			aq.setMembercode(membercode);
			aq.setQtitle(qtitle);
			aq.setQcontent(qcontent);
			aq.setQvisible(qvisible);
			
			System.out.println("추가 된 문의 : " + AQdao.insertAQuestion(aq));
			
			return "confirm";
		}
		
	

	}


	

