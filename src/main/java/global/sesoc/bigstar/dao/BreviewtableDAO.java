package global.sesoc.bigstar.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.bigstar.vo.Bproducttable;
import global.sesoc.bigstar.vo.Breviewtable;
@Repository
public class BreviewtableDAO implements BreviewtableMapper {
	
	@Autowired
	SqlSession session;
	
	@Override
	public ArrayList<Breviewtable> selectbreviewtable(int reviewcode) {
		// TODO Auto-generated method stub
		
		return session.getMapper(BreviewtableMapper.class).selectbreviewtable(reviewcode);
	}
	
	@Override
	public ArrayList<global.sesoc.bigstar.vo.Breviewtable> getReviewtableByName(String productname) {
		// TODO Auto-generated method stub
		
		return session.getMapper(BreviewtableMapper.class).getReviewtableByName(productname);
	}

	

}
