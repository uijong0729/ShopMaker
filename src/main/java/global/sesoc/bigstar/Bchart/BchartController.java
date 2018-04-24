package global.sesoc.bigstar.Bchart;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.bigstar.dao.BcustomerDAO;
import global.sesoc.bigstar.vo.Amember;
import global.sesoc.bigstar.vo.Bcustomer;

@Controller
public class BchartController {

	@Autowired
	BcustomerDAO cdao;
	
	@RequestMapping(value="BcustomerChart", method=RequestMethod.GET)
	public String BcustomerChart(Model model, HttpSession session) {
		

		Calendar cal = Calendar.getInstance();
		int month = cal.get(Calendar.MONTH) + 1;
		
		ArrayList<Integer> mon = new ArrayList<Integer>();
		//현재월이 0번
		for (int i = 0 ; i <= 4 ; i++)
		{
			int dal = month - i;
			if(dal <= 0)
			{
				dal = dal + 12;
			}
			mon.add(dal);
		}
		
		//모델에 월 수가 담긴 리스트 
		String code = (String) session.getAttribute("loginCode");
		System.out.println(code);
		
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		for (Integer integer : mon) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("membercode", code);
			map.put("bpushdate", integer);
			int nCustomer = cdao.countCustomer(map);
			list.add(nCustomer);
		}
		
		//현재월부터 차례대로 마이너스 한 달의 회원 수가 저장 된 리스트
		model.addAttribute("monthList", list);
			
		return "Bviews/Bchart/BcustomerChart";
	}
	
	@RequestMapping(value="BsaleChart", method=RequestMethod.GET)
	public String BsaleChart() {
		
		
		return "Bviews/Bchart/BsaleChart";
	}
	
	
	
	
}
