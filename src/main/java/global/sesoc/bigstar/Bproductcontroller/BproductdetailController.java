package global.sesoc.bigstar.Bproductcontroller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.bigstar.dao.BproducttableDAO;
import global.sesoc.bigstar.dao.BquestiontableDAO;
import global.sesoc.bigstar.dao.BreviewtableDAO;
import global.sesoc.bigstar.vo.Bproducttable;
import global.sesoc.bigstar.vo.Bquestiontable;
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
	public String productdetail(Model model, String productname) {
		
		System.out.println(productname);
		
		//TODO: productname에 해당하는 Bproducttable 객체를 DB에서 불러오기. 이후 제품상세 페이지에 제품 정보 뿌려주기.
		//TODO: 상품 후기 및 상품 문의 DB 테이블 불러온 후 Bproductdetail 상품 후기 및 상품 문의 테이블 정보 불러오기.
		
		
//		ArrayList<Bquestiontable> questiontable = 
		
		ArrayList<Breviewtable> reviewtableList = RTdao.getReviewtableByName(productname);
		
		System.out.println("B리뷰테이블 리스트");
		for (Breviewtable breviewtable2 : reviewtableList) {
			System.out.println(breviewtable2);
		}
		
		ArrayList<Bproducttable> productDetailList = PTdao.getProductdetailListByName(productname);
		
		for (Bproducttable temp : productDetailList) {
			System.out.println(temp);
		}
		
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
	
	@RequestMapping(value="productReviewWrite", method=RequestMethod.GET)
	public String productReviewWrite() {
		
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
	

}
