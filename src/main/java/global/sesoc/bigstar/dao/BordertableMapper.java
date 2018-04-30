package global.sesoc.bigstar.dao;

import java.util.ArrayList;

import global.sesoc.bigstar.vo.Bordertable;
import global.sesoc.bigstar.vo.SalesVolumeByName;
import global.sesoc.bigstar.vo.SalesVolumeByOrderdate;

public interface BordertableMapper {
	
	public ArrayList<Bordertable> selectbordertable(int ordercode);

	public int insertBordertable(Bordertable order);

	public ArrayList<SalesVolumeByName> getSalesVolumeByName(String membercode);

	public ArrayList<SalesVolumeByOrderdate> getSalesVolumeByOrderdate(String membercode);
	
}
