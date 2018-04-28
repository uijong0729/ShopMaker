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
	public String BpurchasePage(Model model, HttpSession session, String customercode, String productcode, int productQty) {
		/*
		//TODO: 카트 구매 알고리즘 구현 필요
		if (customercode == null) {
			
			logger.debug("초기화하지 않은 productQty: "+ productQty);
			logger.debug("초기화하지 않은 productcode: "+ productcode);
			
			
			return "Bviews/Bpurchase/Bpurchaseform";
		}
		*/
		
		/*
		 * 단품 구매 알고리즘
		 * 
		 * 원용수
		 * */
		Bcustomer bCustomer = (Bcustomer) session.getAttribute("Blogin");
		Amember aMember = (Amember) session.getAttribute("Amember");
		
		Bordertable order = new Bordertable();
		//실제 구동시에는 이 코드 사용(73줄 삭제 필요) : customercode = bCustomer.getCustomercode();
		customercode = "23";
		order.setCustomercode(customercode);
		//order.setMembercode(aMember.getMembercode());
		order.setMembercode("37");
		order.setProductcode(productcode);
		order.setOrderquantity(productQty);
		
		ArrayList<Bproducttable> purchaseList = BPdao.selectbproducttable(Integer.parseInt(productcode));
		Bproducttable purchaseProduct = purchaseList.get(0);
		System.out.println(purchaseProduct);
		int totalPrice = 0;
		
		for (int a = 0; a < purchaseList.size(); a++) {
			totalPrice += purchaseList.get(a).getProductprice() * order.getOrderquantity();
		}
		
		session.setAttribute("order", order);
		session.setAttribute("totalPrice", totalPrice);
		model.addAttribute("purchaseProduct", purchaseProduct);
		model.addAttribute("purchaseList", purchaseList);
		model.addAttribute("totalPrice", totalPrice);
		
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
	public String BpurchaseIndex(Model model, HttpSession session, String str_name, String str_email01, String str_email02, String str_phonenum, String baseAddress, String detailAddress) {
		
		Bordertable order = (Bordertable) session.getAttribute("order");
		String orderdeliverylocation = baseAddress+" "+detailAddress;
		order.setOrderdeliverylocation(orderdeliverylocation);
		System.out.println(baseAddress+" "+detailAddress);
		
		session.setAttribute("order", order);
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
		
		Bordertable order = (Bordertable) session.getAttribute("order");
		
		logger.debug(order.toString());
		
		//TODO: Bordertable order 데이터베이스에 INSERT 하기.
		int result = 0;
		result = BOdao.insertBordertable(order);
		
		return "Bviews/Bpurchase/BkakaopaySuccess"; 
	}
}
