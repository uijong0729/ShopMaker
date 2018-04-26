package global.sesoc.bigstar.Bproductcontroller;

import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import global.sesoc.bigstar.common.util.FileService;
import global.sesoc.bigstar.dao.BproducttableDAO;
import global.sesoc.bigstar.vo.Amember;
import global.sesoc.bigstar.vo.Bproducttable;
import global.sesoc.bigstar.vo.Breviewtable;
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
	public String productInsert(Bproducttable bp, Model model, HttpSession session) {
		/*
		 * String productkind, String productname, String productprice, String
		 * productquantity, String productsize, String productcolor, String productspec,
		 * HttpServletResponse response
		 */
		/*Amember membercode = (Amember) session.getAttribute("Amember");

		bp.setMembercode(membercode.getMembercode());
		System.out.println(bp);
		// Bproducttable bproduct=new
		// Bproducttable(productname,Integer.parseInt(productprice),Integer.parseInt(productquantity),Integer.parseInt(productsize),productcolor,productspec,productkind,"37");

		Bpdao.insertbproducttable(bp);
		System.out.println("들어옴?");*/

		return "Bviews/Bproduct/goBmain";
	}

	@ResponseBody
	@RequestMapping(value = "kindselectproduct", method = RequestMethod.POST)
	public String kindselectproduct(String kind, Model model) {
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

	@ResponseBody
	@RequestMapping(value = "uploadproduct", method = RequestMethod.POST)
	public String upload(MultipartHttpServletRequest mhsq, HttpServletRequest hsreq, HttpSession session) {
		String imagesPath = hsreq.getSession().getServletContext().getRealPath("./resources/image");
		String reviewImgPath = "";
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)mhsq;

		java.util.Iterator<String> files = multipartRequest.getFileNames();
		//Iterator<String> files = mhsq.getFileNames();
	
		String img[] = new String[6];
		int count = 0;
		while (files.hasNext()) {

			String uploadFile = files.next();
			MultipartFile mFile = mhsq.getFile(uploadFile);
			img[count] = FileService.saveFile(mFile, imagesPath);
			count++;
		}
		
		String reviewtitle = mhsq.getParameter("reviewtitle");

		Bproducttable bproducttable = new Bproducttable();
		Amember member = (Amember) session.getAttribute("Amember");

		String membercode = member.getMembercode();

		bproducttable.setMembercode(membercode);
		bproducttable.setProductimage(img[0]);
		bproducttable.setProductimage1(img[1]);
		bproducttable.setProductimage2(img[2]);
		bproducttable.setProductimage3(img[3]);
		bproducttable.setProductimage4(img[4]);
		bproducttable.setProductimage5(img[5]);
		bproducttable.setProductkind(mhsq.getParameter("productkind"));
		bproducttable.setProductname(mhsq.getParameter("productname"));
		bproducttable.setProductprice(Integer.parseInt(mhsq.getParameter("productprice")));
		bproducttable.setProductquantity(Integer.parseInt(mhsq.getParameter("productquantity")));
		bproducttable.setProductsize(Integer.parseInt(mhsq.getParameter("productsize")));
		bproducttable.setProductcolor(mhsq.getParameter("productcolor"));
		bproducttable.setProductspec(mhsq.getParameter("productspec"));
		
		Bpdao.insertbproducttable(bproducttable);
		
		return "1";
	}

}
