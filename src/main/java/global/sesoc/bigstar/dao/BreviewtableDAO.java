package global.sesoc.bigstar.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.bigstar.vo.Breviewtable;
@Repository
public class BreviewtableDAO implements BreviewtableMapper {
	
	@Autowired
	SqlSession session;
	
	@Override
	public ArrayList<Breviewtable> getReviewtableByName(String productname) {
		// TODO Auto-generated method stub
		
		return session.getMapper(BreviewtableMapper.class).getReviewtableByName(productname);
	}

	public int insertReview(Breviewtable bReviewtable){
		
		int result = 0;
		
		result = session.getMapper(BreviewtableMapper.class).insertReview(bReviewtable);
		
		return result;
	}

	public Breviewtable selectBreviewtable(String reviewcode) {
		// TODO Auto-generated method stub
		return session.getMapper(BreviewtableMapper.class).selectBreviewtable(reviewcode);
	}

	public void delReview(String reviewcode) {
		session.getMapper(BreviewtableMapper.class).delReview(reviewcode);
	}

}
