package global.sesoc.bigstar.dao;

import java.util.ArrayList;

import global.sesoc.bigstar.vo.Breviewtable;

public interface BreviewtableMapper {
	
	public ArrayList<Breviewtable> selectbreviewtable(int reviewcode);

	public ArrayList<Breviewtable> getReviewtableByName(String productname);
	
	
}
