package global.sesoc.bigstar.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.bigstar.vo.Amember;
@Repository
public class AmemberDAO implements AmemberMapper {
	
	@Autowired
	SqlSession session;
	
	@Override
	public ArrayList<Amember> selectamember(int templatecode) {
		// TODO Auto-generated method stub
		
		return session.getMapper(AmemberMapper.class).selectamember(templatecode);
	

	}

}
