package global.sesoc.bigstar.Bproductcontroller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.bigstar.dao.BproducttableDAO;
import global.sesoc.bigstar.vo.Bproducttable;
import net.sf.json.JSONArray;

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
		
		Map<String, String> arrMap = new HashMap<String, String>(); 
		
		for (int i = 0; i < Bproducttable.size(); i++) {
			if (arrMap.containsKey(Bproducttable.get(i).getProductname())) {
				String str = arrMap.get(Bproducttable.get(i).getProductname());
				arrMap.remove(Bproducttable.get(i).getProductname());
				arrMap.put(Bproducttable.get(i).getProductname(), str);
			}
			arrMap.put(Bproducttable.get(i).getProductname(), Bproducttable.get(i).getProductimage());
			
		}
		
		
		
		System.out.println(arrMap.get("key"));

		System.out.println(count);
		
		model.addAttribute("map", arrMap);
		model.addAttribute("nameset", nameset);
		model.addAttribute("Bproducttable", Bproducttable);
		model.addAttribute("count", count);
		
		model.addAttribute("rows", 4);
		return "Bviews/Bmainlist/Bmainlist";
	}
	
	@RequestMapping(value = "BpageMain", method = RequestMethod.GET)
	public String BpageMain(Model model) {
		
		
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
		
		Map<String, String> arrMap = new HashMap<String, String>(); 
		
		for (int i = 0; i < Bproducttable.size(); i++) {
			if (arrMap.containsKey(Bproducttable.get(i).getProductname())) {
				String str = arrMap.get(Bproducttable.get(i).getProductname());
				arrMap.remove(Bproducttable.get(i).getProductname());
				arrMap.put(Bproducttable.get(i).getProductname(), str);
			}
			arrMap.put(Bproducttable.get(i).getProductname(), Bproducttable.get(i).getProductimage());
			
		}
		
		JSONArray jsonArray = JSONArray.fromObject(Bproducttable);
		
		System.out.println(arrMap.get("key"));

		System.out.println(count);
		
		model.addAttribute("map", arrMap);
		model.addAttribute("nameset", nameset);
		model.addAttribute("Bproducttable", Bproducttable);
		model.addAttribute("count", count);
		model.addAttribute("json", jsonArray);
		model.addAttribute("rows", 4);
		return "Bviews/Bmain/BpageMain";
	}
	
	@RequestMapping(value="goBmain", method=RequestMethod.GET)
	public String goBmain(Model model) {
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
		
		Map<String, String> arrMap = new HashMap<String, String>(); 
		
		for (int i = 0; i < Bproducttable.size(); i++) {
			if (arrMap.containsKey(Bproducttable.get(i).getProductname())) {
				String str = arrMap.get(Bproducttable.get(i).getProductname());
				arrMap.remove(Bproducttable.get(i).getProductname());
				arrMap.put(Bproducttable.get(i).getProductname(), str);
			}
			arrMap.put(Bproducttable.get(i).getProductname(), Bproducttable.get(i).getProductimage());
			
		}
		
		JSONArray jsonArray = JSONArray.fromObject(Bproducttable);
		
		System.out.println(arrMap.get("key"));

		System.out.println(count);
		
		model.addAttribute("map", arrMap);
		model.addAttribute("nameset", nameset);
		model.addAttribute("Bproducttable", Bproducttable);
		model.addAttribute("count", count);
		model.addAttribute("json", jsonArray);
		model.addAttribute("rows", 4);
		return "Bviews/Bmain/Bmain";
	}
}
