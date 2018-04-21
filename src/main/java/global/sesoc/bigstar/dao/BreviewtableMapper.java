package global.sesoc.bigstar.dao;

import java.util.ArrayList;

import global.sesoc.bigstar.vo.Breviewtable;

public interface BreviewtableMapper {
	
	public ArrayList<Breviewtable> getReviewtableByName(String productname);
	
	public int insertReview(Breviewtable bReviewtable);

	public Breviewtable selectBreviewtable(String reviewcode);
	
}
