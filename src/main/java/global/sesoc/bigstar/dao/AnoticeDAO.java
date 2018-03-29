package global.sesoc.bigstar.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.bigstar.vo.Anotice;
@Repository
public class AnoticeDAO implements AnoticeMapper {
	
	@Autowired
	SqlSession session;
	
	@Override
	public ArrayList<Anotice> selectanotice(int noticecode) {
		// TODO Auto-generated method stub
		
		return session.getMapper(AnoticeMapper.class).selectanotice(noticecode);
	

	}

}
