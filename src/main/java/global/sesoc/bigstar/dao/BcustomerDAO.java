package global.sesoc.bigstar.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.bigstar.vo.Bcustomer;
@Repository
public class BcustomerDAO implements BcustomerMapper {
	
	@Autowired
	SqlSession session;
	
	@Override
	public ArrayList<Bcustomer> selectbcustomer(int customercode) {
		// TODO Auto-generated method stub
		
		return session.getMapper(BcustomerMapper.class).selectbcustomer(customercode);
	}

	@Override
	public int insertBcustomer(Bcustomer bcustomer) {
		// TODO Auto-generated method stub
		return session.getMapper(BcustomerMapper.class).insertBcustomer(bcustomer);
	}
	
	

}
