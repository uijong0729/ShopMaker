package global.sesoc.bigstar.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.bigstar.vo.Bcustomer;
import global.sesoc.bigstar.vo.Bordertable;
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

	@Override
	public Bcustomer loginBcustomer(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return session.getMapper(BcustomerMapper.class).loginBcustomer(map);
	}

	@Override
	public ArrayList<Bcustomer> bCustomerList(String membercode) {
		// TODO Auto-generated method stub
		return session.getMapper(BcustomerMapper.class).bCustomerList(membercode);
	}

	@Override
	public int searchBcustomerid(String id) {
		// TODO Auto-generated method stub
		return session.getMapper(BcustomerMapper.class).searchBcustomerid(id);
	}

	@Override
	public ArrayList<Bordertable> BorderList(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return session.getMapper(BcustomerMapper.class).BorderList(map);
	}
	
	
	
	

}
