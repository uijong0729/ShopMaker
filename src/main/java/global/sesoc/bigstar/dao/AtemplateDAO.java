package global.sesoc.bigstar.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.bigstar.vo.Atemplate;
@Repository
public class AtemplateDAO implements AtemplateMapper {
	
	@Autowired
	SqlSession session;
	
	@Override
	public ArrayList<Atemplate> selectatemplate(int templatecode) {
		// TODO Auto-generated method stub
		
		return session.getMapper(AtemplateMapper.class).selectatemplate(templatecode);
	

	}

}
