package global.sesoc.bigstar.dao;

import java.util.ArrayList;
import java.util.HashMap;

import global.sesoc.bigstar.vo.Bproducttable;

public interface BproducttableMapper {
	
	public ArrayList<Bproducttable> selectbproducttable(int productcode);
	public ArrayList<Bproducttable> getProductdetailListByName(String productname);
	public ArrayList<Bproducttable> selectallbproducttable();
	public int insertbproducttable(Bproducttable bproducttable);

	public ArrayList<Bproducttable> selectkind();
	public ArrayList<Bproducttable> selectkindproduct(String productkind);
	public int delProduct(String pc);

	public Bproducttable getCart(HashMap<String, String> map); 

}
