package global.sesoc.bigstar.dao;

import java.util.ArrayList;
import java.util.HashMap;

import global.sesoc.bigstar.vo.Bcustomer;

public interface BcustomerMapper {
	
	public ArrayList<Bcustomer> selectbcustomer(int customercode);
	public int insertBcustomer(Bcustomer bcustomer);
	public Bcustomer loginBcustomer(HashMap<String, String> map);
	
}
