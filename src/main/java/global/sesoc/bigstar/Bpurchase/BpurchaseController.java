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
	 * - 단품 구매 알고리즘
	 * 
	 * 원용수
	 * 
	 * */
	@RequestMapping(value = "goBpurchaseform", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String BpurchasePage(Model model, HttpSession session, String customercode, String productcode, int productQty) {
		
		Bcustomer bCustomer = (Bcustomer) session.getAttribute("Blogin");
		
		Amember aMember = (Amember) session.getAttribute("Amember");
		
		String membercode = aMember.getMembercode();
		customercode = bCustomer.getCustomercode();
		
		Bordertable order = new Bordertable();
		order.setCustomercode(customercode);
		order.setMembercode(membercode);
		order.setProductcode(productcode);
		order.setOrderquantity(productQty);
		
		ArrayList<Bproducttable> purchaseList = BPdao.selectbproducttable(Integer.parseInt(productcode));
		Bproducttable purchaseProduct = purchaseList.get(0);

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
	
	
	/*
	 * Bbasket.jps에서 주문하기를 클릭하면 [액션 : goBpurchaseformFromCart] 을 실행한다.
	 * - 카트 구매 알고리즘 구현 필요
		if (customercode == null) {
			
			logger.debug("초기화하지 않은 productQty: "+ productQty);
			logger.debug("초기화하지 않은 productcode: "+ productcode);
			
			
			return "Bviews/Bpurchase/Bpurchaseform";
		}
		
	 * 원용수
	 * 
	 * */
	
	@RequestMapping(value="goBpurchaseformFromCart", method={RequestMethod.GET, RequestMethod.POST})
	public String goBpurchaseformFromCart(Model model, HttpSession session, String customercode){
		
		Amember aMember = (Amember) session.getAttribute("Amember");
		Bcustomer bCustomer = (Bcustomer) session.getAttribute("Blogin");
		
		ArrayList<Bproducttable> bCart = BPdao.getCart(customercode);
		
		for (Bproducttable bproducttable : bCart) {
			logger.debug("bCart 리스트: "+bproducttable.toString());
		}
		
		//오더리스트 VO 항목 심어주기
		ArrayList <Bordertable> orderList = new ArrayList <Bordertable>();
		
		for (int i = 0; i < bCart.size(); i++) {
			Bordertable order = new Bordertable();
			order.setCustomercode(customercode);
			order.setMembercode(aMember.getMembercode());
			order.setProductcode(bCart.get(i).getProductcode());
			order.setOrderquantity(bCart.get(i).getProductquantity());
			orderList.add(order);
		}
		
		for (Bordertable bordertable : orderList) {
			logger.debug("오더리스트 VO 항목 심어준 결과"+bordertable.toString());
		}
		
		int totalPrice = 0;
		
		for (int a = 0; a < bCart.size(); a++) {
			System.out.println("제품가격: "+bCart.get(a).getProductprice());
			System.out.println("주문수량: "+bCart.get(a).getProductquantity());
			totalPrice += bCart.get(a).getProductprice() * bCart.get(a).getProductquantity();
			System.out.println(totalPrice);
		}
		
		session.setAttribute("orderList", orderList);
		session.setAttribute("totalPrice", totalPrice);
		model.addAttribute("purchaseList", bCart);
		model.addAttribute("totalPrice", totalPrice);
		
		return "Bviews/Bpurchase/BpurchaseformFromCart";
	}
	

	@RequestMapping(value = "BpurchaseIndexFromCart", method = RequestMethod.POST)
	public String BpurchaseIndexFromCart(Model model, HttpSession session, String str_name, String str_email01, String str_email02, String str_phonenum, String baseAddress, String detailAddress) {
		
		String orderdeliverylocation = baseAddress+" "+detailAddress;
		logger.debug(baseAddress+" "+detailAddress);

		ArrayList <Bordertable> orderList = (ArrayList <Bordertable>) session.getAttribute("orderList");
		for (Bordertable bordertable : orderList) {
			
			bordertable.setOrderdeliverylocation(orderdeliverylocation);
		}
		
		session.setAttribute("orderList", orderList);
		
		return "Bviews/Bpurchase/BkakaopayIndexFromCart";
	}
	
	@RequestMapping(value = "BkakaopayInfoFromCart", method = RequestMethod.GET)
	public String BkakaopayInfoFromCart(){
		
		return "Bviews/Bpurchase/BkakaopayInfoFromCart"; 
	}
	
	@RequestMapping(value = "BkakaopayInfo2FromCart", method = RequestMethod.POST)
	public String BkakaopayInfo2FromCart(){
		
		return "Bviews/Bpurchase/BkakaopayInfo2FromCart"; 
	}
	
	@RequestMapping(value = "BkakaopaySuccessFromCart", method = RequestMethod.GET)
	public String BkakaopaySuccessFromCart(Model model, HttpSession session, Locale locale){
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate);
		
		ArrayList <Bordertable> orderList = (ArrayList <Bordertable>) session.getAttribute("orderList");
		
		int result = 0;
		
		//데이터베이스에 주문리스트 데이터 주문내역 입력
		for (int i = 0; i < orderList.size(); i++) {
			logger.debug(orderList.get(i).toString());
			result += BOdao.insertBordertable(orderList.get(i));
		}
		
		logger.debug("DataBase Insert - Result: "+Integer.toString(result));
		
		//유저 카트리스트 비우기
		BCdao.deleteBcart(orderList.get(0).getCustomercode());
		
		return "Bviews/Bpurchase/BkakaopaySuccessFromCart"; 
	}
	
}
