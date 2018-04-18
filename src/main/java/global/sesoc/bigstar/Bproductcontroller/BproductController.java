package global.sesoc.bigstar.Bproductcontroller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.bigstar.dao.BproducttableDAO;
import global.sesoc.bigstar.vo.Bproducttable;

@Controller
public class BproductController {

	@Autowired
	BproducttableDAO Bpdao;

	@RequestMapping(value = "Bmainlist", method = RequestMethod.GET)
	public String goBmainlilst(Model model) {
		ArrayList<Bproducttable> Bproducttable = new ArrayList<Bproducttable>();
		ArrayList<String> nameset = new ArrayList<String>();
		ArrayList<String> imageset = new ArrayList<String>();
		ArrayList<String[]> imageset2 = new ArrayList<String[]>();
		
		int count=0;
		Bproducttable=Bpdao.selectallbproducttable();
		
		for (Bproducttable b : Bproducttable) {
			imageset.add(b.getProductname());
		}
		for (int i = 0; i < imageset.size(); i++) {
			if (!nameset.contains(imageset.get(i))) {
				nameset.add(imageset.get(i));
			}
		}
		imageset.clear();
		
		String temp[] = new String[nameset.size()];
		for (int i = 0; i < nameset.size(); i++) {
			for (int j = 0; j < Bproducttable.size(); j++) {
				if(nameset.get(i).equals(Bproducttable.get(j).getProductname())) {
					if (temp[i] == null || temp[i].length() == 0) {
						temp [i] = Bproducttable.get(j).getProductimage()+" , " ;
					} else {
						temp[i] += Bproducttable.get(j).getProductimage()+" , " ;
					}
				}
			}
		}
	
		

		
		for (int i = 0; i < temp.length; i++) {
			
			count++;
			String[] array = temp[i].trim().split(","); 
			imageset2.add(array);
			
		}
		
		System.out.println(count);
		model.addAttribute("nameset", nameset);
		model.addAttribute("Bproducttable", Bproducttable);
		model.addAttribute("count", count);
		
		model.addAttribute("rows", 4);
		return "Bviews/Bmainlist/Bmainlist";
	}
}
