package global.sesoc.bigstar.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.bigstar.vo.Bcarttable;
@Repository
public class BcarttableDAO implements BcarttableMapper {
	
	@Autowired
	SqlSession session;
	
	@Override
	public ArrayList<Bcarttable> selectbcarttable(int customercode) {
		// TODO Auto-generated method stub
		
		return session.getMapper(BcarttableMapper.class).selectbcarttable(customercode);
	

	}

}
