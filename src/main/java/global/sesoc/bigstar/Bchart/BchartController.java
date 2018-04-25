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
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.bigstar.dao.AmemberDAO;
import global.sesoc.bigstar.dao.BcustomerDAO;
import global.sesoc.bigstar.vo.Amember;
import global.sesoc.bigstar.vo.Avip;
import global.sesoc.bigstar.vo.Bcustomer;

@Controller
public class BchartController {

	@Autowired
	BcustomerDAO cdao;
	
	@Autowired
	AmemberDAO adao;
	
	@Autowired
	BcustomerDAO bdao;
	
	@RequestMapping(value="BcustomerChart", method={RequestMethod.GET, RequestMethod.POST})
	public String BcustomerChart() {
		
		return "Bviews/Bchart/BcustomerChart";
	}
	
	
	@ResponseBody
	@RequestMapping(value="getChart", method={RequestMethod.GET, RequestMethod.POST})
	public ArrayList<Integer> getChart(String membercode) {
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
		ArrayList<Integer> list = new ArrayList<Integer>();
		for (Integer integer : mon) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("membercode", membercode);
			map.put("bpushdate", integer);
			int nCustomer = cdao.countCustomer(map);
			list.add(nCustomer);
			//System.out.println("cus : " + nCustomer);
		}
			
		//현재월부터 차례대로 마이너스 한 달의 회원 수가 저장 된 리스트
		//System.out.println("list : " + list);
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="getClient", method={RequestMethod.GET, RequestMethod.POST})
	public ArrayList<Avip> getClient(String membercode) {
		ArrayList<Avip> vList = adao.selectVip(membercode);
		System.out.println(vList);
		
		for(int i = 0; i < vList.size() ; i++)
		{
			String getName = bdao.selectbcustomer(Integer.parseInt(vList.get(i).getCustomerCode())).getCustomername();
			vList.get(i).setCustomerCode(getName);
		}
		
		return vList;
	}
	
	@RequestMapping(value="BsaleChart", method= {RequestMethod.GET, RequestMethod.POST})
	public String BsaleChart() {
		
		return "Bviews/Bchart/BsaleChart";
	}
	
	
	
	
}
