package global.sesoc.bigstar.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.bigstar.vo.Bordertable;
import global.sesoc.bigstar.vo.SalesVolumeByName;
import global.sesoc.bigstar.vo.SalesVolumeByOrderdate;
@Repository
public class BordertableDAO implements BordertableMapper {
	
	@Autowired
	SqlSession session;
	
	@Override
	public ArrayList<Bordertable> selectbordertable(int ordercode) {
		// TODO Auto-generated method stub
		
		return session.getMapper(BordertableMapper.class).selectbordertable(ordercode);
	

	}
	
	@Override
	public int insertBordertable(Bordertable order) {
		// TODO Auto-generated method stub
		
		return session.getMapper(BordertableMapper.class).insertBordertable(order);
	}
	
	@Override
	public ArrayList<SalesVolumeByName> getSalesVolumeByName(String membercode) {
		// TODO Auto-generated method stub
		return session.getMapper(BordertableMapper.class).getSalesVolumeByName(membercode);
	}

	public ArrayList<SalesVolumeByOrderdate> getSalesVolumeByOrderdate(String membercode) {
		// TODO Auto-generated method stub
		return session.getMapper(BordertableMapper.class).getSalesVolumeByOrderdate(membercode);
	}
	

}
