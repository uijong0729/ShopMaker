package global.sesoc.bigstar.dao;

import java.util.ArrayList;
import java.util.HashMap;

import global.sesoc.bigstar.vo.Bcustomer;
import global.sesoc.bigstar.vo.Bordertable;

public interface BcustomerMapper {
	
	public ArrayList<Bcustomer> selectbcustomer(int customercode);
	public int insertBcustomer(Bcustomer bcustomer);
	public Bcustomer loginBcustomer(HashMap<String, String> map);
	public ArrayList<Bcustomer> bCustomerList(String membercode);
	public int searchBcustomerid(String id);
	public ArrayList<Bordertable> BorderList(HashMap<String, String> map);
}
