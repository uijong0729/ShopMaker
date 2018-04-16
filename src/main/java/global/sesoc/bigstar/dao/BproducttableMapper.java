package global.sesoc.bigstar.dao;

import java.util.ArrayList;

import global.sesoc.bigstar.vo.Bproducttable;

public interface BproducttableMapper {
	
	public ArrayList<Bproducttable> selectbproducttable(int productcode);
	public ArrayList<Bproducttable> selectallbproducttable();
	
	
}
