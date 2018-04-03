package global.sesoc.bigstar.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.bigstar.vo.Bnoticetable;
@Repository
public class BnoticetableDAO implements BnoticetableMapper {
	
	@Autowired
	SqlSession session;
	
	@Override
	public ArrayList<Bnoticetable> selectbnoticetable(int noticecode) {
		// TODO Auto-generated method stub
		
		return session.getMapper(BnoticetableMapper.class).selectbnoticetable(noticecode);
	

	}

}
