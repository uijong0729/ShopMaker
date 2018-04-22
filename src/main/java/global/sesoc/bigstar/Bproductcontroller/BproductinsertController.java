package global.sesoc.bigstar.Bproductcontroller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.bigstar.dao.BproducttableDAO;
import global.sesoc.bigstar.vo.Amember;
import global.sesoc.bigstar.vo.Bproducttable;
import net.sf.json.JSONArray;

@Controller
public class BproductinsertController {

	@Autowired
	BproducttableDAO Bpdao;

	@RequestMapping(value = "goBproductinsert", method = RequestMethod.GET)
	public String productInsert(Model model) {
		ArrayList<Bproducttable> Bproducttable = new ArrayList<Bproducttable>();
		ArrayList<Bproducttable> Bproducttable2 = new ArrayList<Bproducttable>();
		Bproducttable = Bpdao.selectkind();
		Bproducttable2 = Bpdao.selectallbproducttable();
		
		JSONArray jsonArray = JSONArray.fromObject(Bproducttable2);
		
		System.out.println("up : " + Bproducttable2);
		model.addAttribute("selectkind", Bproducttable);
		model.addAttribute("json", jsonArray);
		model.addAttribute("allproduct", Bproducttable2);
		
		
		return "Bviews/Bproduct/ProductInsert";
	}

	@RequestMapping(value = "insertproduct", method = RequestMethod.POST)
	public String productInsert(Bproducttable bp, Model model,
			HttpSession session) {/*
									 * String productkind, String productname, String productprice, String
									 * productquantity, String productsize, String productcolor, String productspec,
									 * HttpServletResponse response
									 */
		Amember membercode=(Amember) session.getAttribute("Amember");
		
		bp.setMembercode(membercode.getMembercode());
		System.out.println(bp);
		// Bproducttable bproduct=new
		// Bproducttable(productname,Integer.parseInt(productprice),Integer.parseInt(productquantity),Integer.parseInt(productsize),productcolor,productspec,productkind,"37");

		Bpdao.insertbproducttable(bp);
		System.out.println("들어옴?");

		return "Bviews/Bproduct/goBmain";
	}

	@ResponseBody
	@RequestMapping(value = "kindselectproduct", method = RequestMethod.POST)
	public String kindselectproduct(String kind,Model model) {
		ArrayList<Bproducttable> Bproducttable2 = new ArrayList<Bproducttable>();
		Bproducttable2 = Bpdao.selectkindproduct(kind);
		System.out.println("down : " + Bproducttable2);
		


		return "yeah";

	}
	@RequestMapping(value = "delProduct", method = RequestMethod.GET)
	public String delProduct(String productcode) {
		Bpdao.delProduct(productcode);

		return "Bviews/Bproduct/goBmain";

	}
}
