package global.sesoc.bigstar.Bproductcontroller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.bigstar.Bmember.BmemberController;
import global.sesoc.bigstar.dao.BproducttableDAO;
import global.sesoc.bigstar.dao.BquestiontableDAO;
import global.sesoc.bigstar.dao.BreviewtableDAO;
import global.sesoc.bigstar.vo.Bcustomer;
import global.sesoc.bigstar.vo.Bproducttable;
import global.sesoc.bigstar.vo.Breviewtable;

@Controller
public class BproductdetailController {
	
	@Autowired
	BreviewtableDAO RTdao;
	
	@Autowired
	BproducttableDAO PTdao;
	
	@Autowired
	BquestiontableDAO QTdao;
	
	@RequestMapping(value="goBproductdetail", method=RequestMethod.GET)
	public String productdetail(HttpSession session, Model model, String productname) {
		
		System.out.println(productname);
		
//		Bcustomer customer = (Bcustomer) session.getAttribute("Blogin");
//		
//		System.out.println(customer.getCustomercode());
			
		//TODO: productname에 해당하는 Bproducttable 객체를 DB에서 불러오기. 이후 제품상세 페이지에 제품 정보 뿌려주기.
		//TODO: 상품 후기 및 상품 문의 DB 테이블 불러온 후 Bproductdetail 상품 후기 및 상품 문의 테이블 정보 불러오기.
		
		
//		ArrayList<Bquestiontable> questiontable = 
		
		ArrayList<Breviewtable> reviewtableList = RTdao.getReviewtableByName(productname);
		
//		System.out.println("B리뷰테이블 리스트");
//		for (Breviewtable breviewtable2 : reviewtableList) {
//			System.out.println(breviewtable2);
//		}
		
		ArrayList<Bproducttable> productDetailList = PTdao.getProductdetailListByName(productname);
		
//		System.out.println("BproductDetailList 리스트");
//		for (Bproducttable temp : productDetailList) {
//			System.out.println(temp);
//		}
		
		model.addAttribute("productDetailList", productDetailList);
		model.addAttribute("reviewtableList", reviewtableList);
		
		return "Bviews/Bproduct/Bproductdetail";
	}
	
	@RequestMapping(value="basket", method=RequestMethod.GET)
	public String basket() {
		
		return "Bviews/Bproduct/Bbasket";
	}
	
	@RequestMapping(value="productInsert", method=RequestMethod.GET)
	public String productInsert() {
		
		return "Bviews/Bproduct/ProductInsert";
	}
	
	@RequestMapping(value="productReview", method=RequestMethod.GET)
	public String productReview() {
		
		return "Bviews/Bproduct/ProductReview";
	}
	
	/*
	 * 상품문의 작성 페이지로 이동
	 * 
	 * */
	@RequestMapping(value="goProductReviewWrite", method=RequestMethod.GET)
	public String goProductReviewWrite(HttpSession session, String productcode) {
		
		System.out.println("productReview 시작");
		
		System.out.println(productcode);
		
		return "Bviews/Bproduct/ProductReviewWrite";
	}
	
	/*
	 * 상품문의 게시글 등록
	 * 
	 * */
	@RequestMapping(value="productReviewWrite", method=RequestMethod.GET)
	public String productReviewWrite(HttpSession session, String membercode) {
		
		System.out.println("productReview 등록");
		
		System.out.println("membercode: "+membercode);
		
		return "Bviews/Bproduct/ProductReviewWrite";
	}
	
	@RequestMapping(value="Bqnalist", method=RequestMethod.GET)
	public String Bnotice() {
		
		return "Bviews/Bboard/Bqnalist";
	}
	
	@RequestMapping(value="Bqnawriteform", method=RequestMethod.GET)
	public String Bqnawriteform() {
		
		return "Bviews/Bboard/Bqnawriteform";
	}
	
	@RequestMapping(value="Bqnaread", method=RequestMethod.GET)
	public String Bqnaread() {
		
		return "Bviews/Bboard/Bqnaread";
	}
	
	@RequestMapping(value="Bnoticelist", method=RequestMethod.GET)
	public String Bnoticelist() {
		
		return "Bviews/Bboard/Bnoticelist";
	}
	
	@RequestMapping(value="Bnoticewrite", method=RequestMethod.GET)
	public String Bnoticewrite() {
		
		return "Bviews/Bboard/Bnoticewrite";
	}
	
	@RequestMapping(value="Bpurchaseform", method=RequestMethod.GET)
	public String Bpurchaseform() {
		
		return "Bviews/Bboard/Bpurchaseform";
	}
	
	
	

}
