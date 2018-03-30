package global.sesoc.bigstar.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.bigstar.vo.Acomponent;
@Repository
public class AcomponentDAO implements AcomponentMapper {
	
	@Autowired
	SqlSession session;
	
	@Override
	public ArrayList<Acomponent> selectacomponent(int cpcode) {
		// TODO Auto-generated method stub
		
		return session.getMapper(AcomponentMapper.class).selectacomponent(cpcode);
	

	}

}
