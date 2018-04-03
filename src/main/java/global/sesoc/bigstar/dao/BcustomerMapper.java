package global.sesoc.bigstar.dao;

import java.util.ArrayList;

import global.sesoc.bigstar.vo.Bcustomer;

public interface BcustomerMapper {
	
	public ArrayList<Bcustomer> selectbcustomer(int customercode);
	
	
}
