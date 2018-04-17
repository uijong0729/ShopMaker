package global.sesoc.bigstar.Bproductcontroller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.bigstar.dao.BproducttableDAO;
import global.sesoc.bigstar.dao.BreviewtableDAO;
import global.sesoc.bigstar.vo.Bproducttable;

@Controller
public class BproductdetailController {
	
	@Autowired
	BreviewtableDAO RTdao;
	
	@Autowired
	BproducttableDAO PTdao;
	
	@RequestMapping(value="goBproductdetail", method=RequestMethod.GET)
	public String productdetail(String productname) {
		
		System.out.println(productname);
		
		//TODO:productname에 해당하는 Bproducttable 객체를 DB에서 불러오기. 이후 제품상세 페이지에 제품 정보 뿌려주기.
		
		ArrayList<Bproducttable> productList = PTdao.getProductdetailListByName(productname);
		
		for (Bproducttable temp : productList) {
			System.out.println(temp);
		}
		
		return "Bviews/Bproduct/Bproductdetail";
	}
	
	@RequestMapping(value="basket", method=RequestMethod.GET)
	public String basket() {
		
		return "Bviews/Bproduct/Bbasket";
	}

}
