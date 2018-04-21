package global.sesoc.bigstar.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.bigstar.vo.Bcarttable;
import global.sesoc.bigstar.vo.Bproducttable;
@Repository
public class BcarttableDAO implements BcarttableMapper {
	
	@Autowired
	SqlSession session;
	
	@Override
	public ArrayList<Bcarttable> selectbcarttable(int customercode) {
		// TODO Auto-generated method stub
		return session.getMapper(BcarttableMapper.class).selectbcarttable(customercode);
	}

	@Override
	public Bproducttable getBproduct(int productcode) {
		// TODO Auto-generated method stub
		return session.getMapper(BcarttableMapper.class).getBproduct(productcode);
	}

	@Override
	public int insertBcart(Map<String, String> map) {
		// TODO Auto-generated method stub
		return session.getMapper(BcarttableMapper.class).insertBcart(map);
	}
	
	

}
