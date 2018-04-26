package global.sesoc.bigstar.Bpurchase;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.bigstar.dao.BcarttableDAO;
import global.sesoc.bigstar.dao.BordertableDAO;
import global.sesoc.bigstar.dao.BproducttableDAO;
import global.sesoc.bigstar.vo.Amember;
import global.sesoc.bigstar.vo.Bcarttable;
import global.sesoc.bigstar.vo.Bcustomer;
import global.sesoc.bigstar.vo.Bordertable;
import global.sesoc.bigstar.vo.Bproducttable;

@Controller
public class BpurchaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(BpurchaseController.class);
	
	@Autowired
	BproducttableDAO BPdao;
	
	@Autowired
	BcarttableDAO BCdao;
	
	@Autowired
	BordertableDAO BOdao;
	
	/*
	 * 제품상세페이지 '바로구매' 버튼 클릭 시 및 마이페이지의 장바구니 '구매하기' 작동
	 * 
	 * 원용수
	 * 
	 * */
	@RequestMapping(value = "goBpurchaseform", method = RequestMethod.GET) 
	public String BpurchasePage(Model model, HttpSession session, String productcode, int productQty) {
		
		Bcustomer bCustomer = (Bcustomer) session.getAttribute("Blogin");
		Amember aMember = (Amember) session.getAttribute("Amember");
		
		// 구입 관련 알고리즘 구현 필요!!
		// 예를들어, 하나의 상품을 구매하는 경우 또는 여러 상품을 동시에 구매하는 경우!
		// if productcode 가 하나인 경우 if else productcode가 여러개 인 경우
		
		Bordertable order = new Bordertable();
		order.setCustomercode(bCustomer.getCustomercode());
		//order.setMembercode(aMember.getMembercode());
		order.setMembercode("37");
		order.setProductcode(productcode);
		order.setOrderquantity(productQty);
		
		ArrayList <Bordertable> orderList = new ArrayList <Bordertable>();
		orderList.set(0, order);
		
		ArrayList<Bproducttable> purchaseList = BPdao.selectbproducttable(Integer.parseInt(productcode));
		
		
		// 구매정보 입력 페이지에 주문 품목 확인을 구현하기 위한 알고리즘
		// 현재는 하나만 저장하여 넣지만, 추후 작업은 for문을 통하여 여러개의 상품 정보를 리스트에 넣어야 한다.
		ArrayList<Object> purchaseListAndOrderList = new ArrayList<Object>();
		
		Map<String, Object> order1 = new HashMap<String, Object>();
		order1.put("orderList", orderList.get(0));
		order1.put("purchaseList", purchaseListAndOrderList.get(0));
		purchaseListAndOrderList.add(order1);
		/* 아래와 같이 여러개의 주문을 처리
		Map<String, Object> order2 = new HashMap<String, Object>();
		order2.put("orderList", orderList.get(1));
		order2.put("purchaseList", purchaseListAndOrderList.get(1));
		purchaseListAndOrderList.add(order2);
		*/
		session.setAttribute("order", order);
		model.addAttribute("purchaseListAndOrderList", purchaseListAndOrderList);
		
		return "Bviews/Bpurchase/Bpurchaseform";
	}
	
	/*
	 * Bbasket.jps에서 주문하기를 클릭하면 [액션 : goBpurchaseformFromCart] 을 실행한다.
	 * => 추후 goBpurchaseform 합칠 예정! 
	 * 
	 * 원용수
	 * 
	 * */
	@RequestMapping(value="goBpurchaseformFromCart", method=RequestMethod.GET)
	public String goBpurchaseformFromCart(HttpSession session){
		
		Bcustomer bCustomer = (Bcustomer) session.getAttribute("Blogin");
		
		ArrayList<Bcarttable> bCart = new ArrayList<Bcarttable>();
		
		//bCustomer의 membercode로 데이터베이스에서 bCustomer의 장바구니(Cart)불러오기.
		bCart = BCdao.selectbcarttable(Integer.parseInt(bCustomer.getCustomercode()));
		
		//오더리스트 VO 항목 심어주기
		ArrayList <Bordertable> orderList = new ArrayList <Bordertable>();
		
		session.setAttribute("orderList", orderList);
		
		return "Bviews/Bpurchase/Bpurchaseform";
	}
	
	@RequestMapping(value = "BpurchaseIndex", method = RequestMethod.POST)
	public String BpurchaseIndex(Model model, HttpSession session, String templateforValue, String paymentforValue, String daysforValue) {
//		System.out.println(templateforValue);
//		System.out.println(paymentforValue);
//		System.out.println(daysforValue);
		
		HashMap<String, String> BpurchaseInfo = new HashMap<String, String>();
		BpurchaseInfo.put("templateforValue", templateforValue);
		BpurchaseInfo.put("paymentforValue", paymentforValue);
		BpurchaseInfo.put("daysforValue", daysforValue);
		
		session.setAttribute("BpurchaseInfo", BpurchaseInfo);
		return "Bviews/Bpurchase/BkakaopayIndex";
	}
	
	@RequestMapping(value = "BkakaopayInfo", method = RequestMethod.GET)
	public String BkakaopayInfo(){
		
		return "Bviews/Bpurchase/BkakaopayInfo"; 
	}
	
	@RequestMapping(value = "BkakaopayInfo2", method = RequestMethod.POST)
	public String BkakaopayInfo2(){
		
		return "Bviews/Bpurchase/BkakaopayInfo2"; 
	}
	
	@RequestMapping(value = "BkakaopaySuccess", method = RequestMethod.GET)
	public String BkakaopaySuccess(Model model, HttpSession session, Locale locale){
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate);
		
		HashMap<String, String> BpurchaseInfo = (HashMap<String, String>) session.getAttribute("BpurchaseInfo");
		
		String templateforValue = BpurchaseInfo.get("templateforValue");
		String paymentforValue = BpurchaseInfo.get("paymentforValue");
		String daysforValue = BpurchaseInfo.get("daysforValue");
		
//		System.out.println(templateforValue);
//		System.out.println(paymentforValue);
//		System.out.println(daysforValue);
		
		model.addAttribute("templateforValue", templateforValue);
		model.addAttribute("paymentforValue", paymentforValue);
		model.addAttribute("daysforValue", daysforValue);
		
		return "Bviews/Bpurchase/BkakaopaySuccess"; 
	}
}
