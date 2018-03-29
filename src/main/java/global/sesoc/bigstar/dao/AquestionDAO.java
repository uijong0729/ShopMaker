package global.sesoc.bigstar.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.bigstar.vo.Aquestion;
@Repository
public class AquestionDAO implements AquestionMapper {
	
	@Autowired
	SqlSession session;
	
	@Override
	public ArrayList<Aquestion> selectaquestion(int qtablecode) {
		// TODO Auto-generated method stub
		
		return session.getMapper(AquestionMapper.class).selectaquestion(qtablecode);
	

	}

}
