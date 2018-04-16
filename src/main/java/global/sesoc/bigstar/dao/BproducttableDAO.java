package global.sesoc.bigstar.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.bigstar.vo.Bproducttable;
@Repository
public class BproducttableDAO implements BproducttableMapper {
	
	@Autowired
	SqlSession session;
	
	@Override
	public ArrayList<Bproducttable> selectbproducttable(int productcode) {
		// TODO Auto-generated method stub
		
		return session.getMapper(BproducttableMapper.class).selectbproducttable(productcode);
		

	}
	@Override
	public ArrayList<Bproducttable> selectallbproducttable() {
		// TODO Auto-generated method stub
		
		return session.getMapper(BproducttableMapper.class).selectallbproducttable();
		

	}
}
