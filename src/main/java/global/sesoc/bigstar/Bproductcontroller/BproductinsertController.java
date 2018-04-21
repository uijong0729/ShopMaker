package global.sesoc.bigstar.Bproductcontroller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.bigstar.dao.BproducttableDAO;
import global.sesoc.bigstar.vo.Bproducttable;

@Controller
public class BproductinsertController {

	@Autowired
	BproducttableDAO Bpdao;

	@RequestMapping(value = "goBproductinsert", method = RequestMethod.GET)
	public String productInsert() {

		
		return "Bviews/Bproduct/ProductInsert";
	}
	@RequestMapping(value = "insertproduct", method = RequestMethod.POST)
	public String productInsert(Bproducttable bp, Model model,
			HttpSession session) {/*
		String productkind, String productname, String productprice, String productquantity,
		String productsize, String productcolor, String productspec, HttpServletResponse response*/
		bp.setMembercode("37");
		System.out.println(bp);
		//Bproducttable bproduct=new Bproducttable(productname,Integer.parseInt(productprice),Integer.parseInt(productquantity),Integer.parseInt(productsize),productcolor,productspec,productkind,"37");
		
		Bpdao.insertbproducttable(bp);
		System.out.println("들어옴?");
		
		return "Bviews/Bproduct/ProductInsert";
	}
}
